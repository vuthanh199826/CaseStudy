<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: THANH--%>
<%--  Date: 7/5/2021--%>
<%--  Time: 16:56--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Posts</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            color: white;--%>
<%--            background-color: black;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<a href="/Posts?action=test">test</a>--%>
<%--<a href="/Servlet?action=logout">log out</a>--%>
<%--<div align="center">--%>
<%--    list post--%>
<%--    <a href="/Orders?action=order">My order</a>--%>
<%--    <a href="/Posts?action=mypost">My posts</a>--%>
<%--    <a href="/Posts?action=create">Create post</a>--%>
<%--    <form method="post">--%>
<%--        <input type="hidden" name="action" value="search">--%>
<%--        <input type="text" name="address" placeholder="address">--%>
<%--        <input type="text" name="first" placeholder="first price">--%>
<%--        <input type="text" name="second" placeholder="second price">--%>
<%--        <button type="submit">SEARCH</button>--%>
<%--    </form>--%>
<%--    <table border="1">--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>USERNAME</th>--%>
<%--            <th>TITLE</th>--%>
<%--            <th>PRICE</th>--%>
<%--            <th>ADDRESS</th>--%>
<%--            <th>IMG</th>--%>
<%--            <th>DESCRIBE</th>--%>
<%--            <th>STATUS</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="post" items="${posts}">--%>
<%--            <tr>--%>
<%--                <td>${post.id}</td>--%>
<%--                <td>${post.userName}</td>--%>
<%--                <td>${post.title}</td>--%>
<%--                <td>${post.price}</td>--%>
<%--                <td>${post.address}</td>--%>
<%--                <td><img width="150px" height="150px" src="${post.img}"></td>--%>
<%--                <td>${post.describe}</td>--%>
<%--                <td>${post.status}</td>--%>
<%--                <td>--%>
<%--                    <a href="/Comments?action=showComment&idPost=${post.id}">cmt</a>--%>
<%--                    <table border="1">--%>
<%--                        <tr>--%>
<%--                            <td>ID</td>--%>
<%--                            <td>IDPOST</td>--%>
<%--                            <td>USERNAME</td>--%>
<%--                            <td>DETAIL</td>--%>
<%--                        </tr>--%>

<%--                        <c:forEach var="cmt" items="${comments}">--%>
<%--                            <c:if test="${post.id == cmt.idPost}">--%>
<%--                            <tr>--%>
<%--                                <td>${cmt.id}</td>--%>
<%--                                <td>${cmt.idPost}</td>--%>
<%--                                <td>${cmt.username}</td>--%>
<%--                                <td>${cmt.detail}</td>--%>

<%--                                <c:if test="${cmt.username == user}">--%>
<%--                                    <td>--%>
<%--                                        <a href="/Comments?action=delete&id=${cmt.id}&idPost=${post.id}">delete</a>--%>
<%--                                    </td>--%>
<%--                                </c:if>--%>
<%--                            </tr>--%>
<%--                            </c:if>--%>
<%--                        </c:forEach>--%>

<%--                    </table>--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <form action="/Comments" method="post">--%>
<%--                        <input type="hidden" name="action" value="createComment">--%>
<%--                        <input type="hidden" name="idPost" value="${post.id}">--%>
<%--                        <input type="text" name="detail">--%>
<%--                        <button type="submit"><=</button>--%>
<%--                    </form>--%>
<%--                </td>--%>


<%--                <td><a href="Orders?action=thue&id=${post.id}">Thue</a></td>--%>


<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>






