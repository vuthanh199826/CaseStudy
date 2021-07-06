<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/5/2021
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            color: white;
            background-color: black;
        }
    </style>
</head>
<body>
<a href="/Servlet?action=logout">log out</a>
<div align="center">
    list post
    <a href="/Servlet?action=order">My order</a>
    <a href="/Servlet?action=mypost">My posts</a>
    <a href="/Servlet?action=create">Create post</a>
<%--    <form method="get">--%>
<%--        <input type="hidden" name="action" value="create">--%>
<%--        <input type="hidden" name="username" value="">--%>
<%--        <input type="hidden" name="password" value="">--%>
<%--        <button>Create post</button>--%>
<%--    </form>--%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>USERNAME</th>
        <th>TITLE</th>
        <th>PRICE</th>
        <th>ADDRESS</th>
        <th>IMG</th>
        <th>DESCRIBE</th>
        <th>STATUS</th>
    </tr>
    <c:forEach var="post" items="${posts}">
        <tr>
            <td>${post.id}</td>
            <td>${post.userName}</td>
            <td>${post.title}</td>
            <td>${post.price}</td>
            <td>${post.address}</td>
            <td><img width="150px" height="150px" src="${post.img}"></td>
            <td>${post.describe}</td>
            <td>${post.status}</td>

                <td><a href="Servlet?action=thue&id=${post.id}">Thue</a></td>


        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
