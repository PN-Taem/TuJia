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
		
  <link rel="stylesheet" href="css/amdin1.css" type="text/css"></link>
  <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
  </head>
  
  <body>
		<div id="active">
			<img src="/statics/img/10772600_medias_logo1.png" style="width: 204px; height: 60px;" id="img1" />
			<table id="table1">
				<tr>
					<td>xxx,欢迎你</td>
					
					<td>
						<a href="shouye.jsp">招聘首页</a>
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
		<div id="div3">
			<div class="one" style="background-color: white;"><input type="checkbox" checked="checked" />导入您本地的简历 (支持doc、docx、pdf、txt，且最大不能超过2M)</div>
			<div id="div233">我们会帮助您将信息提取出来，帮助您进行职位申请</div>
			<form action="Uploadservlet" method="post" enctype="multipart/form-data" id="post1">
				<tr>
					<input type="file" name="Myfile">
					<br>
				</tr>
			</form>
			<div class="tow" style="background-color: white;"><input type="checkbox" />不用了，我自己填写</div>
			<div class="div5"></div>
			<input type="submit" value="继续" id="submit" />
		</div>
		<div><img src="/statics/img/2019-08-08_152134.png" id="img2" /s></div>
		<div><img src="/statics/img/2019-08-08_152417.png" id="img3" /></div>
		<div id="div4">©2019 途家网网络技术（北京）有限公司 京ICP备05051632号 京公网安备 11010802020454号 帮助热线：4006506886</div>
	</body>

</html>
