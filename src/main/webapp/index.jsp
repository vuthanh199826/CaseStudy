<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/5/2021
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  $END$
  <div align="center">
  <form action="/Servlet" method="get">
    <input type="hidden" name="action" value="login">
  USERNAME <input type="text" name="username"><br/>
  PASSWORD <input type="text" name="password">
    <button type="submit">login</button>
  </form>
  </div>
  </body>
</html>
