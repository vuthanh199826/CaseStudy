<%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 7/8/2021
  Time: 9:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/user">
    <input name="action" value="update" hidden>
    Tên : ${updateUser.username}"
    <input name="username" value="${updateUser.username}" placeholder="${l.username}" type="hidden">
    <br>
    <input name="password" value="${updateUser.password}" placeholder="${l.password}"><br>
    : <br>
    <input name="name" value="${updateUser.name}" placeholder="${l.name}"><br>
    : <br>
    <input name="address" value="${updateUser.address}" placeholder="${l.address}"><br>
    : <br>
    <input name="phone" value="${updateUser.phone}" placeholder="${l.phone}"><br>
    <br>Nhập Sdt
    <input name="role" value="${updateUser.role}" placeholder="${l.role}"><br>
    <input type="submit" value="Cập Nhật">
</form>
</body>
</html>
