<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Wages.*,conn.Journal.*" %>
<%@page import="java.text.SimpleDateFormat"%>
 <% 
  request.setCharacterEncoding("UTF-8");
  String boosid =(String)session.getAttribute("boosid");
  wage wa=new wage();
     int result =0; result = wa.delete(request.getParameter("id"));
     if(result==1){
     JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
   Date d = new Date();
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
   joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("删除工资信息"+request.getParameter("id"));joi.setJO_remark("无");
 jo.insert(joi); 
     out.print("<script>alert('删除成功'); window.location='./updateWage.jsp' </script>");}
     else{
     out.print("<script>alert('删除失败'); window.location='./updateWage.jsp' </script>");}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DeWage.jsp' starting page</title>
    
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
