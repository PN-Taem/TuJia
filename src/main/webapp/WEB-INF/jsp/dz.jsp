<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <script type="text/javascript" src="/statics/js/sweetalert.min.js"></script>
    <script type="text/javascript" src="/statics/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var TEL_phone = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
            var TEL_pwd=/^[\w_-]{6,16}$/;
            var TEL_email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            $('.message a').click(function () {
                $('form').animate({
                    height: 'toggle',
                    opacity: 'toggle'
                }, 'slow');
            });

            $("#login").click(function () {

                check();
            });

            $("input").focus(function () {
                $(".sp").css("display", "none")
            });

            $("input[name='phone']").focusout(function () {
                if (!TEL_phone.test($(this).val())) {
                    $("#sp_phone").css("display", "block");
                }
            });
            $("input[name='passWord']").focusout(function () {
                if (!TEL_pwd.test($(this).val())) {
                    $("#sp_pwd").css("display", "block");
                }
            });


            function check() {
                var phone = $("input[name='phone']").val();
                var passWord = $("input[name='passWord']").val();
                    alert(passWord);
                var falg = true;
                <!--登录-->
                if (!TEL_phone.test(phone)) {
                    alert("电话号码格式不正确");
                    return false;
                } else if (!TEL_pwd.test(passWord)) {
                   alert("密码格式不正确");
                    return false;
                }
                $.post("/user/doLogin", {"phone": phone, "passWord": passWord}, function (data) {
                    if (data == false) {
                       alert("用户名或密码错误！");
                        falg = false;
                    } else if (data == true) {
                        falg = true;
                        location.href = "/user/index.html";
                    }
                }, "json");
            }
        })
        /**注册*/
        $(function(){

                    $("input[name='zphone']").focusout(function(){
                        var phone=$(this).val();
                        $.post("/user/dophone",{"phone":phone},function(data){
                            if (data==false) {
                                alert("手机号已被注册");
                                $("input[name='zphone']").val("");
                            }
                        },"json");
                    })
            $("#Myform").submit(function(){
                return checkz();
            });
        });
        function checkz(){
            var zphone=$("input[name='zphone']").val();
            var zpassWord=$("input[name='zpassWord']").val();
            var zemail=$("input[name='zemail']").val();
            var TEL_phone = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
            var TEL_pwd=/^[\w_-]{6,16}$/;
            var TEL_email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if (!TEL_phone.test(zphone)) {
                alert("电话号码格式不正确");
                return false;
            } else if (!TEL_pwd.test(zpassWord)) {
                alert("密码格式不正确");
                return false;
            }else if(!TEL_email.test(zemail)){
                alert("邮箱格式不正确");
                return false;
            }
            return true;
        }
    </script>
    <style type="text/css">
        .center {
            text-align: center;
        }

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form button:hover, .form button:active, .form button:focus {
            background: #43A047;
        }

        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }

        .form .message a {
            color: #4CAF50;
            text-decoration: none;
        }

        .form .register-form {
            display: none;
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 300px;
            margin: 0 auto;
        }

        .container:before, .container:after {
            content: "";
            display: block;
            clear: both;
        }

        .container .info {
            margin: 50px auto;
            text-align: center;
        }

        .container .info h1 {
            margin: 0 0 15px;
            padding: 0;
            font-size: 36px;
            font-weight: 300;
            color: #1a1a1a;
        }

        .container .info span {
            color: #4d4d4d;
            font-size: 12px;
        }

        .container .info span a {
            color: #000000;
            text-decoration: none;
        }

        .container .info span .fa {
            color: #EF3B3A;
        }
        #bei img {
            float: left;
            width: 100%;
            height: 100%;
            border: 0px solid red;
            position: absolute;
            top: 0px;
            left: 0px;
            bottom: 0px;
            right: 0px;
        }


        .shake_effect {
            -webkit-animation-name: shake;
            animation-name: shake;
            -webkit-animation-duration: 1s;
            animation-duration: 1s;
        }

        @-webkit-keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

        @keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

        p.center {
            color: #fff;
            font-family: "Microsoft YaHei";
        }
    </style>
</head>
<body>
<div id="bei">
    <img src="/statics/img/10772600_themes_tujia_img_homebanner.jpg" />
</div>
<div class="htmleaf-container"  >

    <div id="wrapper" class="login-page" >
        <div id="login_form" class="form" >

                <form action="/user/dozhuce" method="post" id="Myform" class="register-form">
                    <input type="text" placeholder="请输入手机号" id="zphone" name="zphone"/>
                    <input type="password" placeholder="请输入密码" id="zpassWord" name="zpassWord"/>
                    <input type="text" placeholder="请输入电子邮件" id="zemail" name="zemail"/>
                    <button id="create" type="submit">创建账户</button>
                    <p class="message">已经有了一个账户? <a href="#">立刻登录</a></p>
            </form>
            <form class="login-form">
                    <input type="text" id="user_name" name="phone" placeholder="请输入手机号"/>
                    <input type="password" id="password" name="passWord" placeholder="请输入密码"/>
                    <button id="login" type="button">登　录</button>
                    <p class="message">还没有账户? <a href="#">立刻创建</a></p>

            </form>
        </div>
    </div>
</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>
