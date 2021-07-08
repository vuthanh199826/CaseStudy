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
</head>
<body>
<b>${sessionScope.get("userLogin").name}</b>
<button type="button">
    <a href="/index.jsp">
        ${session.removeAttribute("userLogin").name}log out</a>
</button>

<div align="center">
    list post<form method="post">
    <a href="/user?action=create">New User</a>
</form>


    <table border="1">
        <tr>

            <td>USERNAME</td>
            <td>Password</td>
            <td>Name</td>
            <td>ADDRESS</td>
            <td>Phone</td>
            <td>Role</td>
            <td>Action</td>
        </tr>
        <c:forEach var="l" items="${listUser}">
            <tr>

                <td>${l.username}</td>
                <td>${l.password}</td>
                <td>${l.name}</td>
                <td>${l.address}</td>
                <td>${l.phone}</td>
                <td>${l.role}</td>

                <form action="/user" method="post">
                    <input type="text" name="username" value="${l.username}" hidden>
                    <input type="text" name="action" value="update" hidden>
                    <td><a href="/user?action=update&username=${l.username}">Update</a></td>
                </form>
                <td>
                    <form action="/user" method="post">
                        <input type="text" name="username" value="${l.username}" hidden>
                        <input type="text" name="action" value="delete" hidden>
                        <button type="submit">delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <p>${message}</p>
</div>
</body>
</html>
