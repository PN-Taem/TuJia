<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			*{
				margin: 0px 0px;
				padding: 0px 0px;
				
			}
			body{
				background-color: #EEEEEE;
			}
			header{
				background-color: white;
				width: 80%;
				height: 70px;
				margin: 0px auto;
			}
			#head_div{
				width: 140px;
				margin-left: 20px;
			}
			#head_div2 ul{
				float: left;
				margin-top: -25px;
				margin-left: 800px;
			}
			#head_div2 ul li{
				float: left;
				list-style: none;
				margin-left: 20px;
			}
			#head_div2 ul li a{
				text-decoration: none;
			}
			#cen_div{
				border: 0px solid black;
				width: 80%;
				margin: 0px auto;
				margin-top: 20px;
			}
			#cen_div_left{
				width: 160px;
				height: 230px;
				margin-left: 70px;
				background-color: #F6F6F6;
				border: 1px solid gainsboro;
				float: left;
			}
			#cen_div_left p{
				height: 40px;
				line-height: 40px;
				margin-top: 20px;
				margin-left: 20px;
				width: 80px;
				border-bottom: 1px solid black;
				color: #657BB2;
			}
			#cen_div_left ul {
				list-style: none;
				margin-top: 20px;
				margin-left: 20px;
			}
			#cen_div_left li a{
				color: black;
				font-size: 17px;
				text-decoration: none;
				
			}
			#cen_div_left li{
				margin-top: 20px;
			}
			#cen_div_left ul #imgLi{
				height: 35px;
				line-height: 35px;
				border: 0px solid black;
				background: url(img/settingchoose.gif) no-repeat;
				margin-left: -22px;
			}
			#cen_div_left ul #imgLi a{
				color: white;
				margin-left: 45px;
			}
			#cen_div_right{
				float: left;
				height: 530px;
				width: 793px;
				background-color: white;
				margin-left: 20px;
				border: 1px solid gainsboro;
			}
			#cen_div_right p:nth-of-type(1){
				margin-left: 0px;
				margin-top: 30px;
				font-size: 18px;
				background: url(img/dynamic_nav_bar_bg_mask.png) -16px 0px no-repeat;
				height: 40px;
				line-height: 40px;
				text-indent: 20px;
			}
			#cen_div_right_bto{
				border: 0px solid black;
				margin-top: 15px;
			}
			#cen_div_right_bto #sp_tou{
				color: black;
				font-size: 12px;
				margin-left: 40px;
				border-bottom: 1px #3887BC solid;
			}
			#cen_div_right_bto_zi{
				margin-top: 20px;
				margin-left: 80px;
				font-size: 14px;
				color: gray;
				
			}
			
			#cen_div_right_bto_zi a:nth-of-type(1){
					margin-left: 290px;
			}
			#cen_div_right_bto_zi a:nth-of-type(2){
					margin-left: 380px;
			}
			#cen_div_right_bto_zi a{
				color: cornflowerblue;
				font-size: 14px;
				cursor: pointer;
			}
			#cen_div_right_bto_zi a:hover{
				
			}
			#cen_div{
				clear: left;
			}
		</style>
	
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
					var TEL_phone = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
					var TEL_pwd=/^[\w_-]{6,16}$/;
					var TEL_email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
					var flag=true;
				$("input[name='jpwd']").focusout(function(){
					var jpwd=$(this).val();
					//alert(jpwd);
					var phone=$("input[name='phone']").val();
					//alert(phone);
					var url="UserServlet?opr=qPhone&phone="+phone+"&jpwd="+jpwd;
					$.get(url,null,function(data){
					if (data=='true') {
					flag=false;
					swal("提示", "原密码输入错误", "error");
					}else{
						flag=true;
					}
					})
				})
				$("#xiu_email_form").submit(function(){
					return check1();
				})
				$("#xiu_pwd_form").submit(function(){
					return check2();
				})
				
				function check2(){
				var passWord=$("input[name='xpwd']").val();
				var pwd2=$("input[name='qpwd']").val();
				 if(!TEL_pwd.test(passWord)){
				 swal("提示", "密码长度最少6位", "error");
					return false;
				}else if(pwd2!=passWord){
				 swal("提示", "两次密码输入不一致", "error");
					return false;
				}else if(!flag){
				swal("提示", "原密码输入错误", "error");
				return false;
				}
				return true;
			}
				function check1(){
				var email=$("input[name='email']").val();
				 if(!TEL_email.test(email)){
					swal("提示", "邮箱格式不正确", "error");
					return false;
				}
			}
				$("#xiu_email").click(function(){
					$("#zi_1").hide();
					$("#xiu_email_div").show();
				});
				$("#qx_email").click(function(){
					$("#zi_1").show();
					$("#xiu_email_div").hide();
				});
				$("#xiu_pwd").click(function(){
					$("#zi_1").hide();
					$("#xiu_pwd_div").show();
				});
				$("#qx_pwd").click(function(){
					$("#zi_1").show();
					$("#xiu_pwd_div").hide();
				});
			});
		</script>
	<script type="text/javascript" src="js/sweetalert.min.js"></script>
	<link rel="stylesheet" href="css/jianli.css" type="text/css"></link></head>
	<body>
		<div id="head">
			<img src="img/10772600_medias_logo11.png" id="img1" />
			<div id="headnei">
				<a>${user.name}</a>,欢迎你！
				<span><a href="shouye.jsp" style="text-decoration: none; color:black;">招聘首页</a></span>
				<span><a href="UserServlet?opr=tui"  style="text-decoration: none;">退出</a></span>
			</div>
		</div>
		
		<div id="cen_div">
			<div id="cen_div_left">
				<p>账户设置</p>
				<hr  style="width: 40px; margin-left: 100px; margin-top: -1px; color: gainsboro;"/>
				<ul>
					<li><a href="shenqing.jsp">我的申请</a></li>
					<li><a href="Jianli.jsp">我的简历</a></li>
					<li id="imgLi"><a href="#">账户设置</a></li>
				</ul>
			</div>
			<div id="cen_div_right">
				<p>账户设置</p>
				<div id="cen_div_right_bto">
				<span id="sp_tou">账户信息</span>
				<hr  style="width: 753px; margin-left: 40px; color: darkgray;"/>
				
				<div id="cen_div_right_bto_zi">
					<div id="zi_1">
						<span>
						手机号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 50px">${user.phone}</span>
					</span>
					<br /><br />
					<span>
						邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 50px">${user.email}</span>
					</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;<a id="xiu_email">修改邮箱</a>
					<br /><br />
					<span>
						密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*******
					</span>
					<a id="xiu_pwd">修改密码</a>
					</div>
				
					<div id="xiu_email_div" style="display: none;">
						<form action="UserServlet?opr=xiuEmail" method="post" id="xiu_email_form">
							邮箱:&nbsp;&nbsp;&nbsp;
							<input type="hidden" value="${user.phone }"name="phone"/>
							<input type="text" name="xEmail"  placeholder="请输入新邮箱"/>
							<input type="submit"  id="x_email" value="确认" style="margin-left: 100px;"/>
							<input type="reset" name="qx_email" id="qx_email" value="取消" style="margin-left: 20px;"/>
						</form>
					</div>
					
					<div id="xiu_pwd_div" style="display: none;">
						<form action="UserServlet?opr=xiuPhone" method="post" id="xiu_pwd_form">
						<input type="hidden" value="${user.phone }" name="phone"/>
							<span>手机号：${user.phone }</span>
							<br /><br />
							旧密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="password" value="" placeholder="请输入旧密码" name="jpwd"/>
							<br /><br />
							新密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="password" value="" placeholder="请输入新密码"name="xpwd"/>
							<br /><br />
							确认密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="password" value="" placeholder="请确认密码"name="qpwd"/>
							<br /><br />
							<input type="submit" name="q_pwd" id="q_pwd" value="确认" style="margin-left: 100px;"/>
							<input type="reset" name="qx_pwd" id="qx_pwd" value="取消" style="margin-left: 20px;"/>
						</form>
					</div>
				</div>
			</div>
			</div>
			
		</div>
	</body>
</html>

