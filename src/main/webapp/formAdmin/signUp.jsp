<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        /* Fonts Form Google Font ::- https://fonts.google.com/  -:: */
        @import url("https://fonts.googleapis.com/css?family=Abel|Abril+Fatface|Alegreya|Arima+Madurai|Dancing+Script|Dosis|Merriweather|Oleo+Script|Overlock|PT+Serif|Pacifico|Playball|Playfair+Display|Share|Unica+One|Vibur");
        /* End Fonts */
        /* Start Global rules */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        /* End Global rules */

        /* Start body rules */
        body {
            background-image: linear-gradient(-225deg, #e3fdf5 0%, #ffe6fa 100%);
            background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
            background-attachment: fixed;
            background-repeat: no-repeat;

            font-family: "Vibur", cursive;
            /*   the main font */
            font-family: "Abel", sans-serif;
            opacity: 0.95;
            /* background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%); */
        }

        /* |||||||||||||||||||||||||||||||||||||||||||||*/
        /* //////////////////////////////////////////// */

        /* End body rules */

        /* Start form  attributes */
        form {
            width: 450px;
            min-height: 500px;
            height: auto;
            border-radius: 5px;
            margin: 2% auto;
            box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31);
            padding: 2%;
            background-image: linear-gradient(-225deg, #e3fdf5 50%, #ffe6fa 50%);
        }

        /* form Container */
        form .con {
            display: -webkit-flex;
            display: flex;

            -webkit-justify-content: space-around;
            justify-content: space-around;

            -webkit-flex-wrap: wrap;
            flex-wrap: wrap;

            margin: 0 auto;
        }

        /* the header form form */
        header {
            margin: 2% auto 10% auto;
            text-align: center;
        }

        /* Login title form form */
        header h2 {
            font-size: 250%;
            font-family: "Playfair Display", serif;
            color: #3e403f;
        }

        header p {
            letter-spacing: 0.05em;
        }

        .input-item {
            background: #fff;
            color: #333;
            padding: 14.5px 0px 15px 9px;
            border-radius: 5px 0px 0px 5px;
        }

        #eye {
            background: #fff;
            color: #333;

            margin: 5.9px 0 0 0;
            margin-left: -20px;
            padding: 15px 9px 19px 0px;
            border-radius: 0px 5px 5px 0px;

            float: right;
            position: relative;
            right: 1%;
            top: -0.2%;
            z-index: 5;
            cursor: pointer;
        }

        input[class="form-input"] {
            width: 240px;
            height: 50px;
            margin-top: 2%;
            padding: 15px;
            font-size: 16px;
            font-family: "Abel", sans-serif;
            color: #5e6472;
            outline: none;
            border: none;
            border-radius: 0px 5px 5px 0px;
            transition: 0.2s linear;
        }

        input[id="txt-input"] {
            width: 250px;
        }

        input:focus {
            transform: translateX(-2px);
            border-radius: 5px;
        }

        button {
            display: inline-block;
            color: #252537;
            width: 280px;
            height: 50px;
            padding: 0 20px;
            background: #fff;
            border-radius: 5px;
            outline: none;
            border: none;
            cursor: pointer;
            text-align: center;
            transition: all 0.2s linear;
            margin: 7% auto;
            letter-spacing: 0.05em;
        }


        button:hover {
            transform: translatey(3px);
            box-shadow: none;
        }

        button:hover {
            animation: ani9 0.4s ease-in-out infinite alternate;
        }

        @keyframes ani9 {
            0% {
                transform: translateY(3px);
            }
            100% {
                transform: translateY(5px);
            }
        }

    </style>
    <script>
        function show() {
            var p = document.getElementById("pwd");
            p.setAttribute("type", "text");
        }

        function hide() {
            var p = document.getElementById("pwd");
            p.setAttribute("type", "password");
        }

        var pwShown = 0;

        document.getElementById("eye").addEventListener(
            "click",
            function () {
                if (pwShown == 0) {
                    pwShown = 1;
                    show();
                } else {
                    pwShown = 0;
                    hide();
                }
            },
            false
        );
    </script>
</head>
<body>
<div class="overlay">
    <form method="post">
        <div class="con">
            <header class="head-form">
                <h2>Sign Up</h2>
<%--                <p>Sign Up here using your username and password</p>--%>
            </header>
            <br>
            <div class="field-set" style="text-align: center">
                <span class="input-item">
          <i class="fa fa-user-circle"></i>
        </span>
                <input name="action" value="create" hidden>
                <input class="form-input" id="txt-input" type="text" placeholder="UserName" name="username"required>
                <br>
                <span class="input-item">
          <i class="fa fa-key"></i>
        </span>
                <input class="form-input" type="password" placeholder="Password" id="pwd" name="password" required>
<%--                <span>--%>
<%--        </span>--%>
                <input class="form-input" type="name" placeholder="Name"  name="name" required>
<%--                <span>--%>
<%--        </span>--%>
                <input class="form-input" type="address" placeholder="Address"  name="address" required>
<%--                <span>--%>
<%--        </span>--%>
                <input class="form-input" type="phone" placeholder="Phone"  name="phone" required>
<%--                <span>--%>
<%--        </span>--%>
                <br>
                <button class="log-in"> Sign Up</button>
                <b>${message}</b>
            </div>
            <%--            <div class="other">--%>
            <%--                <button class="btn submits frgt-pass">Forgot Password</button>--%>
            <%--                <a href="">--%>
            <%--                    <button class="btn submits sign-up" type="button">Sign Up--%>
            <%--                        &lt;%&ndash;                    <i class="fa fa-user-plus" aria-hidden="true"></i>&ndash;%&gt;--%>
            <%--                    </button>--%>
            <%--                </a>--%>
            <%--            </div>--%>
        </div>
    </form>
</div>
</body>
</html>