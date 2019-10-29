<%@page import="service.impl.TypeOneServiceImpl"%>
<%@page import="service.TypeOneService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="ch">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="途家招聘 ">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>途家招聘后台管理</title>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	$(function() {
				var TEL_phone = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
				var TEL_pwd=/^[\w_-]{6,16}$/;
				var TEL_email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
				var flag=true;
				$("input[name='jpwd']").focusout(function(){
					var jpwd=$(this).val();
					var name=$("input[name='name']").val();
					var url="adminServlet?opr=yan&name="+name+"&jpwd="+jpwd;
					if (jpwd!=null&&jpwd!="") {
					$.get(url,null,function(data){
					if (data=='true') {
					flag=false;
					swal("提示", "原密码输入错误", "error");
					}else{
						flag=true;
					}
					});
					}
				
		});
		$("#bao").click(function(){
				var passWord=$("input[name='xpwd']").val();
				var pwd2=$("input[name='qpwd']").val();
				 if(!TEL_pwd.test(passWord)){
				 swal("提示", "密码长度最少6位", "error");
					return;
				}else if(pwd2!=passWord){
				 swal("提示", "两次密码输入不一致", "error");
					return ;
				}else if(!flag){
				swal("提示", "原密码输入错误", "error");
					return;
				}
				var xpwd=$("input[name='xpwd']").val();
					var name=$("input[name='name']").val();
					var url="adminServlet";
				$.post(url,{"name":name,"xpwd":xpwd},function(data){
					if(data=='true'){
					swal("提示", "密码修改成功,请重新登录！", "warning");
						setInterval(function(){
							location.href="admin.jsp";
						},4000);
					}else{
					swal("提示", "密码修改失败！", "error");
					}
				})
		});
		function check2(){
				var passWord=$("input[name='xpwd']").val();
				var pwd2=$("input[name='qpwd']").val();
				 if(!TEL_pwd.test(passWord)){
				 swal("提示", "密码长度最少6位", "error");
					return;
				}else if(pwd2!=passWord){
				 swal("提示", "两次密码输入不一致", "error");
					return ;
				}else if(!flag){
				swal("提示", "原密码输入错误", "error");
					return;
				}
			}

		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var itmeObj = $(".meun-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");
			;
			attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
		$("#topAD").click(function() {
			$("#topA").toggleClass(" glyphicon-triangle-right");
			$("#topA").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topBD").click(function() {
			$("#topB").toggleClass(" glyphicon-triangle-right");
			$("#topB").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topCD").click(function() {
			$("#topC").toggleClass(" glyphicon-triangle-right");
			$("#topC").toggleClass(" glyphicon-triangle-bottom");
		});
		$(".toggle-btn").click(function() {
			$("#leftMeun").toggleClass("show");
			$("#rightContent").toggleClass("pd0px");
		});
			
			
		
			
			
		$(".cha").click(
				function() {

					var a = $(this).next().val();

					$.post("HouTaizsgServlet", {
						"por" : "cha",
						"id" : a,
					}, function(data) {
						//alert(data[0].postname);
						$("#qymc").val(data[0].postname);
						$("#xlei option[value=" + data[0].typeOneId + "]")
								.attr("selected", "selected");
						$("#xgang option[value=" + data[0].typeTwoId + "]")
								.attr("selected", "selected");
						$("#cc option[value=" + data[0].typeThreeId + "]")
								.attr("selected", "selected");
						$("#xsaddress option[value=" + data[0].addressid + "]")
								.attr("selected", "selected");
						$("#zeyq").val(data[0].describe);
						$("#zexq").val(data[0].request);
						$("#gxq").val(data[0].postrecruit);
						$("#postid").val(data[0].postid);
					}, "json");
				});
				
				
				$(".shan").click(
				function() {
					var a = $(this).next().val();
					$("#queshan").attr("value",a);
					var aa=$("#queshan").val();
				});
				
				$("#quereshan").click(function(){
				var id= $("#queshan").val();
				location.href="HouTaizsgServlet?por=shan&idshan="+id;
				
				
				});
				
		//修改
		$("#update").submit(function() {
			var name = $("#qymc").val();
			var one = $("#xlei").val();
			var two = $("#xgang").val();
			var three = $("#cc").val();
			var addressid = $("#xsaddress").val();
			var yuqiu = $("#zeyq").val();
			var yaoqiu = $("#zexq").val();
			var renshu = $("#gxq").val();
			if (name == "") {
				swal("请输入企业名称");
				return false;
			} else if (one == "") {
				swal("请选择职业类型");
				return false;
			} else if (two == "") {
				swal("请选择岗位类型");
				return false;
			} else if (three == "") {
				swal("请选择工作职位");
				return false;
			} else if (addressid == -1) {
				swal("请选择地址");
				return false;
			} else if (yuqiu == "") {
				swal("输入就业需求");
				return false;
			} else if (yaoqiu == "") {
				swal("输入就业要求");
				return false;
			} else if (renshu == "") {
				swal("请输入人数");
				return false;
			}
			return true;
		});
		
			//新增
		$("#insertt").submit(function(){
		
			var name = $("#pming").val();
			var one = $("#plei").val();
			var two = $("#pgang").val();
			var three = $("#pzhi").val();
			var addressid = $("#pdi").val();
			var yuqiu = $("#pyao").val();
			var yaoqiu = $("#pxu").val();
			var renshu = $("#pren").val();
			if (name == "") {
				swal("请输入企业名称");
				return false;
			} else if (one == "") {
				swal("请选择职业类型");
				return false;
			} else if (two == "") {
				swal("请选择岗位类型");
				return false;
			} else if (three == "") {
				swal("请选择工作职位");
				return false;
			} else if (addressid == "") {
				swal("请选择地址");
				return false;
			} else if (yuqiu == "") {
				swal("输入就业需求");
				return false;
			} else if (yaoqiu == "") {
				swal("输入就业要求");
				return false;
			} else if (renshu == "") {
				swal("请输入人数");
				return false;
			}
			return true;
		});

		//保存下拉框
		$("#plei").change(
		
				function() {
				
					var xuan = $("#plei").val();
					if (xuan != 1) {
						$("#pzhi").hide();
						$("#pz").hide();
						$.post("HouTaiServlet", {
							"xuan" : xuan
						}, function(data) {
							var $se = $("#pgang>select");
							var str = null;

							for ( var i = 0; i < data.length; i++) {
								str += "<option value="+data[i].id+">"
										+ data[i].name + "</option>";
								$se.append(str);
							}
							$("#pgang").html(str);
						}, "json");
					} else {
						$("#pzhi").show();
						$("#pz").show();
						$.post("HouTaiServlet", {
							"xuan" : xuan
						}, function(data) {
							var $se = $("#pgang>select");
							var str = null;

							for ( var i = 0; i < data.length; i++) {
								str += "<option value="+data[i].id+">"
										+ data[i].name + "</option>";
								$se.append(str);
							}
							$("#pgang").html(str);
						}, "json");

					}

				});
		//修改下拉框
		$("#xlei").change(
				function() {
					var xuan = $("#xlei").val();

					if (xuan != 1) {
						$("#cc").hide();
						$("#xz").hide();
						$.post("HouTaiServlet", {
							"xuan" : xuan
						}, function(data) {
							var $se = $("#xgang>select");
							var str = null;

							for ( var i = 0; i < data.length; i++) {
								str += "<option value="+data[i].id+">"
										+ data[i].name + "</option>";
								$se.append(str);
							}
							$("#xgang").html(str);
						}, "json");
					} else {
						$("#cc").show();
						$("#xz").show();
						$.post("HouTaiServlet", {
							"xuan" : xuan
						}, function(data) {
							var $se = $("#gang>select");
							var str = null;

							for ( var i = 0; i < data.length; i++) {
								str += "<option value="+data[i].id+">"
										+ data[i].name + "</option>";
								$se.append(str);
							}
							$("#gang").html(str);
						}, "json");

					}

				});

	});
