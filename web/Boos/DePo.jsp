<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@page import="java.text.SimpleDateFormat"%><%@ page import="conn.Journal.*,conn.Post.*" %>
 <% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("boosid");
Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);
Post po=new Post();
JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
	int result =0; result = po.detele(request.getParameter("id"));
     if(result==1){joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("删除岗位，岗位id="+request.getParameter("id"));joi.setJO_remark("无");
 jo.insert(joi); 
     out.print("<script>alert('岗位删除成功'); window.location='./upfatePost.jsp' </script>");}
     else{
     out.print("<script>alert('岗位删除失败'); window.location='./upfatePost.jsp' </script>");}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DePo.jsp' starting page</title>
    
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
    This is my JSP page. <br>
  </body>
</html>
