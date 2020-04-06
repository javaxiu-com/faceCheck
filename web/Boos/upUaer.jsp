<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.User.*,conn.Journal.*" %>
 <%@page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("boosid");
Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);
	userInfo usi=new userInfo();
	userLogin usl=new userLogin();
	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
if("update".equals(request.getParameter("action")))
{
 usi.setST_address(request.getParameter("addr"));
usi.setST_name(request.getParameter("Uname"));
usi.setST_password(request.getParameter("upass"));
usi.setST_ago(request.getParameter("ago"));
usi.setST_reamrks(request.getParameter("ream"));
usi.setST_num(request.getParameter("Uid"));
usi.setST_entrytime(request.getParameter("entr"));
usi.setST_quittime(request.getParameter("quit"));
usi.setST_worktime(request.getParameter("work"));
usi.setST_condition(request.getParameter("condi"));
usi.setST_phone(request.getParameter("phon"));
usi.setST_sex(request.getParameter("sex"));
usi.setST_birthday(request.getParameter("birt"));
usi.setST_workhours(request.getParameter("workho"));
usi.setST_aggworkhours(request.getParameter("aggwo"));
usi.setST_power(request.getParameter("pow"));
usl.update(usi);
 joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("修改员工信息");joi.setJO_remark("无");
 jo.insert(joi);
 out.print("<script>alert('账户修改成功'); window.location='./updateUser.jsp' </script>");
}
 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <base href="<%=basePath%>">
    <title>My JSP 'updateBOOS.jsp' starting page</title>

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
    修改员工信息：<div class="inuser">

  <% userInfo usin=usl.getUser(request.getParameter("id")); %>

<form id="form1" name="form1" method="post" action="./Boos/upUaer.jsp?action=update">
<table>
<tr>
<td>用户名字</td><td><input type="text" name="Uname" id="Uname" required="required" value="<%=usin.getST_name() %>"/>*不能为空</td>
</tr>
<tr>
<td>密码</td><td><input type="text" name="upass" id="upass" required="required" value="<%=usin.getST_password() %>"/>*不能为空</td>
</tr>
<tr>
<td>性別</td><td><input type="radio" name="sex" id="usex" value="男" <% if("男".equals(usin.getST_sex())) out.print("checked"); %>/>男
<input type="radio" name="sex" id="sex" value="女" <% if("女".equals(usin.getST_sex())) out.print("checked"); %>/>女</td>
</tr>
<tr>
<td>年齡</td><td><input type="text" name="ago" id="ago" required="required" value="<%=usin.getST_ago() %>"/>*不能为空</td>
</tr>
<tr>
<td>所在部門</td><td><input type="text" name="depa" id="depa" readonly="readonly" value="<%=usin.getST_department()%>"/></td>
</tr>
<tr>
<td>所在崗位</td><td><input type="text" name="po" id="po" readonly="readonly" value="<%=usin.getST_post() %>"/></td>
</tr>
<tr>
<td>入職時間</td><td><input type="date" name="entr" id="entr" required="required" value="<%=usin.getST_entrytime() %>"/>*不能为空</td>
</tr>
<tr>
<td>離職時間</td><td><input type="date" name="quit" id="quit" required="required" value="<%=usin.getST_quittime() %>"/>*不能为空</td>
</tr>
<tr>
<td>工龄</td><td><input type="number" name="work" id="work" required="required" value="<%=usin.getST_worktime() %>"/>*不能为空</td>
</tr>
<tr>
<td>工作状态</td><td><input type="text" name="condi" id="condi" value="<%=usin.getST_condition() %>"/></td>
</tr>
<tr>
<td>电话号码</td><td><input type="number" name="phon" id="phon" required="required" value="<%=usin.getST_phone() %>"/>*不能为空</td>
</tr>
<tr>
<td>员工住址</td><td><input type="text" name="addr" id="addr" value="<%=usin.getST_address() %>"/></td>
</tr>
<tr>
<td>生日</td><td><input type="date" name="birt" id="birt" required="required" required="required" value="<%=usin.getST_birthday() %>"/>*不能为空</td>
</tr>
<tr>
<td>本月工作时长</td><td><input type="number" name="workho" id="workho" required="required" value="<%=usin.getST_workhours() %>"/>*不能为空</td>
</tr>
<tr>
<td>总工作时长</td><td><input type="number" name="aggwo" id="aggwo" required="required" value="<%=usin.getST_aggworkhours() %>"/>*不能为空</td>
</tr>
<tr>
<td>权限</td><td><input type="radio" name="pow" id="pow" value="0" <% if("0".equals(usin.getST_power())) out.print("checked"); %>/>0
<input type="radio" name="pow" id="pow" value="1" <% if("1".equals(usin.getST_power())) out.print("checked"); %>/>1
<input type="radio" name="pow" id="pow" value="2" <% if("2".equals(usin.getST_power())) out.print("checked"); %>/>2
<input type="radio" name="pow" id="pow" value="3" <% if("3".equals(usin.getST_power())) out.print("checked"); %>/>3</td>
</tr>
<tr>
<td>备注</td><td><input type="text" name="ream" id="ream" value="<%=usin.getST_reamrks() %>"/></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="button" id="button" value="提交" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
<input type="hidden" name="Uid" value="<%=usin.getST_num() %>" />
</td>
</tr>
</table>
</form></div>
  </body>
</html>

