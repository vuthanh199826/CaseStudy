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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        body {
            background-image: url("https://picfiles.alphacoders.com/457/thumb-1920-457298.jpg");
        }

        td, th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background: #5e6472  !important;">
    <div class="container-fluid">
        <a class="navbar-brand" style="color: red" href="/user">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <%--                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"--%>
                    <%--                                           data-bs-toggle="dropdown" aria-expanded="false">--%>
                    <%--                                           Action User--%>
                    <%--                                        </a>--%>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%--                        <li><a class="dropdown-item" href="#">Update</a></li>--%>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <%--                        <li><a class="dropdown-item" href="#">Edit</a></li>--%>
                    </ul>
                </li>

            </ul>
            <form class="d-flex">
                <div class="btn-group">
                    <button type="button" class="btn btn-danger">${sessionScope.get("userLogin").name}
                    <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/user?action=update&username=${l.username}">Information</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item btn btn-outline-success" href="/index.jsp">${session.removeAttribute("userLogin").name}Log
                            Out</a></li>
                    </ul>
                </div>
                </a>

            </form>
        </div>

    </div>
</nav>

<div align="center" style="margin-top: 50px">
    <table class="table table-striped table-hover">
        <tr style="background: burlywood">
            <td>USERNAME</td>
            <td>Password</td>
            <td>Name</td>
            <td>ADDRESS</td>
            <td>Phone</td>
            <td>Role</td>
            <td colspan="2">Action</td>
        </tr>
        <c:forEach var="l" items="${listUser}">
            <tr>

                <td>${l.username}</td>
                <td>${l.password}</td>
                <td>${l.name}</td>
                <td>${l.address}</td>
                <td>${l.phone}</td>
                <td>${l.role}</td>
                <td>
                    <form action="/user" method="post">
                        <input type="text" name="username" value="${l.username}" hidden>
                        <input type="text" name="action" value="delete" hidden>
                        <button class="btn btn-outline-secondary" type="submit">delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <p>${message}</p>
</div>
</body>
</html>
