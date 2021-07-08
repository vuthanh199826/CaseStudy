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
                            <a class="nav-link" href="#">Link</a>
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
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
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
