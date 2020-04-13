<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<%--本地测试时:--%>
<%--<%--%>
<%--String path = request.getContextPath();--%>
<%--String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>
<%--线上运行时:--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"s://"+request.getServerName()+path+"/";
%>

<table width="100%" border="0">
<tr><td colspan="4">人脸识别考勤系统</td></tr>
<tr><td class="menutd">员工个人信息</td></tr><!-- target是跳转添加的，必须不然会重新跳转到新的页面 -->
<tr><td class="menutd"><a href="user.jsp" target="setFrame" class="menuurl">查看个人主页</a></td></tr>
<tr><td class="menutd"><a href="../2/upmyuser.jsp" target="setFrame" class="menuurl">修改个人信息</a></td></tr>
<tr><td class="menutd">人脸考勤统计</td></tr>
<tr><td class="menutd"><a href="<%=basePath%>Boos/upJournal.jsp" target="setFrame" class="menuurl">考勤统计信息</a></td></tr>
<tr><td class="menutd">员工管理</td></tr>
<tr><td class="menutd"><a href="../2/updateUser.jsp" target="setFrame" class="menuurl">更新员工信息</a></td></tr>
<tr><td class="menutd"><a href="../2/insertUser.jsp" target="setFrame" class="menuurl">添加员工信息</a></td></tr>
<tr><td class="menutd">岗位管理</td></tr>
<tr><td class="menutd"><a href="../2/upfatePost.jsp" target="setFrame" class="menuurl">更新岗位信息</a></td></tr>
<tr><td class="menutd"><a href="../2/insertPost.jsp" target="setFrame" class="menuurl">添加岗位信息</a></td></tr>
<tr><td class="menutd">工资管理</td></tr>
<tr><td class="menutd"><a href="updateWage.jsp" target="setFrame" class="menuurl">更新工资信息</a></td></tr>
<tr><td colspan="4" class="menutd"><a id=exit href="../logout.jsp" target="_top" class="menuurl">登出系统</a></td></tr>
</table>
<script>
$("#exit").on("click",function(){  //将退出按钮的id设置为exit，然后将这个函数在公共文件里面即可
    sessionStorage.clear();   //清除所有session值
    window.location.reload();
    })
</script>
