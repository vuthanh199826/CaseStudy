<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/6/2021
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        .btn-12{
            position: relative;
            right: 20px;
            bottom: 20px;
            border:none;
            box-shadow: none;
            width: 130px;
            height: 40px;
            line-height: 42px;
            -webkit-perspective: 230px;
            perspective: 230px;
        }
        .btn-12 span {
            /*background: rgb(0,172,238);*/
            background-color: #dc2f55;
            background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
            display: block;
            position: absolute;
            width: 130px;
            height: 40px;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            border-radius: 5px;
            margin:0;
            text-align: center;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: all .3s;
            transition: all .3s;
        }
        .btn-12 span:nth-child(1) {
            box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
            -webkit-transform: rotateX(90deg);
            -moz-transform: rotateX(90deg);
            transform: rotateX(90deg);
            -webkit-transform-origin: 50% 50% -20px;
            -moz-transform-origin: 50% 50% -20px;
            transform-origin: 50% 50% -20px;
        }
        .btn-12 span:nth-child(2) {
            -webkit-transform: rotateX(0deg);
            -moz-transform: rotateX(0deg);
            transform: rotateX(0deg);
            -webkit-transform-origin: 50% 50% -20px;
            -moz-transform-origin: 50% 50% -20px;
            transform-origin: 50% 50% -20px;
        }
        .btn-12:hover span:nth-child(1) {
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            -webkit-transform: rotateX(0deg);
            -moz-transform: rotateX(0deg);
            transform: rotateX(0deg);
        }
        .btn-12:hover span:nth-child(2) {
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            color: transparent;
            -webkit-transform: rotateX(-90deg);
            -moz-transform: rotateX(-90deg);
            transform: rotateX(-90deg);
        }

        body {
            align-items: center;
            background: url("https://media.giphy.com/media/W1fFapmqgqEf8RJ9TQ/giphy.gif");
            background-size: auto;
            display: flex;
            justify-content: center;
            height: 100vh;
            cursor: pointer;
        }

        .form {
            background-color: #15172b;
            border-radius: 20px;
            box-sizing: border-box;
            height: 600px;
            padding: 15px;
            width: 520px;
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
            background-color: #15172b;
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

        /*#submit {*/
        /*    background-color: #08d;*/
        /*    border-radius: 12px;*/
        /*    border: 0;*/
        /*    box-sizing: border-box;*/
        /*    color: #eee;*/
        /*    cursor: pointer;*/
        /*    font-size: 18px;*/
        /*    height: 50px;*/
        /*    margin-top: 38px;*/
        /*/ / outline: 0;*/
        /*    text-align: center;*/
        /*    width: 100%;*/
        /*}*/

        /*#submit:active {*/
        /*    background-color: #06b;*/
        /*}*/
    </style>
</head>
<body>
<form method="post">
    <div class="form">

        <c:if test="${post != null}">
            <input type="hidden" name="id" value="<c:out value='${post.id}' />"/>
        </c:if>

        <div class="title"></div>
        <div class="subtitle">Let's edit your post!</div>
        <div class="input-container ic1">
            <input id="firstname" name="title" value="${post.title}" class="input" type="text" placeholder=" "/>
            <div class="cut"></div>
            <label for="firstname" class="placeholder">Tittle</label>
        </div>
        <div class="input-container ic2">
            <input id="lastname" name="price" value='${post.price}' class="input" type="text" placeholder=" "/>
            <div class="cut"></div>
            <label for="lastname" class="placeholder">Price</label>
        </div>
        <div class="input-container ic2">
            <input id="email" name="address" value='${post.address}' class="input" type="text" placeholder=" "/>
            <div class="cut cut-short"></div>
            <label for="email" class="placeholder">Address</label>
        </div>

        <div class="input-container ic2">
            <input id="img" name="img" value='${post.img}' class="input" type="text" placeholder=" "/>
            <div class="cut cut-short"></div>
            <label for="email" class="placeholder">IMG</label>
        </div>

        <div class="input-container ic2">
            <input id="describe" name="describe" value='${post.describe}' class="input" type="text" placeholder=" "/>
            <div class="cut cut-short"></div>
            <label for="email" class="placeholder">Describe</label>
        </div>

        <div class="input-container ic1">
            <select name="status" class="input">
                <option value="${post.status}">
                    <c:choose>
                        <c:when test="${post.status == true}">Còn phòng</c:when>
                        <c:when test="${post.status == false}">Hết phòng</c:when>
                    </c:choose>
<%--                    ${post.status}--%>
                </option>
                <option value="${!post.status}">
                    <c:choose>
                        <c:when test="${!post.status == true}">Còn phòng</c:when>
                        <c:when test="${!post.status == false}">Hết phòng</c:when>
                    </c:choose>
<%--                    ${!post.status}--%>
                </option>
            </select>
<%--            <input id="status" name="status" value='${post.status}' class="input" type="text" placeholder=" "/>--%>
            <div class="cut cut-short"></div>
            <label for="email" class="placeholder">Status</label>
        </div>

            <div  align="center" class="input-container ic2">
                <button  style="background-color: #15172b; font-size: x-large;" id="submit" class="custom-btn btn-12">
                    <span>SUBMIT</span><span>SAVE</span>
                </button>
            </div>

<%--        <button type="submit" class="submit">submit</button>--%>

    </div>



</form>
</body>
</html>











































<%--<div align="center">--%>
<%--    <form method="post">--%>
<%--        <table border="1" cellpadding="5">--%>
<%--            <caption>--%>
<%--                <h2>--%>
<%--                    Edit Post--%>
<%--                </h2>--%>
<%--            </caption>--%>
<%--            <c:if test="${post != null}">--%>
<%--                <input type="hidden" name="id" value="<c:out value='${post.id}' />"/>--%>
<%--            </c:if>--%>
<%--            <tr>--%>
<%--                <th>TITLE:</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="title" size="45"--%>
<%--                           value="<c:out value='${post.title}' />"--%>
<%--                    />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>PRICE:</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="price" size="45"--%>
<%--                           value="<c:out value='${post.price}' />"--%>
<%--                    />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>Price:</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="address" size="15"--%>
<%--                           value="<c:out value='${post.address}' />"--%>
<%--                    />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>IMG:</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="img" size="15"--%>
<%--                           value="<c:out value='${post.img}' />"--%>
<%--                    />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>Describe:</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="describe" size="15"--%>
<%--                           value="<c:out value='${post.describe}' />"--%>
<%--                    />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>Status:</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="status" size="15"--%>
<%--                           value="<c:out value='${post.status}' />"--%>
<%--                    />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td colspan="2" align="center">--%>
<%--                    <input type="submit" value="Save"/>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>
