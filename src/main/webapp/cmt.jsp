<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            background: url("https://media.giphy.com/media/W1fFapmqgqEf8RJ9TQ/giphy.gif");
            background-size: auto;
            cursor: pointer;
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
            background-color: #6a4444;
            border-radius: 12px;
            border: 0;
            box-sizing: border-box;
            color: #eee !important;
            font-size: 18px;
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <div class="row">
        <a style="width: 80px" href="Posts" class="btn btn-outline-primary"><img width="30px" src="https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/blue_repicthousebase_1484336386-1.png">HOME</a>
    </div>
    <div class="row">
        <div class="col-12">
            <c:if test="${post != null}">
                <input type="hidden" name="id" value="<c:out value='${post.id}' />"/>
            </c:if>
            <div style=" background-color: #15172b; border-radius: 3px" class="card m-3 p-2 ">
                <img style="border-radius: 3px" width="200px" height="200px" src="${post.img}" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <div class="input-container ic1 ">

                        <div class="input row ">
                            <div class="col-6 ml-3 mt-3 mb-3">
                                Title: ${post.title}<br/>
                                Describe: ${post.describe}<br/>
                                Address: ${post.address}<br/>
                                Price: ${post.price}<br/>
                                Status: <c:if test="${post.status == true}"> Còn phòng </c:if>
                                <c:if test="${post.status == false}"> Hết phòng </c:if>
                                <br>
                                <a href="Orders?action=thue&id=${post.id}" class="btn btn-outline-primary">Rent</a>
                            </div>

                            <div class="col-6 mt-3 mb-3">

                                <table>
                                    <c:forEach var="cmt" items="${comments}">
                                        <c:if test="${post.id == cmt.idPost}">
                                            <tr>
                                                <td style="color: white"><b>${cmt.username}</b>: <i>${cmt.detail}</i></td>
                                                <td></td>
                                                <c:if test="${cmt.username == user}">
                                                    <td>
                                                        <a href="/Comments?action=delete&id=${cmt.id}&idPost=${post.id}" style="text-decoration: none">X</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <tr >
                                        <td>
                                            <form action="/Comments" method="post" style="margin-top: 10px">
                                                <input type="hidden" name="action" value="createComment">
                                                <input type="hidden" name="idPost" value="${post.id}">
                                                <input style="border-radius: 25px" type="text" name="detail" class="form-control">
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
