<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人中心</title>
    
    <script type="text/javascript">
			$(function(){
				$(".bg").mouseover(function(){
				$(this).css("color","blue")
			})
				$(".bg").mouseout(function(){
					$(this).css("color","rgb(110,51,51)")
				})
			})
		</script>
  <script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
  <link rel="stylesheet" href="/statics/css/amdin3.css" type="text/css"></link>
  </head>
  
  <body>
		<div id="active">
			<img src="/statics/img/10772600_medias_logo1.png" style="width: 204px; height: 60px;" id="img1" />
			<table id="table1">
				<tr>
					<td>xxx,欢迎你</td>
					<td>
						<a href="#">招聘首页</a>
					</td>
					<td>
						<a href="#">招聘首页</a>
					</td>

				</tr>
			</table>

		</div>
		<div id="div2">
			<p id="p1">个人中心</p>
			<hr style="width: 100px;" />
			<table>
				<ul id="table2">
					<li id="content">
						<a class="bg" href="admin.html" style="color: rgb(51,51,51);">我的申请</a>
					</li>
					<li>
						<a class="bg" href="amdin1.html" style="color: rgb(51,51,51);">我的简历</a>
					</li>
					<li>
						<a class="bg"  href="amdin3.html" style="color: rgb(51,51,51);">账户设置</a>
					</li>
				</ul>

			</table>
		</div>
		<div id="div3" >
			<div style="background-color: white;">
				<div id="divs" class="div1" style="font-size: 30px;"><img src="/statics/img/1565313125(1).png"/></div>
				<div id="divs1">账户信息:	</div>
					<div id="hr1">
				<hr/></div>
				<p>手机号:</p><a id="a1" href="#">修改手机号</a>
				<p>邮箱:</p><a id="a1" href="#">修改邮箱</a>
				<p>密码:</p><a id="a1" href="#">设置密码</a>
				
			</div>
			
		</div>
		<div id="div4">©2019 途家网网络技术（北京）有限公司 京ICP备05051632号 京公网安备 11010802020454号 帮助热线：4006506886</div>
	</body>

</html>
