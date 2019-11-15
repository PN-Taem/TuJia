<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		
		<meta charset="utf-8" />
		<link rel="stylesheet" href="/statics/css/jianli.css" />
		<title>我的简历</title>
<script type="text/javascript" src="/statics/js/jquery-1.10.2.js" ></script>
		<script type="text/javascript">
		
		</script>
	</head>

	<body>
		<div id="head">
			<img src="/statics/img/10772600_medias_logo11.png" id="img1" />
			<div id="headnei">
				<a>${user.name}</a>,欢迎你！
				<span><a href="/user/index.html" style="text-decoration: none; color:black;">招聘首页</a></span>
				<span><a href="/user/exitUser.html"  style="text-decoration: none;">退出</a></span>
			</div>
		</div>
		<div id="lift">
			<a id="tou" >个人中心
				<img src="/statics/img/2019-08-13_083945.png" />
			</a>

			<ul>
				<li><a href="/apply/shenQing.html" style="text-decoration: none; color: black;">我的申请</a></li>
				<li>
					<a style="color: white">我的简历</a>
				</li>

				<li><a href="/apply/toXiuGai.html" style="text-decoration: none; color: black;">账户设置</a></li>
			</ul>
		</div>
		<div id="zhu">
			<span><img src="/statics/img/2019-08-13_141452.png"/></span>

			<span id="weiw">个人信息</span>
			<span id="sp"><img src="/statics/img/2019-08-13_102754.png"/></span>
			<ul>
				<li><label>姓名：</label>
					<span class="preview_text">${user.name}</span>
				</li>
				<li><label>邮箱：</label>
					<span class="preview_text">${user.email }</span>
				</li>
				<li><label>手机号：</label>
					<span class="preview_text">${user.phone}</span>
				</li>
				<li><label>出生日期：</label>
					<span class="preview_text">${user.birthday}</span>
				</li>
				<li><label>性别：</label>
					<span name="RecruitmentPortalPersonProfile_gender_span" class="preview_text i18n">${user.sex}</span>
				</li>
				<li><label>毕业学校：${Educational.schoolname}</label>
					<span class="preview_text"></span>
				</li>
				<li><label>毕业时间：${Educational.time}</label>
					<span class="preview_text"></span>
				</li>

				<li><label>学历：${Educational.education}</label>
				</li>
			</ul>
		
		
			<a href="PostServlet" style="text-decoration: none;">查看更多职位>></a>
		</div>
	</body>

</html>
