<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/6/2021
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/Servlet">ALL list post</a>
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
    <c:forEach var="post" items="${mypost}">
        <tr>
            <td>${post.id}</td>
            <td>${post.userName}</td>
            <td>${post.title}</td>
            <td>${post.price}</td>
            <td>${post.address}</td>
            <td><img width="150px" height="150px" src="${post.img}"></td>
            <td>${post.describe}</td>
            <td>${post.status}</td>

            <td><a href="Posts?action=edit&id=${post.id}">edit</a></td>


            <td><a href="Posts?action=delete&id=${post.id}">delete</a></td>


        </tr>
    </c:forEach>
</table>
</body>
</html>
