<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Journal.*" %>
<%
	Jour jo =new Jour();
	int result =0; result = jo.delete(request.getParameter("id"));
	 if(result==1){
	 out.print("<script>alert('打卡考勤日志删除成功'); window.location='./upJournal.jsp' </script>");}
     else{
     out.print("<script>alert('打卡考勤日志删除失败'); window.location='./upJournal.jsp' </script>");}
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
    <base href="<%=basePath%>">

    <title>My JSP 'DeJour.jsp' starting page</title>

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
