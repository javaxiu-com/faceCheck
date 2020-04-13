<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Boos.*,conn.Journal.*" %>
 <%@page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("boosid");
 Date d = new Date();
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
	boosLogin bsl=new boosLogin();
	BoosInfo bsi=new BoosInfo();
	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
String name = bsl.getboosname(boosid).toString();
String pass = bsl.getboospass(boosid).toString();
if("update".equals(request.getParameter("action")))
{
bsi.setBOOS_id(boosid);
bsi.setBOOS_name(request.getParameter("Bname"));
bsi.setBOOS_password(request.getParameter("Bpass"));
bsl.update(bsi);
 joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("boos修改账户信息");joi.setJO_remark("无");
 jo.insert(joi);
 out.print("<script>alert('BOOS账户修改成功'); window.location='./updateBOOS.jsp' </script>");
}
 %>
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
  修改个人信息:
  <div class="usinn">
<form id="form1" name="form1" method="post" action="./Boos/updateBOOS.jsp?action=update">
<table>
<tr>
<td>BOOS名字</td><td><input type="text" name="Bname" id="Bname" value="<%=name %>"/></td>
</tr>
<tr><td></td></tr>  <tr><td></td></tr>
<tr>
<td>BOOS密码</td><td><input type="text" name="Bpass" id="Bpass" value="<%=pass %>"/></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="button" id="button" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
</td>
</tr>
</table>
</form></div>
  </body>
</html>
