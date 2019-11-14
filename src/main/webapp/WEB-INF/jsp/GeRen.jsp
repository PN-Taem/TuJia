<%@page import="entity.Post" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>申请职位</title>
    <script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" type="text/css" href="/statics/css/GeRen.css"/>

    <script type="text/javascript" src="/statics/js/sweetalert.min.js"></script>
    <script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(function () {
            var filePath = "";
            $("#url").change(function () {
                $("#imgs").attr({
                    "src": URL.createObjectURL($(this)[0].files[0])
                });
            });
            $("#addbao").click(function () {
                var TEL_phone = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
                var TEL_email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
                var name = $("input[name='name']").val();
                var datetime = $("input[name='datetime']").val();
                var email = $("input[name='email']").val();
                var phone = $("input[name='phone']").val();
                var hang = $("input[name='hang']").val();
                var zhi = $("input[name='zhi']").val();
                var city = $("input[name='city']").val();
                if (name == "") {
                    swal("姓名不允许为空！", " ");
                    return false;
                } else if (datetime == "") {
                    swal("请输入日期！", " ");
                    return false;
                } else if (!TEL_email.test(email)) {
                    swal("邮箱格式不正确！", " ");

                    return false;
                } else if (!TEL_phone.test(phone)) {
                    swal("电话号码格式不正确！", " ");

                    return false;
                } else if (hang == "") {
                    swal("请输入期望工作行业！", " ");

                    return false;
                } else if (zhi == "") {
                    swal("请输入期望工作职业！", " ");

                    return false;
                } else if (city == "") {
                    swal("请输入期望工作城市！", " ");
                    return false;
                }else if(add()!=true){
                    swal("保存失败！", " ");
                    return false;
                }


            });
        });
        function add() {
            var name = $("input[name='name']").val();
            var datetime = $("input[name='datetime']").val();
            var email = $("input[name='email']").val();
            var phone = $("input[name='phone']").val();
            var hang = $("input[name='hang']").val();
            var zhi = $("input[name='zhi']").val();
            var city = $("input[name='city']").val();
            var nan = $("input[name='nan']").val();
            var userName = $("input[name='userName']").val();
            var workday = $("select[name='workday']").val();
            var postAddress = $("input[name='postAddress']").val();
            var postName = $("input[name='postName']").val();
                $.post("/apply/addApply", {
                    "name": name,
                    "datetime": datetime,
                    "email": email,
                    "phone": phone,
                    "hang": hang,
                    "zhi": zhi,
                    "city": city,
                    "nan":nan,
                    "userName":userName,
                    "workday":workday,
                    "postAddress":postAddress,
                    "postName":postName
                }, function (data) {
                    if (data == true) {
                        swal("保存成功","");
                        location.href="/apply/lvli.html";
                    } else {
                        return false;
                    }
                }, "json")
        }
    </script>

