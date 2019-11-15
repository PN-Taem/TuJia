<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="/statics/css/shenqing.css" />
<title>我的申请</title>

</head>

<body>
	<div id="head">
		<img src="/statics/img/10772600_medias_logo11.png"
			id="img1" />
		<div id="headnei">
			<a>${user.name}</a>,欢迎你！ <span><a href="shouye.jsp" style="color:black;text-decoration: none;">招聘首页</a></span> <span><a href="UserServlet?opr=tui" style="text-decoration: none;">退出</a></span>
		</div>
	</div>
	<div id="lift">
		<a id="tou" >个人中心
				<img src="/statics/img/2019-08-13_083945.png" />
			</a>
		<ul>
			<li><a style="color: white">我的申请</a></li>
			<li><a href="/apply/toJianLi.html" style="color:black;text-decoration: none;">我的简历</a></li>
			<li><a href="/apply/toXiuGai.html" style="color:black;text-decoration: none;">账户设置</a></li>
		</ul>
	</div>
	<div id="zhu" >
		<span><img src="/statics/img/2019-08-12_163820.png" /></span>
		<c:choose>
			<c:when test="${fn:length(applys)==0}"><%--如果等于就执行这个 --%>
				<span id="mei"> 您目前没有申请任何职位 </span>
			</c:when>
			<c:otherwise><%--否则就执行这个 --%>
			<span id="weiw">未完成申请</span>
			<span id="sp"><img src="img/2019-08-13_102754.png"/></span>
			
				<ul>
				<c:forEach items="${applys}" var="a">
						<li>${a.postname}</li>
						<li>${a.address}</li>
						<li>${a.state}</li>
						<li><a href="/apply/xiuApy.html?userIdu=${a.id}" style="text-decoration: none;color: blue;">继续申请</a></li>
						<li><a href="/apply/delApy.html?userIdd=${a.id}" onclick="return confirm('确定删除么?');" style="text-decoration: none;color: blue;">放弃申请</a></li>
				</c:forEach>
				</ul>
				
			</c:otherwise>
		</c:choose>
		<a id="cha" href="/post/selectAll.html"style="text-decoration: none;">查看更多职位</a>
	</div>
</body>

</html>
