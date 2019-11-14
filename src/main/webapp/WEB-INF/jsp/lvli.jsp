<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>申请职位</title>
    <script type="text/javascript" src="/statics/js/sweetalert.min.js"></script>
    <script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".ban1").hide();
            $(".ban").click(function () {
                $(this).siblings(".ban1").slideToggle();
                $(this).parent("li").siblings("li").children(".ban1").slideUp();
            });
            $("#myform2").submit(function () {
                var name = $("input[name='name']").val();
                var time = $("input[name='time']").val();
                var ming = $("input[name='ming']").val();
                var xue = $("input[name='xue']").val();
                var workname = $("#workname option:checked").text();
                if (name == "") {
                    swal("学校名称不能为空", "error");
                    return false;
                } else if (time == "") {
                    swal("时间不能为空", "error");
                    return false;
                } else if (ming == "") {
                    swal("专业名称为空", "error");
                    return false;
                } else if (xue == "") {
                    swal("学历不能为空", "error");
                    return false;
                } else if (workname == "请选择") {
                    swal("学位不能为空", "error");
                    return false;
                }
                return true;
            });
            //非空验证
            $("#Myform").submit(function () {
                var danwei = $("input[name='danwei']").val();
                var zhiwei = $("input[name='zhiwei']").val();
                var time = $("input[name='timeq']").val();
                var zhize = $("textarea[name='zhize']").val();
                if (danwei == "") {
                    swal("请输入单位名称", "error");
                    return false;
                } else if (zhiwei == "") {
                    swal("请输入职位名称！", "error");
                    return false;
                } else if (time == "") {
                    swal("请输入工作时间！", "error");
                    return false;
                } else if (zhize == "") {
                    swal("请输入工作职责！", "error");
                    return false;
                }else if(addlvli()==false){
                    swal("保存错误!请稍后重试","error");
                    return false;
                }
                location.href="/apply/tijiao.html";
                return true;
            });
        });

        function addlvli() {
            $(".baocun").click(function () {
                var danwei = $("input[name='danwei']").val();
                var zhiwei = $("input[name='zhiwei']").val();
                var time = $("input[name='timeq']").val();
                var zhize = $("textarea[name='zhize']").val();
                $.post("/apply/addlvli", {
                    "danwei": danwei,
                    "zhiwei": zhiwei,
                    "time": time,
                    "zhize": zhize
                }, function (data) {
                    if (data == true) {
                        return true;
                    } else {
                        return false;
                    }
                }, "json");
            });
        }

    </script>
    <link rel="stylesheet" href="/statics/css/lvLi.css" type="text/css"></link>
</head>
<body>
<div class="geren">
    <div class="geren1">
        <div class="tup2">
            <img src="/statics/img/tuptb.png"/>
        </div>
        <div class="geren2">
            <div class="geren3">
                <span class="userName">${user.name}</span> <span class="il8n">,欢迎您!</span>
                <span class="pad3"> <a href=" " class="il8n">招聘首页</a> </span> <em
                    class="gg1">|</em> <span class="pad3"> <a href="ApplysServlet" class="il8n">个人中心</a> </span> <em
                    class="gg1">|</em> <span class="pad3"></span>
                <a href="UserServlet?opr=tui" class="il8n" style="text-decoration: none;">退出</a>
            </div>
        </div>
    </div>
    <div class="geren4">
        <h3 class="zit2">
            <span class="il8n" style="font-weight: bold;">申请职位：</span> <span
                class="zit3" style="font-weight: bold;"> <strong
                style="font-weight: bold;"> ${pos.postname}</strong> </span>
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
                                <img src="/statics/img/dl_profile-grey.gif" style="margi-top:-120px;"/>
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
            <form action="EducationalServlet?opr=addEducational" method="post" id="myform2">
                <div class="zhou">
                    <ul>
                        <li class="diyi1"><span class="ban">*教育背景</span>
                            <hr/>
                            <div class="ban1">
                                <ul>
                                    <li><label class="yiq">*学校名称：</label>
                                        <input type="text" class="xue" name="name"/>
                                        <span class="zi1">请从大学以来的教育经历开始填写</span>
                                    </li>

                                    <li><label class="yiq">*时间:</label>
                                        <input type="date" class="shij" onclick="WdatePicker()" name="time"/>
                                    </li>

                                    <li><label class="yiq">*专业名称：</label>
                                        <input type="text" class="chuang" name="ming"/>
                                    </li>

                                    <li><label class="yiq">*学历:</label>
                                        <input type="text" class="li1" name="xue"/>
                                    </li>

                                    <li><label class="yiq">*学位：</label>
                                        <select class="wei3" name="workname">
                                            <option value="请选择">请选择</option>
                                            <option value="无">无</option>
                                            <option value="学士">学士</option>
                                            <option value="双学士">双学士</option>
                                            <option value="硕士">硕士</option>
                                            <option value="MBA">MBA</option>
                                            <option value="博士">博士</option>
                                        </select>
                                    </li>

                                    <li><input type="button" class="baocun" value="保存"/>
                                        <input type="reset" class="quxiao" value="取消"/>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </form>


            <br/> <br/>
            <div class="ban2"></div>
        </div>

        </li>

        <li class="diyi2"><span class="ban">*工作经验</span>
            <hr/>

            <div class="ban1">
                <form action="AddlvliServlet?opr=add" method="post" id="Myform">
                    <ul>
                        <li><label class="yiq">*单位名称：</label> <input type="text"
                                                                     class="xue" name="danwei"/>
                        </li>


                        <li><label class="yiq">*职位名称：</label> <input type="text"
                                                                     class="chuang" name="zhiwei"/>
                        </li>

                        <li><label class="yiq">*工作时间：</label> <input type="date"
                                                                     class="shij" name="timeq" onclick="WdatePicker()">
                        </li>

                        <li><label class="yiq">*工作职责:</label> <textarea rows="8"
                                                                        class="duo" name="zhize">
				    							
				    						</textarea>
                        </li>

                        <li><input type="submit" class="baocun" value="保存"/> <input
                                type="reset" class="quxiao" value="取消"/>
                        </li>
                    </ul>
                    <br/> <br/>
                    <div class="ban2"></div>
                </form>
            </div>
        </li>


        </ul>

    </div>
    </from>
    <br/> <br/>
    <div class="ban2"></div>

    <div class="ban3">
        <a href="#" class="a1">上一步</a>
        <input type="button" class="a2" value="保存下一步"/>
    </div>
</div>


</div>

</div>
</body>
</html>
