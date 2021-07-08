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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>

        body{
            background: url("https://media.giphy.com/media/W1fFapmqgqEf8RJ9TQ/giphy.gif");
            background-size: auto;
        }
        .title {
            color: #eee;
            font-family: sans-serif;
            font-size: 16px;
            font-weight: 600;
            margin-top: 10px;
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
</head>
<%--<body>--%>
<%--<a href="/Posts">ALL list post</a>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>USERNAME</th>--%>
<%--        <th>TITLE</th>--%>
<%--        <th>PRICE</th>--%>
<%--        <th>ADDRESS</th>--%>
<%--        <th>IMG</th>--%>
<%--        <th>DESCRIBE</th>--%>
<%--        <th>STATUS</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="post" items="${mypost}">--%>
<%--        <tr>--%>
<%--            <td>${post.id}</td>--%>
<%--            <td>${post.userName}</td>--%>
<%--            <td>${post.title}</td>--%>
<%--            <td>${post.price}</td>--%>
<%--            <td>${post.address}</td>--%>
<%--            <td><img width="150px" height="150px" src="${post.img}"></td>--%>
<%--            <td>${post.describe}</td>--%>
<%--            <td>${post.status}</td>--%>

<%--            <td><a href="Posts?action=edit&id=${post.id}">edit</a></td>--%>


<%--            <td><a href="Posts?action=delete&id=${post.id}">delete</a></td>--%>


<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--</body>--%>


<body>
<div class="container">
    <div class="row">
        <div class="col-12 pt-3">
            <div   class="row">
                <div class="col-1">
                    <a style="width: 80px" href="Posts" class="btn btn-outline-primary"><img width="30px" src="https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/blue_repicthousebase_1484336386-1.png">HOME</a>
                </div>
                <div class="col-9">
                    <form method="get">
                        <button class="btn btn-outline-primary" style="width: 80px;height: 50px ;" type="submit">Search</button>
                        <input style="height: 50px" type="hidden" name="action" value="search">
                        <select class="btn btn-outline-primary" style="height: 50px;border-radius: 4px;width: 150px" name="type">
                            <option value="price">Price</option>
                            <option value="address">Address</option>
                        </select>
                        <input class="subtitle" style="height: 50px;border-radius: 4px;width: 150px" type="text" name="first" placeholder="first price">
                        <input class="subtitle" style="height: 50px;border-radius: 4px;width: 150px" type="text" name="second" placeholder="second price">
                        <input class="subtitle" style="height: 50px;border-radius: 4px;width: 150px" type="text" name="address" placeholder="address">
                    </form>
                </div>
            </div>


        </div>

    </div>
    <div class="row">
        <c:forEach var="post" items="${mypost}">
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
                                <a id="btn1" href="Posts?action=edit&id=${post.id}" class="btn btn-outline-primary ">EDIT</a>
                                <a id="btn2" href="Posts?action=delete&id=${post.id}" class="btn btn-outline-danger">DELETE</a>
                            </p>

                            <div class="cut"></div>
<%--                            <label for="firstname" class="placeholder">Tittle</label>--%>
                        </div>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>
