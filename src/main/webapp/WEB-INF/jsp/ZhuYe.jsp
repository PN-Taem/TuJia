<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta charset="utf-8" />
		<title>了解我们</title>
		<script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
		<script src="js/ZhuYe.js" type="text/javascript" charset="utf-8"></script>
		<script>
			$(function(){
				
				$("#a1").css("background","url(img/pn-2.png)");
				$("#a2").css("background","url(img/pn-1.png)");
				$("#a3").css("background","url(img/pn-1.png)");
				$("#nei2").hide();
				$("#nei3").hide();
				
				$("#a1").mouseover(function(){
					$("#nei1").show();
					$("#nei2").hide();
					$("#nei3").hide();
					
					$("#a1").css("background","url(img/pn-2.png)");
					$("#a2").css("background","url(img/pn-1.png)");
					$("#a3").css("background","url(img/pn-1.png)");
				});
				$("#a2").mouseover(function(){
					$("#nei2").show();
					$("#nei1").hide();
					$("#nei3").hide();
					$("#a2").css("background","url(img/pn-2.png)");
					$("#a1").css("background","url(img/pn-1.png)");
					$("#a3").css("background","url(img/pn-1.png)");
				});  
				$("#a3").mouseover(function(){
					$("#nei3").show();
					$("#nei2").hide();
					$("#nei1").hide();
					$("#a3").css("background","url(img/pn-2.png)");
					$("#a1").css("background","url(img/pn-1.png)");
					$("#a2").css("background","url(img/pn-1.png)");
				});
			})
		</script>
		<link rel="stylesheet" type="text/css" href="css/ZhuYe.css"/>
		</head>
	<body>
	
		<div id="header01">
		<div style="background-color:411F0E;border:0px solid white;width:100px;height:40px; float: left;position: relative;left:189;top:15;">
	
	</div>	
				<img src="img/pn-31.png" width="130px" height="35px" class="herimg1" style="margin-left: 0px"/>
				<div class="heaimg">
					<a href="shouye.jsp"><img src="img/pn-282.png" class="herimg2"/>首页</a>
				    <a href="PostServlet"><img src="img/pn-272.png" class="herimg3"/>社会招聘</a>
				    <a href=""><img src="img/pn-252.png" class="herimg4"/>校园招聘</a>
				    <a ><img src="img/pn-292.png" class="herimg5"/>了解我们</a>
				</div>
			</div>
		<div id="Ye">
			<div id="lan">
				<a href="#nei" id="a1">tujia</a>
				<a href="#nei2" id="a2" >TU成长</a>
				<a href="#nei3" id="a3" >JIA文化</a>
			</div>
			<div id="nei1">
				<img src="img/pn-11.png" class="img1"/>		
				<img src="img/pn-13.png" class="img2"//>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途家，于2011年12月1日正式上线。作为全球民宿短租预订平台，致力为客户提供丰
				富、优质、更个性的出行住宿体验，同时也为房东提供高收益且有保障的闲置房屋分享平 台。<br/> 
　　                                        随着国内分享经济的逐步升温和途家预订业务的不断增长。2015年8月，途家网完成了
                D及D+轮融资，总估值超10亿美元，正式进入互联网行业的10亿美元“独角兽” 俱乐部。
                2016年6月，途家宣布战略并购蚂蚁短租，进一步强化了住宿分享市场的领导企业优势。
                2016年10月，途家宣布战略并购携程、去哪儿公寓民宿业务。2017年10月，途家网线上平
                                              台完成E轮融资，总估值超过15亿美金。2018年1月，大鱼自助游加入途家，正式形成“携程民宿、去哪儿民宿、途家、蚂蚁短租、大鱼自助游的民宿短租入口”五大平台的矩阵，形成新途家集团。<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途家现已覆盖国内345个目的地和海外1037个目的地，全球在线房源超过100万套，包含民宿、公寓、别墅等住宿产品及延展服务，可满足以“多人、多天、个性化、高覆盖”为特征的出行住宿需求。让出行更简单、更安心、更有趣。资源丰富的途家平台，让人们更好的享受分享的乐趣，体味旅行的意义。
　                                     　作为中国住宿分享的引领者，途家凭借创新的商业模式、强大的品牌优势和专业的运营能力，目前已与国内218个政府机构签约，并与TOP100的大部分房地产开发企业达成战略合作，签约管理资产超过1500亿人民币，签约储备房源超100万套。 
				</p>
				<!--<div id="text1">
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途家，于2011年12月1日正式上线。作为全球民宿短租预订平台，致力为客户提供丰
				富、优质、更个性的出行住宿体验，同时也为房东提供高收益且有保障的闲置房屋分享平 台。<br/> 
　　                                        随着国内分享经济的逐步升温和途家预订业务的不断增长。2015年8月，途家网完成了
                D及D+轮融资，总估值超10亿美元，正式进入互联网行业的10亿美元“独角兽” 俱乐部。
                2016年6月，途家宣布战略并购蚂蚁短租，进一步强化了住宿分享市场的领导企业优势。
                2016年10月，途家宣布战略并购携程、去哪儿公寓民宿业务。2017年10月，途家网线上平
                                              台完成E轮融资，总估值超过15亿美金。2018年1月，大鱼自助游加入途家，正式形成“携程民宿、去哪儿民宿、途家、蚂蚁短租、大鱼自助游的民宿短租入口”五大平台的矩阵，形成新途家集团。<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途家现已覆盖国内345个目的地和海外1037个目的地，全球在线房源超过100万套，包含民宿、公寓、别墅等住宿产品及延展服务，可满足以“多人、多天、个性化、高覆盖”为特征的出行住宿需求。让出行更简单、更安心、更有趣。资源丰富的途家平台，让人们更好的享受分享的乐趣，体味旅行的意义。
　                                     　作为中国住宿分享的引领者，途家凭借创新的商业模式、强大的品牌优势和专业的运营能力，目前已与国内218个政府机构签约，并与TOP100的大部分房地产开发企业达成战略合作，签约管理资产超过1500亿人民币，签约储备房源超100万套。 
					
				</div>-->
				<img src="img/pn-12.png" class="img3"/>
				<img src="img/pn-14.png" class="img4" width="100%" height="537"/>
			</div>	
			<div id="nei2">
				<img src="img/pn-15.png" width="700px" height="500px" class="img5"/>
				<div id="img24">
					<img src="img/pn-16.jpeg" width="350px" height="250px" />
				    <img src="img/pn-19.jpeg" width="350px" height="250px" />
				</div>
				<div id="img25">
					<img src="img/pn-18.jpeg" width="350px" height="250px" />
				    <img src="img/pn-17.jpeg" width="350px" height="250px" />
				</div>
			</div>
			<div id="nei3">
				<div id="img26" style="position: relative;">
					<img src="img/pn-3.png"width="550"style="position: absolute;top: 0px;left: -5px;" id="img1"/>
					<img src="img/pn-21.png"width="500" style="position: absolute;top: 10px;left: 20px;"/>
					<img src="img/pn-22.png"width="500"style="position: absolute;top: 10px;left: 20px;"/>
					<img src="img/pn-24.png"width="500"style="position: absolute;top: 10px;left: 20px;"/>
					<img src="img/pn-23.png"width="500"style="position: absolute;top: 10px;left: 20px;"/>
				</div>
				<div id="img27">
					<img src="img/pn-4.png" />
				</div>
			</div>
		</div>
	</body>
</html>
