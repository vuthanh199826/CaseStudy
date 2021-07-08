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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body{
            background: url("https://media.giphy.com/media/W1fFapmqgqEf8RJ9TQ/giphy.gif");
            background-size: auto;
        }
    </style>
</head>
<body>
<div align="center" class="pt-2">
    <a href="Posts" class="btn btn-outline-primary"><img width="30px" src="https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/blue_repicthousebase_1484336386-1.png">HOME</a>
</div>
<div align="center" class="pt-2">
    <table style="width: 1200px" class="table table-dark pt-2" border="1">
        <tr align="center" class="table-active">
<%--            <th>ID</th>--%>
<%--            <th>ID POST</th>--%>
            <th>KHACH ORDER</th>
            <th>NGAY BAT DAU</th>
            <th>NGAY KET THUC</th>
            <th>TRANG THAI</th>
            <th></th>

        </tr>
<c:forEach var="order" items="${orders}">
    <tr align="center">
<%--        <td>${order.id}</td>--%>
<%--        <td>${order.idPost}</td>--%>
        <td>${order.username}</td>
        <td>${order.ngaybatdau}</td>
        <td>${order.ngayketthuc}</td>
        <td>${order.status}</td>
        <td><a class="btn btn-outline-primary " href="/Orders?action=apply&idPost=${order.idPost}&id=${order.id}">Apply</a></td>
    </tr>
</c:forEach>
    </table>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>



