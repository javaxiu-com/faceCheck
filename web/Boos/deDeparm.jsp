<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@page import="java.text.SimpleDateFormat"%>
 <%@page import="conn.Department.Depar"%>
<%@ page import="conn.Journal.*" %>
 <% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("boosid");
Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);
	Depar dep=new Depar();
	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
	int result =0; result = dep.deleate(request.getParameter("id"));
     if(result==1){joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("删除部门，部门id="+request.getParameter("id"));joi.setJO_remark("无");
 jo.insert(joi);
     out.print("<script>alert('部门删除成功'); window.location='./updateDepar.jsp' </script>");}
     else{
     out.print("<script>alert('部门删除失败'); window.location='./updateDepar.jsp' </script>");}
	%>
<%--本地测试时:--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--线上运行时:--%>
<%--<%--%>
<%--String path = request.getContextPath();--%>
<%--String basePath = request.getScheme()+"s://"+request.getServerName()+path+"/";--%>
<%--%>--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'deDeparm.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body>
  </body>
</html>
