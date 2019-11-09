<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
	  <script type="text/javascript" src="/statics/js/sweetalert.min.js"></script>
  <script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
  				<script type="text/javascript">
			var TEL_phone = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
			var TEL_pwd=/^[\w_-]{6,16}$/;
			var TEL_email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			$(function(){
				$("#zhuce").click(function(){

					check();
			});

			$("input").focus(function(){
				$(".sp").css("display","none")
			});

			$("input[name='phone']").focusout(function(){
				if (!TEL_phone.test($(this).val())) {
					$("#sp_phone").css("display","block");
				}
			});
			$("input[name='passWord']").focusout(function(){
				if (!TEL_pwd.test($(this).val())) {
					$("#sp_pwd").css("display","block");
				}
			});

			function check(){
				var phone=$("input[name='phone']").val();
				var passWord=$("input[name='passWord']").val();
				var email=$("input[name='email']").val();
				var pwd2=$("input[name='pwd2']").val();
				var falg=true;
				if (!TEL_phone.test(phone)) {
					$("#sp_phone").css("display","block");
					return false;
				}else if(!TEL_pwd.test(passWord)){
					$("#sp_pwd").css("display","block");
					return false;
				}
				$.post("/user/doLogin",{"phone":phone,"passWord":passWord},function(data){
					if(data==false){
						swal("用户名或密码错误！");
						falg=false;
					}else if(data==true){
						falg=true;
						location.href="/user/index.html";
					}
				},"json");
			}
			});
		</script>
  <link rel="stylesheet" href="/statics/css/add.css" type="text/css"/></head>

 <body>
		<header>
			<div id="head_tou">
				<img src="/statics/img/10772600_medias_logo11.png" width="120"/>
				<ul>
					<li><a href="shouye.jsp">招聘首页&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
					<li><a href="index.jsp">登录&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
					<li><a href="add.jsp">注册</a></li>
				</ul>
			</div>

		</header>
		<div id="body_cen" style="height:500px;margin-top:50px "><br /><br />
		<br />
			<div id="body_form" style="height:380px;">
				<br /><br />
				<h2 style="color: #475966;text-indent: 40px;">手机号登录</h2><br />
				<form action="/user/index.html" method="post" id="Myform">
				<span>手机号</span><br/><input type="text" name="phone" placeholder="请输入手机号"/>
				<span class="sp" id="sp_phone">手机号格式不正确</span><br/>
				<span>密码</span><br/><input type="password" name="passWord" placeholder="请输入密码"/>
				<span class="sp" id="sp_pwd">您输入的密码不符合规范(密码6-20位)</span><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br />
				<input type="button" value="登录" id="zhuce"/>

			</div>
		</div>
	</body>
</html>
