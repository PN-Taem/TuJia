<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta charset="UTF-8">
		<title>立即投稿</title>
		<script type="text/javascript" src="jquery-1.12.4.js" ></script>
		<script type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="css/TouGao.css"/>
	</head>
	<body>
		<div class="wei">
			<div class="wei1" >
				<div class="tup">
					<img src="img/tuptb.png" />
				</div>
				<div class="zit">
					   <div class="zit1">
					   	<span class="userName">${user.phone}></span>
						 <span class="il8n">${user.name},欢迎您!</span>
						 <span class="pad3">
						 	<a href="shouye.jsp" class="il8n">招聘首页</a>
						 </span>
						 <em class="gg">|</em>
						 
						 <span class="pad3">
						 	<a href="/apply/toGeRen.html" class="il8n">个人中心</a>
						 </span>
						 <em class="gg">|</em>
						 
						 <span class="pad3">
						 	<a href="/user/exitUser.html" class="il8n">退出</a>
						 </span>
					   </div>
				</div>
			</div>
		
		<div class="wei2">
			<div class="tup1">
				<img src="img/tup2.png" />
				<div class="an">
					<input type="radio" checked="checked" id="pastecheck" name="resumetype" value="0"/>
					<span class="il8n">导入您本地的简历 (支持doc、docx、pdf、txt，且最大不能超过2M)</span>
					<br />
					<br />
					<span class="tishi">
						我们会帮助您将信息提取出来，帮助您进行职位申请
					</span>
					<br />
				    <br />
				    <input type="text" class="wezi"/>
				    <input type="button" class="an1" value="浏览" />
				    <br />
				    <br />
				    <input type="radio"  class="an2" name="pastecheck" value="1"/>
				    <span class="il8n">
				    	不用了，我自己填写
				    </span>
				</div>
				
			</div>
			
			<div class="an3">
				<a href="GeRen.jsp" class="an4" >继续</a>
			</div>
		</div>
		
		
		</div>
	</body>
</html>