<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            background: url("https://media.giphy.com/media/W1fFapmqgqEf8RJ9TQ/giphy.gif");
            background-size: auto;
        }
        .subtitle {
            color: #eee;
            font-family: sans-serif;
            font-size: 16px;
            font-weight: 600;
            margin-top: 10px;
        }

        .input-container {
            height: 50px;
            position: relative;
            width: 100%;
        }

        .ic1 {
            margin-top: 40px;
        }

        .ic2 {
            margin-top: 30px;
        }

        .input {
            background-color: #303245;
            border-radius: 12px;
            border: 0;
            box-sizing: border-box;
            color: #eee;
            font-size: 18px;
            height: 100%;
            outline: 0;
            padding: 4px 20px 0;
            width: 100%;
        }

        .cut {
            /*background-color: #15172b;*/

            border-radius: 10px;
            height: 20px;
            left: 20px;
            position: absolute;
            top: -20px;
            transform: translateY(0);
            transition: transform 200ms;
            width: 76px;
        }

        .cut-short {
            width: 50px;
        }

        .input:focus ~ .cut,
        .input:not(:placeholder-shown) ~ .cut {
            transform: translateY(8px);
        }

        .placeholder {
            color: #65657b;
            font-family: sans-serif;
            left: 20px;
            line-height: 14px;
            pointer-events: none;
            position: absolute;
            transform-origin: 0 50%;
            transition: transform 200ms, color 200ms;
            top: 20px;
        }

        .input:focus ~ .placeholder,
        .input:not(:placeholder-shown) ~ .placeholder {
            transform: translateY(-30px) translateX(10px) scale(0.75);
        }

        .input:not(:placeholder-shown) ~ .placeholder {
            color: #808097;
        }

        .input:focus ~ .placeholder {
            color: #dc2f55;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <%--    row1--%>
    <div class="row">
        <nav style="background: url('https://media.giphy.com/media/W1fFapmqgqEf8RJ9TQ/giphy.gif');background-size: initial" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img width="60px" height="60px" src="https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/blue_repicthousebase_1484336386-1.png"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a style="height: 40px" class="btn btn-outline-primary" aria-current="page" href="Posts?action=">
                                Home
                                <%--                                <img style="width: 40px;height: 40px"  src="https://icons.iconarchive.com/icons/graphicloads/100-flat/256/home-icon.png">--%>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle btn btn-outline-primary" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Personal
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align: center;padding: 5px"><a class="btn btn-outline-info" href="/Posts?action=mypost">My Posts</a></li>
                                <li style="text-align: center;padding: 5px"><a class="btn btn-outline-info" href="/Orders?action=order">My Orders</a></li>
                                <li style="text-align: center"><hr class="dropdown-divider"></li>
                                <li style="text-align: center"><a class="btn btn-outline-success" href="/Posts?action=create">Create New Post</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">User</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <%--    row2--%>
    <div class="row">
        <div style="background-color: dimgrey" class="col-3" id="ul1">
            <ul style="list-style-type: none;background-color: dimgrey;margin-top: 20px"
                class="dropdown-menu-1 xl-6 lh-3-md-1">
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">CHUNG CƯ MINI</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">PHÒNG TRỌ GIÁ RẺ</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">PHÒNG TRỌ ĐẸP</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">GẦN BẠN NHẤT</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">PHÒNG TRỌ CHUNG CHỦ</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">PHÒNG TRỌ 3 NGƯỜI</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">CÓ GÁC XÉP</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">VỆ SINH KHÉP KÍN</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">VIEW ĐẸP</a></li>
                <li><a style="width: 220px;border-radius: 4px;margin: 2px" class="btn btn-outline-info xl-6 lh-3-md-1" href="#">ĐÓNG TIỀN THEO THÁNG</a></li>

            </ul>
        </div>
        <div style="background-color: dimgrey" class="col-9">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img style="width: 831px;height: 444px" src="https://aeros.vn/upload/images/thiet-ke-phong-tro-2.jpg"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img style="width: 831px;height: 444px" src="https://xaynhatro.net/wp-content/uploads/2018/06/f70f05c965f280acd9e3.jpg"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img style="width: 831px;height: 444px" src="https://aeros.vn/upload/images/thiet-ke-phong-tro-3.jpg"
                             class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <%--    row3--%>
    <div class="row">
        <c:forEach var="post" items="${posts}">
            <div  class="col-4">
                <div  style=" background-color: #15172b; height: 580px; border-radius: 3px" class="card m-3 p-2 ">
                    <img style="border-radius: 3px" width="200px" height="200px" src="${post.img}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <div  class="input-container ic1">

                            <p style="height: 280px" class="input">
                                <br/>
                                Title: ${post.title}<br/>
                                Describe: ${post.describe}<br/>
                                Address: ${post.address}<br/>
                                Price: ${post.price}<br/>
                                Status: ${post.status}<br/><br/><br/>
                                <a class="btn btn-outline-primary" href="Orders?action=thue&id=${post.id}">RENT</a>
                            </p>

                            <div class="cut"></div>
                        </div>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
</div>






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>






