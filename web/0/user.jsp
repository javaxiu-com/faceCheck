<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.User.*,conn.Wages.*" %>
<% String userid =(String)session.getAttribute("ST_num");
  userLogin usl =new userLogin();
  userInfo usin=new userInfo();
  wage wa=new wage();
  WagesInfo wain=new WagesInfo(); %>
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <base href="<%=basePath%>">
    <title>My JSP 'user.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body class="usin">
  <% usin=usl.getUser(userid); wain=wa.getoneWage(userid);%>
   欢迎登陆：<%=usin.getST_name()  %>
    <br/> <div class="user-left">您的基本信息如下：<br/>
    <div>您的工号：<%=userid %>  <br>密码：<%=usin.getST_password() %><br> 性别：<%=usin.getST_sex() %><br>
     年龄：<%=usin.getST_ago() %><br> 所在部门：<%=usin.getST_department() %><br/>
    所在岗位：<%=usin.getST_post() %><br> 入职时间： <%=usin.getST_entrytime() %><br>工龄：<%=usin.getST_worktime() %> <br>
    工作状态：<%=usin.getST_condition() %><br> 电话号码：<%=usin.getST_phone() %><br/>
     住址：<%=usin.getST_address() %><br>出生日期：<%=usin.getST_birthday() %> <br>本月工作时长： <%=usin.getST_workhours() %> <br>
     总工作时长：<%=usin.getST_aggworkhours() %>  <br/>
    </div>
    <div class="user-right">
    您的工资信息如下：<br/>
    基本工资：<%=wain.getWA_wages() %><br> 奖励金额：<%=wain.getWA_reward() %> <br>
    加班时长：<%=wain.getWA_overtime() %><br> 罚款金额：<%=wain.getWA_fine() %> <br>
    实际发放金额：<%=wain.getWA_actual() %><br/>
    备注：<%=wain.getWA_remark() %> <br/>
    </div>
  </body>
</html>
