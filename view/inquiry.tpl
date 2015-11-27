<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>{{ title }}</title>
  </head>
  <body>
    <div id="content">
      <form id="form1" name="form1" action="./" method="POST">
        <table>
          <tr><th>title</th><td>
            <input type="text" name="title"/>
          </td></tr>
          <tr><th>checkbox</th><td><label>
            <input type="checkbox" name="chk" value="chkval" checked=checked/>
          </label></td></tr>
          <tr><th>radio1</th><td><label>
            <input type="radio" name="rdo" value="rdoval1" checked=checked/>
          </label></td></tr>
          <tr><th>radio2</th><td><label>
            <input type="radio" name="rdo" value="rdoval2" />
          </label></td></tr>
          <tr><th>select</th><td><label>
            <select name="select">
              <option value="1">1</option>
              <option value="2" selected=selected>2</option>
            </select>
          </label></td></tr>
          <tr><th>textarea</th><td>
            <textarea id="body" name="body" cols="80" rows="20" placeholder="hoge"></textarea>
          </td></tr>
          <tr><th><input type="submit" value="Send"></th><td></td></tr>
        </table>
      </form>
      <div>{{ message1 }}</div>

      <form id="form2" name="form2" action="./" method="POST">
        <table>
          <tr><th>title</th><td>
            <input type="text" name="title"/>
          </td></tr>
          <tr><th>checkbox</th><td><label>
            <input type="checkbox" name="chk" value="chkval1" checked=checked/>
            <input type="checkbox" name="chk" value="chkval2" checked=checked/>
            <input type="checkbox" name="chk" value="chkval3" checked=checked/>
          </label></td></tr>
          <tr><th>radio1</th><td><label>
            <input type="radio" name="rdo" value="rdoval1" checked=checked/>
          </label></td></tr>
          <tr><th>radio2</th><td><label>
            <input type="radio" name="rdo" value="rdoval2" />
          </label></td></tr>
          <tr><th>select</th><td><label>
            <select name="select" multiple="multiple">
              <option value="1">1</option>
              <option value="2" selected=selected>2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </label></td></tr>
          <tr><th>textarea</th><td>
            <textarea id="body" name="body" cols="80" rows="20" placeholder="hoge"></textarea>
          </td></tr>
          <tr><th><input type="submit" value="Send"></th><td></td></tr>
        </table>
      </form>
      <div>{{ message2 }}</div>
    </div>
  </body>
</html>
