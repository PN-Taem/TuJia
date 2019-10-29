<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<script src="/statics/js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			var TEL_phone = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
			var TEL_pwd=/^[\w_-]{6,16}$/;
			var TEL_email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			$(function(){
			var flag=true;
			$("input[name='phone']").focusout(function(){
		     var phone=$(this).val();
				$.get("UserServlet?phone="+phone,null,function(data){
					if (data=='true') {
					flag=false;
					swal("提示", "手机号已被注册", "error");
					}else{
					flag=true;
					}
				})
			})
			
				$("#Myform").submit(function(){
				return check();
			});
			
			$("input").focus(function(){
				$(".sp").css("display","none");
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
			$("input[name='pwd2']").focusout(function(){
				if ($(this).val()!=$("input[name='passWord']").val()) {
					$("#sp_pwd2").css("display","block");
				}
			});
			$("input[name='email']").focusout(function(){
				if (!TEL_email.test($(this).val())) {
					$("#sp_email").css("display","block");
				}
			});
			function check(){
				var phone=$("input[name='phone']").val();
				var passWord=$("input[name='passWord']").val();
				var email=$("input[name='email']").val();
				var pwd2=$("input[name='pwd2']").val();
				if (!TEL_phone.test(phone)) {
					$("#sp_phone").css("display","block");
					return false;
				}else if(!TEL_pwd.test(passWord)){
					$("#sp_pwd").css("display","block");
					return false;
				}else if(passWord!=pwd2){
					$("#sp_pwd2").css("display","block");
					return false;
				}
				else if(!TEL_email.test(email)){
					$("#sp_email").css("display","block");
					return false;
				}else if(!flag){
				swal("提示", "手机号已被注册", "error");
				return false;
				}
				return true;
			}
			});
				
			
		</script>
	<link rel="stylesheet" href="css/add.css" type="text/css"></link>
	<script type="text/javascript" src="/statics/js/sweetalert.min.js"></script></head>
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
		<div id="body_cen" style="margin-top:30px "><br /><br />
			<div id="body_form" style="height:500px;margin-top:10px ">
				<br /><br />
				<h2 style="color: #475966;text-indent: 40px;">手机号注册</h2><br />
				<form action="UserServlet?opr=add" method="post" id="Myform">
				<span>手机号</span><br/><input type="text" name="phone" placeholder="请输入手机号"/>
				<span class="sp" id="sp_phone">手机号格式不正确</span><br/>
				<span>密码</span><br/><input type="password" name="passWord" />
				<span class="sp" id="sp_pwd">您输入的密码不符合规范(密码6-20位)</span><br/>
				<span>确认密码</span><br/><input type="password" name="pwd2"/>
				<span class="sp" id="sp_pwd2">两次密码输入不一致</span><br/>
				<span>邮箱</span><br/><input type="text" name="email" placeholder="请输入邮箱" /><br/>
				<span class="sp" id="sp_email">邮箱格式错误</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br />
				<input type="submit" value="注册" id="zhuce"/>
		</form>
			</div>
		</div>
	</body>

<script type="text/javascript">
	//随机数
	var mum = parseInt(Math.random() * 9999);
	if (mum < 1000) {
		mum = mum + 1000;
	}
	
	
</script>
</html>
