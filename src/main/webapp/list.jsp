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
    <title>Posts</title>
    <style>
        body {
            color: white;
            background-color: black;
        }
    </style>
</head>
<body>
<a href="/Servlet?action=logout">log out</a>
<div align="center">
    list post
    <a href="/Orders?action=order">My order</a>
    <a href="/Posts?action=mypost">My posts</a>
    <a href="/Posts?action=create">Create post</a>
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
                <td>
                    <a href="/Comments?action=showComment&idPost=${post.id}">cmt</a>
                    <table border="1">
                        <tr>
                            <td>ID</td>
                            <td>IDPOST</td>
                            <td>USERNAME</td>
                            <td>DETAIL</td>
                        </tr>

                        <c:forEach var="cmt" items="${comments}">
                            <c:if test="${post.id == cmt.idPost}">
                            <tr>
                                <td>${cmt.id}</td>
                                <td>${cmt.idPost}</td>
                                <td>${cmt.username}</td>
                                <td>${cmt.detail}</td>
                            </tr>
                            </c:if>
                        </c:forEach>

                    </table>
                </td>
                <td>
                    <form action="/Comments" method="post">
                        <input type="hidden" name="action" value="createComment">
                        <input type="hidden" name="idPost" value="${post.id}">
                        <input type="text" name="detail">
                        <button type="submit"><=</button>
                    </form>
                </td>


                <td><a href="Orders?action=thue&id=${post.id}">Thue</a></td>


            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
