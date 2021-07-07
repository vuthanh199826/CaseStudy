<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/6/2021
  Time: 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <a href="/Posts">ALL list post</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ID POST</th>
            <th>NGAY BAT DAU</th>
            <th>NGAY KET THUC</th>
            <th>KHACH ORDER</th>
        </tr>
<c:forEach var="order" items="${orders}">
    <tr>
        <td>${order.id}</td>
        <td>${order.idPost}</td>
        <td>${order.ngaybatdau}</td>
        <td>${order.ngayketthuc}</td>
        <td>${order.username}</td>
        <td>${order.status}</td>
        <td><a href="/Orders?action=apply&idPost=${order.idPost}&id=${order.id}">Apply</a></td>
    </tr>
</c:forEach>
    </table>
</div>
</body>
</html>
