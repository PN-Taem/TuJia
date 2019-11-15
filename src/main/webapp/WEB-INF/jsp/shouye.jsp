<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>途家首页</title>
  <!DOCTYPE html>
  <script type="text/javascript" src="/statics/js/index.js"></script>
  <link rel="stylesheet" href="/statics/css/index.css" type="text/css"></link>
  <script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
  <script type="text/javascript">
  $(function(){
  $("#d,#z").css({"color":"white","font-size":"12px"}).mouseover(function(){
	$(this).css("color","black");
  }).mouseout(function(){
	$(this).css("color","white");
	});  
  });
  </script>
  <script type="text/javascript" src="/statics/js/sweetalert.min.js"></script></head>
  
  <body><br>
  <br><html>

	<head>

		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="/statics/css/index.css"/>
		<script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="/statics/js/index.js" ></script>
	</head>

	<body>
		<div id="bei">
			<img src="/statics/img/10772600_themes_tujia_img_homebanner.jpg" />
		</div>
		<div id="xia">
			<div id="aa">

				<div id="dong"><img src="/statics/img/10772600_themes_tujia_img_fangzi.png" /></div>
			</div>
			<a id="login" href="#" style="width: 140px;margin-left: 190px"> <img src="/statics/img/2019-08-03_1324261.png" /></a>
			<ul>
				<li style="background: url(/statics/img/bai0.png)no-repeat;">
					<a href="/user/index.html">首页</a>
					<p>Home</p>
				</li>
				<li style="background: url(/statics/img/bai1.png) no-repeat;">
					<a href="/post/selectAll.html">社会招聘</a>
					<p>Social</p>
				</li>
				<li style="background: url(/statics/img/bai2.png) no-repeat;">
					<a>校园招聘</a>
					<p>Canpus</p>
				</li>
				<li style="background: url(/statics/img/bai3.png) no-repeat;">
					<a href="ZhuYe.jsp">关于我们</a>
					<p>About</p>
				</li>
			</ul>
			<div id="lian">
			<c:choose>
			<c:when test="${loing==true}">

			<a id="d" class="da" href="/apply/toGeRen.html" style="text-decoration: none;">个人中心</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
			<a id="z" class="da"href="/user/exitUser.html" style="text-decoration: none;">退出</a>
			
			</c:when>
			<c:otherwise>
			<a id="d" class="da" href="/login/login.html" style="text-decoration: none;">登录</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
			<a id="z" class="da"href="/login/login.html" style="text-decoration: none;">注册</a>
			</c:otherwise>
			</c:choose>
				
			</div>
		</div>

	</body>

</html>
  </body>
</html>