</head>
<body>
<input type="hidden" value="${user.phone}" name="uuuserid">
<div class="geren">
    <div class="geren1">
        <div class="tup2">
            <img src="/statics/img/tuptb.png"/>
        </div>
        <div class="geren2">
            <div class="geren3">
                <span class="userName">${user.name}</span>
                <span class="il8n">,欢迎您!</span>
                <span class="pad3">
						 	<a href="/user/index.html" class="il8n">招聘首页</a>
						 </span>
                <em class="gg1">|</em>

                <span class="pad3">
						 	<a href="ApplysServlet" class="il8n">个人中心</a>
						 </span>
                <em class="gg1">|</em>

                <span class="pad3">
						 <a href="UserServlet?opr=tui" class="il8n" style="text-decoration: none;">退出</a>
						 </span>
            </div>
        </div>
    </div>
    <div class="geren4">
        <h3 class="zit2">
            <span class="il8n" style="font-weight: bold;">申请职位：</span>
            <span class="zit3" style="font-weight: bold;">
						<strong style="font-weight: bold;">
                            ${pos.postname}
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
                                <img src="/statics/img/dl_basic.gif" style="margin-top:-120px;"/>
                                <a href="#">
                                    <span class="zit4">1基本信息</span>
                                </a>
                            </li>

                            <li class="dili2">
                                <img src="/statics/img/dl_greyarrow.gif" style="margin-top:-120px;"/>
                            </li>
                            <li class=" dili3">
                                <img src="/statics/img/dl_profile-grey.gif" style="margin-top:-120px;"/>
                                <a href="#">
                                    <span class="zit5">2个人履历</span>
                                </a>
                            </li>
                            <li class="dili2">
                                <img src="/statics/img/dl_greyarrow.gif" style="margin-top:-120px;"/></li>
                            <li class="dili4">
                                <img src="/statics/img/dl_submit-grey.gif" style="margin-top:-120px;"/>
                                <a href="#">
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
                <span class="zit7">基&nbsp;本&nbsp;信&nbsp;息</span>
            </h3>
            <br/>
            <div class="geren9">
                <span class="xi" style="color: red;">个人信息</span>
                <hr/>
            </div>
            <c:choose>

                <c:when test="${caozuo==bao}">

                    <form action="/apply/addApply" method="post" id="myform">
                        <div class="geren10">
                            <ul>
                                <li>
                                    <label class="gongg">*姓名：</label>
                                    <input type="text" class="xingm1" name="name" value="${user.name }"/>
                                </li>

                                <li>
                                    <label class="gongg">*性别:</label>
                                    <input type="radio" class="nan1" name="nan" value="男" checked="checked"/>&nbsp;&nbsp;&nbsp;&nbsp;男
                                    <input type="radio" class="nan2" name="nan" value="女"/>&nbsp;&nbsp;&nbsp;&nbsp;女

                                </li>

                                <li>
                                    <label class="gongg">*出生日期:</label>
                                    <input type="date" class="rqi" onclick="WdatePicker()" name="datetime">
                                </li>

                                <li>
                                    <label class="gongg">*邮箱:</label>
                                    <input type="text" class="xingm2" name="email" value="${user.email }"/>
                                </li>

                                <li>
                                    <label class="gongg">*手机号码:</label>
                                    <select class="xiao">
                                        <option>大陆手机号</option>
                                        <option>非大陆手机号</option>
                                    </select>
                                    <input type="text" class="xingm3" name="phone" value="${user.phone }"/>
                                </li>

                                <li>
                                    <label class="gongg">*工作年限:</label>
                                    <select class="xiao1" name="workday">
                                        <option>请选择</option>
                                        <option value="在读学生">在读学生</option>
                                        <option value="应届学生">应届学生</option>
                                        <option value="一年">一年</option>
                                        <option value="五年">五年</option>
                                        <option value="十年">十年</option>
                                        <option value="十年以上">十年以上</option>
                                    </select>
                                </li>


                            </ul>


                            <div class="tup3">
                                <img src="/statics/img/shang.png" id="tupian"
                                     style="display: block;width: 150px;height: 170px;"/>
                                <br/>

                                <input type="file" id="lujin" style="width: 70px;" value="上传图片"/>
                                <br/>
                                <br/>
                                <span class="zhaopzi">推荐1寸照片尺寸，70x100象素。支持jpg，jpeg, gif，bmp或png格式，大小不超过512k</span>
                            </div>

                        </div>

                        <div class="geren11">
                            <span class="xi1" style="color: red;">求职意向</span>
                            <hr/>
                            <div class="geren12">
                                <ul>
                                    <li>
                                        <label class="gong2">现从事行业：</label>
                                        <input type="text" class="wenben"/>
                                    </li>
                                    <li>
                                        <label class="gong2">现从事职业：</label>
                                        <input type="text" class="wenben"/>
                                    </li>
                                    <li>
                                        <label class="gong2">现工作城市：</label>
                                        <input type="text" class="wenben"/>
                                    </li>

                                    <li>
                                        <label class="gong2">现月薪(税前)：</label>
                                        <select class="xiao2">
                                            <option>请选择</option>
                                            <option>1000</option>
                                            <option>1000以下</option>
                                        </select>

                                    </li>


                                    <li>
                                        <label class="gong2">*期望从事行业：</label>
                                        <input type="text" class="wenben" name="hang"/>
                                    </li>
                                    <li>
                                        <label class="gong2">*期望从事职业：</label>
                                        <input type="text" class="wenben" name="zhi"/>
                                    </li>
                                    <li>
                                        <label class="gong2">*期望工作城市：</label>
                                        <input type="text" class="wenben" name="city"/>
                                    </li>
                                    <li>
                                        <label class="gong2">期望月薪(税前)：</label>
                                        <select class="xiao3">
                                            <option>请选择</option>
                                            <option>1000</option>
                                            <option>1000以下</option>
                                            <option>2000</option>
                                        </select>
                                    </li>

                                    <li>
                                        <label class="gong2">到岗时间：</label>
                                        <select class="xiao4">
                                            <option>请选择</option>
                                            <option>一周以内</option>
                                            <option>一个月以内</option>
                                            <option>一年以内/
                                            <option>
                                        </select>
                                    </li>
                                </ul>

                                <div class="geren13">

                                </div>
                                <div class="geren14">
                                    <input type="hidden" name="postName" value="${pos.postname}"/>
                                    <input type="hidden" name="postAddress" value="${pos.address}"/>
                                    <input type="hidden" name="userName" value="${user.phone}"/>
                                    <input type="reset" value="取消">
                                    <input type="button" value="保存" id="addbao">
                                </div>
                            </div>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="ApplysServlet?opr=xiuuser" method="post" id="myform">
                        <div class="geren10">
                            <ul>
                                <li>
                                    <label class="gongg">*姓名:</label>
                                    <input type="text" class="xingm1" name="name" value="${applyu.name}"/>
                                </li>

                                <li>
                                    <label class="gongg">*性别:</label>
                                    <input type="radio" class="nan1" name="nan" value="男" checked="checked"/>&nbsp;&nbsp;&nbsp;&nbsp;男
                                    <input type="radio" class="nan2" name="nan" value="女"/>&nbsp;&nbsp;&nbsp;&nbsp;女

                                </li>

                                <li>
                                    <label class="gongg">*出生日期:</label>
                                    <input type="date" class="rqi" onclick="WdatePicker()" name="datetime">
                                </li>

                                <li>
                                    <label class="gongg">*邮箱:</label>
                                    <input type="text" class="xingm2" name="email" value="${applyu.email}"/>
                                </li>

                                <li>
                                    <label class="gongg">*手机号码:</label>
                                    <select class="xiao">
                                        <option>大陆手机号</option>
                                        <option>非大陆手机号</option>
                                    </select>
                                    <input type="text" class="xingm3" name="phone" value="${applyu.phone}"/>
                                </li>

                                <li>
                                    <label class="gongg">*工作年限:</label>
                                    <select class="xiao1" name="workday">
                                        <option>请选择</option>
                                        <option value="在读学生">在读学生</option>
                                        <option value="应届学生">应届学生</option>
                                        <option value="一年">一年</option>
                                        <option value="五年">五年</option>
                                        <option value="十年">十年</option>
                                        <option value="十年以上">十年以上</option>
                                    </select>
                                </li>


                            </ul>


                            <div class="tup3">
                                <img src="img/shang.png" id="imgs" style="display: block;width: 150px;height: 170px;"/>
                                <br/>

                                <input type="file" id="url" style="width: 70px;" value="上传图片"/>
                                <br/>
                                <br/>
                                <span class="zhaopzi">推荐1寸照片尺寸，70x100象素。支持jpg，jpeg, gif，bmp或png格式，大小不超过512k</span>
                            </div>

                        </div>

                        <div class="geren11">
                            <span class="xi1" style="color: red;">求职意向</span>
                            <hr/>
                            <div class="geren12">
                                <ul>
                                    <li>
                                        <label class="gong2">现从事行业：</label>
                                        <input type="text" class="wenben"/>
                                    </li>
                                    <li>
                                        <label class="gong2">现从事职业：</label>
                                        <input type="text" class="wenben"/>
                                    </li>
                                    <li>
                                        <label class="gong2">现工作城市：</label>
                                        <input type="text" class="wenben"/>
                                    </li>

                                    <li>
                                        <label class="gong2">现月薪(税前)：</label>
                                        <select class="xiao2">
                                            <option>请选择</option>
                                            <option>1000</option>
                                            <option>1000以下</option>
                                        </select>

                                    </li>


                                    <li>
                                        <label class="gong2">*期望从事行业：</label>
                                        <input type="text" class="wenben" name="hang" value="${applyu.post}"/>
                                    </li>
                                    <li>
                                        <label class="gong2">*期望从事职业：</label>
                                        <input type="text" class="wenben" name="zhi" value="${applyu.taty}"/>
                                    </li>
                                    <li>
                                        <label class="gong2">*期望工作城市：</label>
                                        <input type="text" class="wenben" name="city" value="${applyu.city}"/>
                                    </li>
                                    <li>
                                        <label class="gong2">期望月薪(税前)：</label>
                                        <select class="xiao3">
                                            <option>请选择</option>
                                            <option>1000</option>
                                            <option>1000以下</option>
                                            <option>2000</option>
                                        </select>
                                    </li>

                                    <li>
                                        <label class="gong2">到岗时间：</label>
                                        <select class="xiao4">
                                            <option>请选择</option>
                                            <option>一周以内</option>
                                            <option>一个月以内</option>
                                            <option>一年以内/
                                            <option>
                                        </select>
                                    </li>
                                </ul>

                                <div class="geren13">

                                </div>
                                <div class="geren14">
                                    <input type="hidden" name="postName" value="${pos.postname}"/>
                                    <input type="hidden" name="postAddress" value="${pos.address}"/>
                                    <input type="hidden" name="userName" value="${user.phone}"/>
                                    <input type="reset" value="取消">
                                    <input type="submit" value="修改">
                                </div>


                            </div>

                        </div>
                    </form>
                </c:otherwise>
            </c:choose>


        </div>


    </div>

</div>
</body>
</html>
