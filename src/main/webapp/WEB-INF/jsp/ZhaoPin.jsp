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
<title>途家项目</title>
<script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>

<script type="text/javascript">
			$(function(){
				if (${user==null}) {
					$(".lijs").attr("action","index.jsp");
				} 
				if (${user!=null}) {
					$(".lijs").attr("action","PostServlet?caozuo=bao");
				}
				$(".limian").hide();
				$(".zuida7").click(function(){
					$(this).siblings(".limian").slideToggle();
					 $(this).parent("li").siblings("li").children(".limian").slideUp()
				});
				$("select[name='yourName']").change(function(){
				$("input[name='souName']").attr("value",$(this).find("option:selected").text());
				$("input[name='yourNameIndex']").val($(this).find("option:checked").index());
				});
				$("select[name='addressName']").change(function(){
				$("input[name='addressNameIndex']").val($(this).find("option:checked").index());
				});
				$("select[name='yourName'] option").eq(${typeIndex}).attr("selected","selected");
				$("select[name='addressName'] option").eq(${addressIndex}).attr("selected","selected");
				$("input[name='yourNameIndex']").val(${typeIndex});
				$("input[name='addressNameIndex']").val(${addressIndex});
			});
		</script>

<link rel="stylesheet" href="/statics/css/ZhaoPin.css" type="text/css"></link>
<script type="text/javascript" src="/statics/js/sweetalert.min.js"></script></head>
<body>
	

	<div id="toup">
	<div style="background-color:#411F0E;border:0px solid white;width:100px;height:40px; float: left;position: relative;left:189px;top:15px;">
	
	</div>	
	
	<div id="header01">
				<img src="/statics/img/pn-31.png" width="130px" height="35px" class="herimg1" style="margin-left: 0px"/>
				<div class="heaimg">
					<a href="/user/index.html"><img src="/statics/img/pn-282.png" class="herimg2"/>首页</a>
				    <a href="/post/selectAll.html"><img src="/statics/img/pn-272.png" class="herimg3"/>社会招聘</a>
				    <a href=""><img src="/statics/img/pn-252.png" class="herimg4"/>校园招聘</a>
				    <a href="ZhuYe.jsp"><img src="/statics/img/pn-292.png" class="herimg5"/>了解我们</a>
				</div>
			</div>
	
	</div>
	<div class="img2" >
		<img src="/statics/img/dierg.jpg" width="100%"></img>
	</div>
	<div class="zuida1" style="border:0px solid black;">
		<div class="zuida2">
			<div class="zuida3">
				<form action="/post/selectAll.html" method="post">
					<input type="hidden" name="opr" value="sou" /> <input
						type="hidden" name="souName" value="" /> <input type="hidden"
						name="yourNameIndex" value="0" /> <select name="yourName"
						id="yourId">
						<option value="-1">职业类型</option>
						<c:forEach items="${list }" var="li">

							<option value="${li.id }">${li.name }</option>

						</c:forEach>
					</select> <input type="hidden" name="addressNameIndex" value="0" /> <select
						name="addressName" id="yourId2">
						<option value="-1">请输入工作地点</option>
						<c:forEach items="${addressList}" var="address">
							<option value="${address.id}">${address.name}</option>
						</c:forEach>

					</select> <input value="搜索" type="submit" class="sousuo" />
				</form>
				<div class="zuida4"></div>
				<div class="zuida5">
					<h1 class="zuida6">
						<ol>
							<li>职业名称</li>
							<li>职业类型</li>
							<li>招聘人数</li>
							<li>工作地点</li>
							<li>公布时间</li>
						</ol>

					</h1>
					<c:forEach items="${posts.yings}" var="po">
						<ul>
							<li>
								<h1 class="zuida7">
									<ol>
										
										<li>${po.postname}</li>
										<li>${po.typeName}</li>
										<li>${po.postrecruit}</li>
										<li>${po.address}</li>
										<li>${po.posttime}</li>
									</ol>
								</h1>
								<div class="quanju"></div>

								<div class="limian" style="display: block;">
									<div class="limian1">
										<span class="di6">职位描述:</span>
										<div class="limian2">${po.describe}</div>
										<div class="limian1"
											style="border-top: 1px dashed #CECECE ;margin-top: 10px;padding-top: 30px;">
											<span class="di6">任职要求:</span>
											<div class="limian2">${po.request}</div>
										</div>

												<form action="/apply/tougao.html">
												<input type="hidden" name="posid" value="${po.postid}"/>
													<input type="submit" value="立即投稿" class="lij" id="tou" />
										</form>
										
									</div>
								</div></li>
						</ul>
					</c:forEach>
					
					<div style="margin-left: 840px">
						
						<c:if test="${posts.pageNo!=1}">
						<a
							href="/post/selectAll.html?pageNo=1&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}" style="border:0px solid black;text-decoration: none ; color:black; margin-left: 0px">首页</a>
    					    </c:if>
					<c:if test="${size!=0 }">
						<c:if test="${posts.pageNo!=1}">
							<a
								href="/post/selectAll.html?pageNo=${posts.pageNo-1}&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}"style="border:0px solid black;text-decoration: none ; color:black;margin-left: 30px;">上一页</a>
    					    </c:if>
						<c:if test="${posts.pageNo!=posts.totalPage}">
							<a
								href="/post/selectAll.html?pageNo=${posts.pageNo+1}&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}"style="border:0px solid black;text-decoration: none ; color:black;margin-left: 30px;">下一页</a>
	    	   				<a
								href="/post/selectAll.html?pageNo=${posts.totalPage}&yourName=${yourName }&addressName=${addressName }&souName=${souname }&addressNameIndex=${addressIndex}&yourNameIndex=${typeIndex}"style="border:0px solid black;text-decoration: none ; color:black;margin-left: 30px;">尾页</a>
	    	   				</c:if>
					</c:if>
					
					</div>
				</div>

			</div>


		</div>
	</div>

</body>
</html>
