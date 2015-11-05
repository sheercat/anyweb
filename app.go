package main

import (
	"bytes"
	"net/http"

	"encoding/gob"

	"github.com/flosch/pongo2"
	"github.com/gorilla/sessions"
	"github.com/k0kubun/pp"
	"github.com/sheercat/fillinform"
	"github.com/zenazn/goji"
	"github.com/zenazn/goji/web"
	"github.com/zenazn/goji/web/middleware"
)

var store = sessions.NewCookieStore([]byte("hogehogehogehogehoge"))

func inquiry(c web.C, w http.ResponseWriter, r *http.Request) {
	if tpl, err := pongo2.DefaultSet.FromFile("inquiry.tpl"); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	} else {
		session, _ := store.Get(r, "inqury")
		message := ""
		msg := session.Values["message"]
		_, ok := msg.(string)
		if ok {
			message = msg.(string)
			session.Values["message"] = nil
			session.Save(r, w)
		}

		bytes, err := tpl.ExecuteBytes(pongo2.Context{"title": "inquiry", "message": message})
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
		formData := session.Values["formData"]
		if formData != nil {
			pp.Println(formData)
			bytes, err = fillinform.Fill(&bytes, formData.(map[string]interface{}), nil)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
			}
		}
		w.Write(bytes)
	}
}

func sendInquiry(c web.C, w http.ResponseWriter, r *http.Request) {

	formData := make(map[string]interface{})
	keys := []string{"body", "title", "rdo", "chk"}
	for _, key := range keys {
		formData[key] = r.FormValue(key)
	}

	session, _ := store.Get(r, "inqury")
	session.Values["message"] = "send inquery"

	buf := new(bytes.Buffer)
	gob.Register(map[string]interface{}{})
	enc := gob.NewEncoder(buf)
	if err := enc.Encode(&formData); err != nil {
		pp.Println(err)
	}
	session.Values["formData"] = formData
	if err := session.Save(r, w); err != nil {
		pp.Println(err)
	}

	http.Redirect(w, r, "/", http.StatusFound)
}

func main() {
	pongo2.DefaultLoader.SetBaseDir("view")

	goji.Use(middleware.Recoverer)
	goji.Use(middleware.NoCache)

	goji.Get("/", inquiry)
	goji.Post("/", sendInquiry)

	goji.Serve()
}
