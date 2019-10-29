<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<meta charset="UTF-8">
		<title>申请职位</title>
		<script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
		<link rel="stylesheet" type="text/css" href="css/TiJiao.css"/>
		<script type="text/javascript">
			
		</script>
		<style>
			
		</style>
	</head>
	<body>
		<div class="geren">
			<div class="geren1" >
				<div class="tup2">
					<img src="img/tuptb.png" />
				</div>
				<div class="geren2">
					   <div class="geren3">
					   	<span class="userName">137****1903></span>
						 <span class="il8n">,欢迎您!</span>
						 <span class="pad3">
						 	<a href="shouye.jsp" class="il8n">招聘首页</a>
						 </span>
						 <em class="gg1">|</em>
						 
						 <span class="pad3">
						 	<a href="ApplysServlet" class="il8n">个人中心</a>
						 </span>
						 <em class="gg1">|</em>
						 
						 <span class="pad3">
						 	<a href="UserServlet?opr=tui" class="il8n">退出</a>
						 </span>
					   </div>
				</div>
			</div>
			<div class="geren4">
				<h3 class="zit2">
					<span class="il8n" style="font-weight: bold;">申请职位：</span>
					<span class="zit3" style="font-weight: bold;">
						<strong style="font-weight: bold;">
							财务部-高级财务经理/总监(J10804)
						</strong>
					</span>
				</h3>
				
				<div class="geren6">
					<table align="center" class="geren5">
					
					<tbody>
						<tr>
							<td class="td1" align="center">
								<ul class="diul1">
									<li class="dili1">
										<a href="#" >
											<span class="zit4">1基本信息</span>
										</a>
									</li>
									
									<li class="dili2"></li>
									<li class=" dili3">
										<a href="#" >
											<span class="zit5">2个人履历</span>
										</a>
									</li>
									<li class="dili2"></li>
									<li class="dili4">
										<a href="#" >
											<span class="zit6">3预览/提交</span>
										</a>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
					
					
					
				</table>
				</div>
				
			</div>
			
			<div class="geren7">
				<div class="geren8">
					<h3 class="hh">
						<span class="zit7">预&nbsp;览&nbsp;提&nbsp;交 </span>
					</h3>
					
					
				<div class="tijiao">
					
				</div>
					
					<div class="buzhi">
						<a href="#">上一步</a>
						<input type="button" class="baocun" value="提交申请"/>
					</div>
					
				</div>
				
			
				
				
			</div>
			
		</div>
	</body>
</html>
