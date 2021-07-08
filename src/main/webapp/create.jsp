<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/5/2021
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
            height: 545px;
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
<div class="container">
    <div style="padding-top: 40px" class="row">
        <div class="col-12">
            <a href="Posts" class="btn btn-outline-primary"><img width="30px" src="https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/blue_repicthousebase_1484336386-1.png">HOME</a>
        </div>
    </div>
    <div class="row">
        <div align="center" class="col-12">
            <form action="" method="post">
                <div class="form">

                    <%--        <c:if test="${post != null}">--%>
                    <%--            <input type="hidden" name="id" value="<c:out value='${post.id}' />"/>--%>
                    <%--        </c:if>--%>

                    <div class="title"></div>
                    <div class="subtitle">Let's create your post</div>

<%--                    <div class="input-container ic1">--%>
<%--                        <input id="id" name="id"  class="input" type="text" placeholder=" "/>--%>
<%--                        <div class="cut"></div>--%>
<%--                        <label for="id" class="placeholder">ID</label>--%>
<%--                    </div>--%>

                    <div class="input-container ic2">
                        <input id="title" name="title" class="input" type="text" placeholder=" "/>
                        <div class="cut"></div>
                        <label for="title" class="placeholder">title</label>
                    </div>

                    <div class="input-container ic2">
                        <input id="price" name="price" class="input" type="text" placeholder=" "/>
                        <div class="cut cut-short"></div>
                        <label for="price" class="placeholder">price</label>
                    </div>

                        <div class="input-container ic2">
                            <input id="address" name="address"  class="input"  placeholder=" "/>
                            <div class="cut cut-short"></div>
                            <label for="address" class="placeholder">address</label>
                        </div>

                    <div class="input-container ic2">
                        <input id="img" name="img"  class="input"  placeholder=" "/>
                        <div class="cut cut-short"></div>
                        <label for="img" class="placeholder">img</label>
                    </div>

                    <div class="input-container ic2">
                        <input id="describe" name="describe"  class="input"  placeholder=" "/>
                        <div class="cut cut-short"></div>
                        <label for="describe" class="placeholder">describe</label>
                    </div>
                    <input id="status" name="status"  type="hidden" value="true" class="input"  placeholder=" "/>
                    <div  align="center" class="input-container ic2">
                        <button type="submit" style="background-color: #15172b; font-size: x-large;" id="submit" class="custom-btn btn-12">
                            <span>SUBMIT</span><span>Create</span>
                        </button>
                    </div>


                    <%--        <button type="submit" class="submit">submit</button>--%>

                </div>



            </form>
        </div>
    </div>
</div>

</body>
</html>







<%--<div align="center">--%>
<%--    <a href="/Posts">List Post</a>--%>
<%--    <form method="post">--%>
<%--        &lt;%&ndash;    <input type="hidden" name="action" value="create">&ndash;%&gt;--%>
<%--        ID<input type="text" name="id"><br/>--%>
<%--        TITLE<input type="text" name="title"><br/>--%>
<%--        PRICE<input type="text" name="price"><br/>--%>
<%--        ADDRESS<input type="text" name="address"><br/>--%>
<%--        IMG<input type="text" name="img"><br/>--%>
<%--        DESCRIBE<input type="text" name="describe"><br/>--%>
<%--        STATUS<input type="text" name="status"><br/>--%>
<%--        <button>SUBMIT</button>--%>
<%--    </form>--%>
<%--</div>--%>
