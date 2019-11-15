<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
  <script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
  		<script type="text/javascript">
  		$(function(){
  		$("#login").click(function(){
  		var name=$("input[name='name']").val();
  		var pwd=$("input[name='passWord']").val();
  		if (""==name||name==null) {
			swal("提示", "请先输入用户名！", "error");
			return;
		}if (""==pwd||pwd==null) {
			swal("提示", "请先输入密码！", "error");
			return;
		}
		$.get("adminServlet?opr=login&name="+name+"&pwd="+pwd,null,function(data){
			if (data=='false') {
				swal("提示", "用户名或密码错误！", "error");
			} else {
				location.href="HouTaiServlet";
			}
		});
  			});
  		});
  		</script>
  <link rel="stylesheet" href="css/add.css" type="text/css">
  </link><script type="text/javascript" src="/statics/js/sweetalert.min.js"></script></head>
 <body>
		<header>
			<div id="head_tou">
				<img src="/statics/img/10772600_medias_logo1.png" width="180"/>
				
			</div>
		</header>
		<div id="body_cen" style="height:500px"><br /><br />
			<div id="body_form">
				<br /><br /><br /><br />
				<h2 style="color: #475966;text-indent: 90px;">管理员登录</h2><br />
				 <form action="" method="post" id="Myform">
				<span>用户名</span><br/><input type="text" name="name" placeholder="请输入用户名"/>
				<br/><br />
				<span>密码</span><br/><input type="password" name="passWord" placeholder="请输入密码"/>
				<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br />
				<input type="button" value="登录" id="login"/>
		 </form>
			</div>
		</div>
	</body>
</html>