</script>
<!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
<![endif]-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
<script type="text/javascript" src="js/sweetalert.min.js"></script>
</head>

<body>
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="左右结构项目" src="img/logo.png"><span>途家招聘</span>
				</p>
			</div>
			<div id="personInfor">
				<p id="userName">管理员:${admin.name }</p>
				<p>
					<a href="adminServlet?opr=tui">退出登录</a>
				</p>
			</div>
			<div class="meun-title">账号管理</div>
			<div class="meun-item meun-item-active" href="#sour"
				aria-controls="sour" role="tab" data-toggle="tab">
				<img src="img/icon_source.png">资企管理
			</div>
			
			<div class="meun-item" href="#user" aria-controls="user" role="tab"
				data-toggle="tab">
				<img src="img/icon_user_grey.png">用户管理
			</div>
			<div class="meun-item" href="#chan" aria-controls="chan" role="tab"
				data-toggle="tab">
				<img src="img/icon_change_grey.png">修改密码
			</div>
			
		</div>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i> </a>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 资源管理模块 -->
				<div role="tabpanel" class="tab-pane active" id="sour">


					<div class="check-div form-inline">
						<button class="btn btn-yellow btn-xs" data-toggle="modal"
							data-target="#addSource">企业入驻</button>
					</div>

					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">编号</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">职位</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">申请时间</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">操作</div>

						</div>

						<div class="tablebody">
							<c:forEach items="${posts.yings}" var="poste">
								<div class="row">
									<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
										${poste.postid}</div>
									<div id="topAD" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
										role="button" data-toggle="collapse" data-parent="#accordion"
										href="#collapseSystem" aria-expanded="true"
										aria-controls="collapseOne">
										<span>${poste.postname }</span>
									</div>
									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										${poste.posttime }</div>
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<button class="cha btn-success btn-xs" data-toggle="modal"
											data-target="#changeSource">修改</button>
										<input type="hidden" class="poi" value="${poste.postid}">
										<button class="shan btn btn-danger btn-xs" data-toggle="modal"
											data-target="#deleteSource">删除</button>
											<input type="hidden" class="poi" value="${poste.postid}">
									</div>
								</div>
							</c:forEach>
						</div>


						<!--系统管理折叠狂-->
						<!--                                <div id="collapseSystem" class="collapse in" aria-expanded="true">
                                    <div class="row">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 levl2 ">
                                            2
                                        </div>
                                        <div id="topBD" onClick="changeA()" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 levl2" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseAccount" aria-expanded="true" aria-controls="collapseOne">
                                            <span onClick="changeB()" id="topB" class="glyphicon glyphicon-triangle-bottom"></span> <span>账号管理</span>
                                        </div>
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                            /rlist/
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource">修改</button>
                                            <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>
                                        </div>
                                    </div>
                                    <!--用户管理折叠狂-->
						<!--<div id="collapseAccount" class="collapse in" aria-expanded="true">
                                        <div class="row">
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 levl3 ">
                                                1
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  levl3">
                                                <span class=""> &nbsp;</span><span>资源管理</span>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                /admin/system/userlist/software/
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource">修改</button>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>
                                            </div>
                                        </div>
                                 
                                        <div class="row">
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1  levl3 ">
                                                2
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  levl3">
                                                <span></span><span>权限管理</span>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                /admin/system/userlist/software/
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource">修改</button>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 levl2 ">
                                            3
                                        </div>
                                        <div id="topCD" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 levl2" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSchool" aria-expanded="true" aria-controls="collapseOne">
                                            <span id="topC" onClick="changeC()" class="glyphicon glyphicon-triangle-bottom"></span><span> 地区管理</span>
                                        </div>
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                            /admin/system
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource">修改</button>
                                            <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>
                                        </div>
                                    </div>-->
						<!--地区管理折叠狂-->
						<!--<div id="collapseSchool" class="collapse in" aria-expanded="true">
                                        <div class="row">
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1  levl3">
                                                1
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4   levl3">
                                                <span></span><span>地区管理</span>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                /admin/system/userlist/software/
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource">修改</button>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 levl3">
                                                2
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  levl3">
                                                <span></span><span>规则管理</span>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                /admin/system/userlist/software/
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                <button class="btn btn-success btn-xs " data-toggle="modal " data-target="#changeSource ">修改</button>
                                                <button class="btn btn-danger btn-xs " data-toggle="modal " data-target="#deleteSource ">删除</button>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 levl3 ">
                                                3
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 levl3">
                                                <span></span><span>人员信息</span>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                /admin/system/userlist/software/
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource">修改</button>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1   levl3">
                                                4
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  levl3">
                                                <span></span><span>座位管理</span>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                /admin/system/userlist/software/
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
                                                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource">修改</button>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">

						<li class="gray">共${posts.totalPage }页</li>
						<li class="gray">第${posts.pageNo }页</li>
						<%--首页 --%>

						<li class="gray"><c:if test="${posts.pageNo!=1}">
								<a
									href="HouTaiServlet?pageNo=1&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}"
									style="color: black;">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
    					    </c:if>
						</li>
						<c:if test="${size!=0 }">
							<c:if test="${posts.pageNo!=1}">
								<li class="gray"><a
									href="HouTaiServlet?pageNo=${posts.pageNo-1}&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}"
									style="color: black;">上一页 </i> </a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
							</c:if>


							<c:if test="${posts.pageNo!=posts.totalPage}">

								<li class="gray"><a
									href="HouTaiServlet?pageNo=${posts.pageNo+1}&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}"
									style="color: black;">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>

								<li class="gray"><a
									href="HouTaiServlet?pageNo=${posts.totalPage}&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}"
									style="color: black;">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
							</c:if>
						</c:if>

					</ul>
					</footer>
					<!--弹出窗口 企业入驻-->
					<!--<form action="HouTaizsgServlet?por=insert" method="post"-->

					<div class="modal fade" id="addSource" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">企业入驻</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal" method="post" action="HouTaizsgServlet?por=insert" id="insertt">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">企业名称：</label>
												<div class="col-xs-8 ">
													<input type="text" class="form-control input-sm duiqi"
														id="pming" name="pming">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">职位类型：</label>
												<div class="col-xs-8 ">
													<!-- <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">-->
													<select name="plei" class="form-control input-sm duiqi"
														id="plei">
														<option value="">请选择</option>
														<c:forEach items="${one}" var="one">
															<option value="${one.id }">${one.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">岗位：</label>
												<div class="col-xs-8 ">
													<!-- <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">-->
													<select name="pgang" class="form-control input-sm duiqi"
														id="pgang">
														<option value="">请选择</option>
														<c:forEach items="${two}" var="two">
															<option value="${two.id }">${two.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label" id="pz">职位：</label>
												<div class="col-xs-8 ">
													<!-- <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">-->
													<select name="pzhi" class="form-control input-sm duiqi"
														id="pzhi">
														<option value="12">无</option>
														<c:forEach items="${three}" var="three">
															<option value="${three.id }">${three.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">岗位需求：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="pren" name="pren">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">地址：</label>
												<div class="col-xs-8">
													<select name="pdi" class="form-control input-sm duiqi"
														id="pdi">
														<option value="">请选择</option>
														<c:forEach items="${addressList}" var="address">
															<option value="${address.id}">${address.address}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">职位要求：</label>
												<div class="col-xs-8">
													<textarea name="pyao" class="form-control input-sm duiqi"
														id="pyao"></textarea>

												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">职位需求：</label>
												<div class="col-xs-8">
													<textarea name="pxu" class="form-control input-sm duiqi"
														id="pxu"></textarea>

												</div>
											</div>
											<div class="modal-footer">
												<button type="reset" class="btn btn-xs btn-white"
													data-dismiss="reset">取 消</button>
												<button type="submit" class="btn btn-xs btn-green">保
													存</button>
											</div>
										</form>
									</div>
								</div>

							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- </form>-->

					<!-- /.modal -->

					<!--修改资源弹出窗口-->
					<div class="modal fade" id="changeSource" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改资源</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal"
											action="HouTaizsgServlet?por=update" method="post"
											id="update">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">企业名称：</label>
												<div class="col-xs-8 ">
													<input type="text" class="form-control input-sm duiqi"
														id="qymc" name="qymcc" />
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">职业类型：</label>
												<div class="col-xs-8 ">
													<select name="xlei" class="form-control input-sm duiqi"
														id="xlei">
														<option value="">请选择</option>
														<c:forEach items="${one}" var="one">
															<option value="${one.id }">${one.name }</option>
														</c:forEach>

													</select>

												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">工作岗位：</label>
												<div class="col-xs-8">
													<select name="xgang" class="form-control input-sm duiqi"
														id="xgang">
														<option value="">请选择</option>
														<c:forEach items="${two}" var="two">
															<option value="${two.id }">${two.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label" id="xz">工作职位：</label>
												<div class="col-xs-8">
													<select name="cc" class="form-control input-sm duiqi"
														id="cc">
														<option value="12">无</option>
														<c:forEach items="${three}" var="three">
															<option value="${three.id }">${three.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">岗位需求：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="gxq" name="gxq" />
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">地址：</label>
												<div class="col-xs-8">
													<select name="xsaddress"
														class="form-control input-sm duiqi" id="xsaddress">
														<option value="-1">请选择</option>
														<c:forEach items="${addressList}" var="address">
															<option value="${address.id }">${address.address}</option>
														</c:forEach>

													</select>
												</div>
											</div>
											<input type="hidden" name="postid" value="" id="postid" />
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">职位要求：</label>
												<div class="col-xs-8">
													<textarea name="zeyq" class="form-control input-sm duiqi"
														id="zeyq"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">职位需求：</label>
												<div class="col-xs-8">
													<textarea name="zexq" class="form-control input-sm duiqi"
														id="zexq"></textarea>
												</div>
											</div>
											<div class="modal-footer">
												<button type="reset" class="btn btn-xs btn-white"
													data-dismiss="reset">取 消</button>
												<button type="submit" class="btn btn-xs btn-green">保
													存</button>
											</div>
										</form>
									</div>
								</div>

							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					<!--弹出删除资源警告窗口-->
					<div class="modal fade" id="deleteSource" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<input type="hidden" id="queshan" value=""/>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该职位？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-danger" id="quereshan" >确认</button>
								
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>
				<!-- 权限管理模块 -->
				<div role="tabpanel" class="tab-pane" id="char">

					<div class="check-div">
						<button class="btn btn-yellow btn-xs" data-toggle="modal"
							data-target="#addChar">添加权限</button>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-1 ">编码</div>
							<div class="col-xs-4">权限名</div>
							<div class="col-xs-5">描述</div>
							<div class="col-xs-2">操作</div>
						</div>
						<div class="tablebody">
							<div class="row">
								<div class="col-xs-1 ">1</div>
								<div class="col-xs-4">
									</span><span>管理员</span>
								</div>
								<div class="col-xs-5">管理员具有超年权限</div>
								<div class="col-xs-2">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#changeChar">修改</button>
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteChar">删除</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-1 ">2</div>
								<div class="col-xs-4">
									<span>游客</span>
								</div>
								<div class="col-xs-5">可以查看信息</div>
								<div class="col-xs-2">
									<button class="btn btn-success btn-xs">修改</button>
									<button class="btn btn-danger btn-xs">删除</button>
								</div>
							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
					</footer>
					<!--增加权限弹出窗口-->
					<div class="modal fade" id="addChar" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">添加权限</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">权限名：</label>
												<div class="col-xs-6 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">描述：</label>
												<div class="col-xs-6 ">
													<textarea class="form-control input-sm duiqi"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">系统资源：</label>
												<div class="col-xs-6">
													<input type="" class="form-control input-sm duiqi"
														id="sOrd" placeholder="">
												</div>
											</div>

										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--修改权限弹出窗口-->
					<div class="modal fade" id="changeChar" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改权限</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">权限名：</label>
												<div class="col-xs-6 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">描述：</label>
												<div class="col-xs-6 ">
													<textarea class="form-control input-sm duiqi"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">系统资源：</label>
												<div class="col-xs-6">
													<input type="" class="form-control input-sm duiqi"
														id="sOrd" placeholder="">
												</div>
											</div>

										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出删除权限警告窗口-->
					<div class="modal fade" id="deleteChar" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该权限？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-danger">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
				<!--用户管理模块-->
				<div role="tabpanel" class="tab-pane" id="user">
					<div class="check-div form-inline">
						<div class="col-xs-3">
							<button class="btn btn-yellow btn-xs" data-toggle="modal"
								data-target="#addUser">添加用户</button>
						</div>
						<div class="col-xs-4">
							<input type="text" class="form-control input-sm"
								placeholder="输入文字搜索">
							<button class="btn btn-white btn-xs ">查 询</button>
						</div>
						<div class="col-lg-3 col-lg-offset-2 col-xs-4"
							style=" padding-right: 40px;text-align: right;">
							<label for="paixu">排序:&nbsp;</label> <select
								class=" form-control">
								<option>地区</option>
								<option>地区</option>
								<option>班期</option>
								<option>性别</option>
								<option>年龄</option>
								<option>份数</option>
							</select>
						</div>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 ">用户名</div>
							<div class="col-xs-2">地区</div>
							<div class="col-xs-2">真实姓名</div>
							<div class="col-xs-2">电话</div>
							<div class="col-xs-2">状态</div>
							<div class="col-xs-2">操作</div>
						</div>
						<div class="tablebody">

							<div class="row">
								<div class="col-xs-2 ">goodmoning</div>
								<div class="col-xs-2">国际关系地区</div>
								<div class="col-xs-2">李豆豆</div>
								<div class="col-xs-2">13688889999</div>
								<div class="col-xs-2">状态</div>
								<div class="col-xs-2">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#reviseUser">修改</button>
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteUser">删除</button>
								</div>
							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
					</footer>

					<!--弹出添加用户窗口-->
					<div class="modal fade" id="addUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">用户名：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm duiqi"
														id="sLink" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sOrd" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">电话：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sKnot" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">地区：</label>
												<div class="col-xs-8">
													<select class=" form-control select-duiqi">
														<option value="">国际关系地区</option>
														<option value="">北京大学</option>
														<option value="">天津大学</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">权限：</label>
												<div class="col-xs-8">
													<select class=" form-control select-duiqi">
														<option value="">管理员</option>
														<option value="">普通用户</option>
														<option value="">游客</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="situation" class="col-xs-3 control-label">状态：</label>
												<div class="col-xs-8">
													<label class="control-label" for="anniu"> <input
														type="radio" name="situation" id="normal">正常</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
														class="control-label" for="meun"> <input
														type="radio" name="situation" id="forbid"> 禁用</label>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出修改用户窗口-->
					<div class="modal fade" id="reviseUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">用户名：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm duiqi"
														id="sLink" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sOrd" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">电话：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sKnot" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">地区：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sKnot" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">权限：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sKnot" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="situation" class="col-xs-3 control-label">状态：</label>
												<div class="col-xs-8">
													<label class="control-label" for="anniu"> <input
														type="radio" name="situation" id="normal">正常</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
														class="control-label" for="meun"> <input
														type="radio" name="situation" id="forbid"> 禁用</label>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出删除用户警告窗口-->
					<div class="modal fade" id="deleteUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该用户？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn  btn-xs btn-danger">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
				<!-- 修改密码模块 -->
				<div role="tabpanel" class="tab-pane" id="chan">
					<div class="check-div"></div>
					<div
						style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
						<form class="form-horizontal" method="post" action="adminServlet" id="myform">
						<input value="${admin.name }" name="name" type="hidden"/>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">原密码：</label>
								<div class="col-xs-5">
									<input type="password" class="form-control input-sm duiqi" id="sKnot"
										placeholder="" style="margin-top: 7px;" name="jpwd">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">新密码：</label>
								<div class="col-xs-5">
									<input type="password" class="form-control input-sm duiqi" id="sKnot"
										placeholder="" style="margin-top: 7px;" name="xpwd">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
								<div class="col-xs-5">
									<input type="password" class="form-control input-sm duiqi" id="sKnot"
										placeholder="" style="margin-top: 7px;" name="qpwd">
								</div>
							</div>
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">
									<button type="reset" class="btn btn-xs btn-white">取 消</button>
									<button type="button" class="btn btn-xs btn-green" id="bao">保存</button>
								</div>
							</div>
						</form>
					</div>

				</div>
				<!--地区管理模块-->
				<div role="tabpanel" class="tab-pane" id="scho">

					<div class="check-div form-inline">
						<div class="col-xs-3">
							<button class="btn btn-yellow btn-xs" data-toggle="modal"
								data-target="#addSchool">添加地区</button>
						</div>
						<div class="col-lg-4 col-xs-5">
							<input type="text" class=" form-control input-sm "
								placeholder="输入文字搜索">
							<button class="btn btn-white btn-xs ">查 询</button>
						</div>
						<div class="col-lg-3 col-lg-offset-1 col-xs-3"
							style="padding-right: 40px;text-align: right;float: right;">
							<label for="paixu">排序:&nbsp;</label> <select class="form-control">
								<option>地区</option>
								<option>排名</option>
							</select>
						</div>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-1 ">编码</div>
							<div class="col-xs-2 ">地区</div>
							<div class="col-xs-1">经度</div>
							<div class="col-xs-1">维度</div>
							<div class="col-xs-2">建筑信息</div>
							<div class="col-xs-2">人员列表</div>
							<div class="col-xs-2">操作</div>
						</div>
						<div class="tablebody">

							<div class="row">
								<div class="col-xs-1 ">1</div>
								<div class="col-xs-2">国际关系地区</div>
								<div class="col-xs-1">45.0</div>
								<div class="col-xs-1">95.90</div>
								<div class="col-xs-2">
									<a class="linkCcc">查看</a>
								</div>
								<div class="col-xs-2">
									<a class="linkCcc">查看</a>
								</div>
								<div class="col-xs-2">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#reviseSchool">修改</button>
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteSchool">删除</button>
								</div>
							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
					</footer>

					<!--弹出添加用户窗口-->
					<div class="modal fade" id="addSchool" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">添加地区</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">地区名称：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">经度：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">纬度：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm duiqi"
														id="sLink" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">简称：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sOrd" placeholder="">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出修改用户窗口-->
					<div class="modal fade" id="reviseSchool" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改地区</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">地区名称：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName">
												</div>
											</div>
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">经度：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">纬度：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm duiqi"
														id="sLink" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">简称：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sOrd" placeholder="">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出删除用户警告窗口-->
					<div class="modal fade" id="deleteSchool" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该地区？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-danger">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
				<!--规则管理模块-->
				<div role="tabpanel" class="tab-pane" id="regu"
					style="padding-top: 50px;">
					<div class="data-div">
						<div class="tablebody col-lg-10 col-lg-offset-1">
							<div class="row">
								<div class="col-xs-3" style="padding-right: 0;">签到超时时间</div>
								<div class="col-xs-7 expand-col">
									<div class="slider-minmax1"></div>
									<div class="row top100">
										<span class="left">0</span> <span class="right">30</span>
									</div>
								</div>
								<div class="col-xs-2">
									<button class="btn btn-xs btn-white">默认值</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3" style="padding-right: 0;">抢座超时时间</div>
								<div class="col-xs-7 expand-col">
									<div class="slider-minmax2"></div>
									<div class="row top100">
										<span class="left">0</span> <span class="right">15</span>
									</div>
								</div>
								<div class="col-xs-2">
									<button class="btn btn-xs btn-white">默认值</button>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-3" style="padding-right: 0;">临时离开超时时间</div>
								<div class="col-xs-7 expand-col">
									<div class="slider-minmax3"></div>
									<div class="row top100">
										<span class="left">0</span> <span class="right">60</span>
									</div>
								</div>
								<div class="col-xs-2">
									<button class="btn btn-xs btn-white">默认值</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3" style="padding-right: 0;">违约次数冻结上限</div>
								<div class="col-xs-7 expand-col">
									<div class="slider-minmax4"></div>
									<div class="row top100">
										<span class="left">0</span> <span class="right">100</span>
									</div>
								</div>
								<div class="col-xs-2">
									<button class="btn btn-xs btn-white">默认值</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3" style="padding-right: 0;">可预约天数</div>
								<div class="col-xs-7 expand-col">
									<div class="slider-minmax5"></div>
									<div class="row top100">
										<span class="left">0</span> <span class="right">7</span>
									</div>
								</div>
								<div class="col-xs-2">
									<button class="btn btn-xs btn-white">默认值</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3" style="padding-right: 0;">最大未完成预约数</div>
								<div class="col-xs-7 expand-col">
									<div class="slider-minmax6"></div>
									<div class="row top100">
										<span class="left">0</span> <span class="right">10</span>
									</div>
								</div>
								<div class="col-xs-2">
									<button class="btn btn-xs btn-white">默认值</button>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-xs btn-white"
									data-dismiss="modal">取 消</button>
								<button type="button" class="btn btn-xs btn-green">保 存</button>
							</div>
						</div>
					</div>
				</div>
				<!--时间段管理模块-->
				<div role="tabpanel" class="tab-pane" id="time">
					<div class="check-div form-inline">
						<span href="#sitt" aria-controls="sitt" role="tab"
							data-toggle="tab" style="cursor: pointer;"><span
							class="glyphicon glyphicon glyphicon-chevron-left"></span>&nbsp;&nbsp;返回上一页</span>

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-yellow btn-xs " data-toggle="modal"
							data-target="#addTime">添加时间段</button>

					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-3 ">编码</div>
							<div class="col-xs-3">开始</div>
							<div class="col-xs-3">结束</div>

							<div class="col-xs-3">操作</div>
						</div>
						<div class="tablebody">

							<div class="row">
								<div class="col-xs-3 ">6426398978</div>
								<div class="col-xs-3">10:10</div>
								<div class="col-xs-3">19:30</div>
								<div class="col-xs-3">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#changeTime">修改</button>
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteTime">删除</button>
								</div>
							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
					</footer>

					<!--弹出增加时间段窗口-->
					<div class="modal fade" id="addTime" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">时间段设置</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">开始时间：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">结束时间：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm"
														id="sName" placeholder="">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--修改增加时间段窗口-->
					<div class="modal fade" id="changeTime" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改时间段</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">开始时间：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">结束时间：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-green btn-xs">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					<!--弹出删除时间段警告窗口-->
					<div class="modal fade" id="deleteTime" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该时间段？</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-danger btn-xs">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
				<!--座位管理模块-->
				<div role="tabpanel" class="tab-pane" id="sitt">

					<div class="check-div form-inline" style="">
						<div class="col-lg-4 col-xs-7 col-md-6">
							<button class="btn btn-yellow btn-xs" data-toggle="modal"
								data-target="#addBuilding">添加楼宇</button>
							<label for="paixu">楼宇:&nbsp;</label> <select
								class=" form-control">
								<option>第一教学楼</option>
								<option>逸夫楼</option>
								<option>综合楼</option>
								<option>图书馆</option>
							</select>
							<button class="btn btn-white btn-xs ">修 改</button>
						</div>
						<div class="col-lg-4 col-lg-offset-4 col-xs-4 col-md-5 "
							style="padding-right: 40px;text-align: right;">
							<input type="text" class=" form-control input-sm "
								placeholder="输入文字搜索">
							<button class="btn btn-white btn-xs ">查 询</button>
						</div>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 " style="padding-left: 20px;">楼层</div>
							<div class="col-xs-3" style="padding-left: 20px;">区域</div>
							<div class="col-xs-2" style="padding-left: 2px;">座位数</div>
							<div class="col-xs-2">空余座位</div>
							<div class="col-xs-3">操作</div>
						</div>
						<div class="tablebody">

							<div class="sitTable">
								<table class="table  table-responsive">
									<tr>
										<td valign="middle" class="col-xs-2" rowspan="3">图书馆第一层</td>
										<td class="col-xs-3">第一自习室</td>
										<td class="col-xs-2">2</td>
										<td class="col-xs-2" style="padding-left: 40px!important;">3</td>
										<td class="col-xs-3" style="padding-left: 50px!important;">
											<a class="linkCcc" href="#sitDetail" aria-controls="char"
											role="tab" data-toggle="tab">座位信息</a> <a class="linkCcc"
											href="#time" aria-controls="char" role="tab"
											data-toggle="tab">时间段设置</a>
										</td>
									</tr>
									<tr>
										<td class="col-xs-3">第一自习室</td>
										<td class="col-xs-2">2</td>
										<td class="col-xs-2" style="padding-left: 40px!important;">3</td>
										<td class="col-xs-3" style="padding-left: 50px!important;">
											<a class="linkCcc" href="#sitDetail" aria-controls="char"
											role="tab" data-toggle="tab">座位信息</a> <a class="linkCcc"
											href="#time" aria-controls="char" role="tab"
											data-toggle="tab">时间段设置</a>
										</td>
									</tr>
									<tr>
										<td class="col-xs-3">第一自习室</td>
										<td class="col-xs-2">2</td>
										<td class="col-xs-2" style="padding-left: 40px!important;">3</td>
										<td class="col-xs-3" style="padding-left: 50px!important;">
											<a class="linkCcc" href="#sitDetail" aria-controls="char"
											role="tab" data-toggle="tab">座位信息</a> <a class="linkCcc"
											href="#time" aria-controls="char" role="tab"
											data-toggle="tab">时间段设置</a>
										</td>
									</tr>
								</table>
							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
					</footer>

					<!--弹出添加楼宇窗口-->
					<div class="modal fade" id="addBuilding" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">添加楼宇</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">楼层：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm duiqi"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">区域：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm duiqi"
														id="sLink" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">座位数：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm duiqi"
														id="sOrd" placeholder="">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出修改用户窗口-->
					<div class="modal fade" id="reviseUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">用户名：</label>
												<div class="col-xs-8 ">
													<input type="email" class="form-control input-sm"
														id="sName" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
												<div class="col-xs-8 ">
													<input type="" class="form-control input-sm" id="sLink"
														placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm" id="sOrd"
														placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">电话：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm" id="sKnot"
														placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">地区：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm" id="sKnot"
														placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">权限：</label>
												<div class="col-xs-8">
													<input type="" class="form-control input-sm" id="sKnot"
														placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="situation" class="col-xs-3 control-label">状态：</label>
												<div class="col-xs-8">
													<label class="control-label" for="anniu"> <input
														type="radio" name="situation" id="normal">正常</label>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
														class="control-label" for="meun"> <input
														type="radio" name="situation" id="forbid"> 禁用</label>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-green">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出删除用户警告窗口-->
					<div class="modal fade" id="deleteUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该用户？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-green btn-xs">保 存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>
				<!--座位详情模块-->
				<div role="tabpanel" class="tab-pane" id="sitDetail">
					<div class="check-div form-inline">
						<span href="#sitt" aria-controls="sitt" role="tab"
							data-toggle="tab" style="cursor: pointer;"><span
							class="glyphicon glyphicon glyphicon-chevron-left"></span>&nbsp;&nbsp;返回上一页</span>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-6 ">座位编码</div>
							<div class="col-xs-6 ">座位名称</div>

						</div>
						<div class="tablebody">

							<div class="row">
								<div class="col-xs-6 ">sad2345fas345533</div>
								<div class="col-xs-6">王座</div>

							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
					</footer>

				</div>
				<!--人员管理模块-->
				<div role="tabpanel" class="tab-pane" id="stud">
					<div class="check-div form-inline">
						<div class="col-xs-5">
							<input type="text" class=" form-control input-sm"
								placeholder="输入文字搜索" style="	!height: 40px!important;">
							<button class="btn btn-white btn-xs ">查 询</button>
						</div>
						<div class="col-xs-4 col-lg-4  col-md-5"
							style="padding-right: 40px;text-align: right;float: right;">
							<label for="daoru">导入人员信息表:&nbsp;</label>
							<button class="btn btn-white btn-xs " id="daoru">选取文件</button>
							<button class="btn btn-white btn-xs ">导入</button>
						</div>

					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 ">学号</div>
							<div class="col-xs-1 ">姓名</div>
							<div class="col-xs-2">院系</div>
							<div class="col-xs-2">年年</div>
							<div class="col-xs-2 ">学习时长</div>
							<div class="col-xs-2">违约次数</div>
							<div class="col-xs-1">操作</div>
						</div>
						<div class="tablebody">

							<div class="row">
								<div class="col-xs-2 ">6426398978</div>
								<div class="col-xs-1">邓超</div>
								<div class="col-xs-2">计算机地区</div>
								<div class="col-xs-2">2013年</div>
								<div class="col-xs-2">15</div>
								<div class="col-xs-2">2</div>
								<div class="col-xs-1">
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteObey">清除违约</button>
								</div>
							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i>
						</li>
						<li><i class="glyphicon glyphicon-menu-right"> </i>
						</li>
					</ul>
					</footer>

					<!--弹出删除违约记录警告窗口-->

					<div class="modal fade" id="deleteObey" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该违约记录？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-danger">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
			</div>
		</div>
	</div>
	<!-- 滑块js -->
	<!--	<script type="text/javascript">
        scale = function(btn, bar, title, unit) {
                this.btn = document.getElementById(btn);
                this.bar = document.getElementById(bar);
                this.title = document.getElementById(title);
                this.step = this.bar.getElementsByTagName("div")[0];
                this.unit = unit;
                this.init();
        };
        scale.prototype = {
                init: function() {
                        var f = this,
                                g = document,
                                b = window,
                                m = Math;
                        f.btn.onmousedown = function(e) {
                                var x = (e || b.event).clientX;
                                var l = this.offsetLeft;
//						var max = f.bar.offsetWidth - this.offsetWidth;
                                var max = f.bar.offsetWidth-20 ;
                                g.onmousemove = function(e) {
                                        var thisX = (e || b.event).clientX;
                                        var to = m.min(max, m.max(-2, l + (thisX - x)));
                                        f.btn.style.left = to+ 'px';
                                        f.ondrag(m.round(m.max(0, to / max) * 100), to);
                                        b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
                                };
                                g.onmouseup = new Function('this.onmousemove=null');
                        };
                },
                ondrag: function(pos, x) {
                        this.step.style.width = Math.max(0, x) +2+ 'px';
                        this.title.innerHTML = pos / 10 + this.unit + "";
                }
        }
        new scale('btn0', 'bar0', 'title0', "分钟");
        new scale('btn1', 'bar1', 'title1', "分钟");
        new scale('btn2', 'bar2', 'title2', "天");
        new scale('btn3', 'bar3', 'title3', "次");
</script>
-->
	<script src="js/jquery.nouislider.js"></script>

	<!-- this page specific inline scripts -->
	<script>
		//min/max slider
		function huadong(my, unit, def, max) {
			$(my).noUiSlider(
					{
						range : [ 0, max ],
						start : [ def ],
						handles : 1,
						connect : 'upper',
						slide : function() {
							var val = Math.floor($(this).val());
							$(this).find(".noUi-handle").text(val + unit);
							console.log($(this).find(".noUi-handle").parent()
									.parent().html());
						},
						set : function() {
							var val = Math.floor($(this).val());
							$(this).find(".noUi-handle").text(val + unit);
						}
					});
			$(my).val(def, true);
		}
		huadong('.slider-minmax1', "分钟", "5", 30);
		huadong('.slider-minmax2', "分钟", "6", 15);
		huadong('.slider-minmax3', "分钟", "10", 60);
		huadong('.slider-minmax4', "次", "2", 10);
		huadong('.slider-minmax5', "天", "3", 7);
		huadong('.slider-minmax6', "天", "8", 10);
	</script>
</body>

</html>
