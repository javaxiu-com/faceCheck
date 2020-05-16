<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="conn.User.*"%>
 <% String userid =(String)session.getAttribute("ST_num");
   userLogin usl =new userLogin();
 if (userid == null||userid.length()==0)
 {
 out.print("<script>alert('请登陆！！！'); window.location='../login.jsp' </script>");
 }
 else {
 String pw= null;pw = usl.getPower(userid);
 switch(pw){
  case "0":
      out.print("<script>alert('您没有访问此页面的权限，点击确定返回！'); window.location='../0/userindex.jsp' </script>");
    break;
  case "1":
    break;
  case "2":
    out.print("<script>alert('您没有访问此页面的权限，点击确定返回！'); window.location='../2/2power.jsp' </script>");
    break;
  case "3":
      out.print("<script>alert('您没有访问此页面的权限，点击确定返回！'); window.location='../3/3power.jsp' </script>");
    break;
}}
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
     <title>员工个人主页</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <frameset  cols="13%,87%" framespacing="0" frameborder="no" border="0">
  <!-- 左半部默认命名为leftFrame -->
  <frame src="./1/Menu.jsp" name="leftFrame"  id="leftFrame" title="topFrame" />
  <frameset rows="13%,87%" framespacing="0" frameborder="no" border="0">
   <frame src="./1/top.jsp" name="topFrame"  id="topFrame" title="topFrame" scrolling="no" noresize="noresize" />
     <frame src="./1/user.jsp" name="setFrame"  id="setFrame" title="setFrame" />
  </frameset></frameset>
     <noframes><body>
  </body></noframes>
</html>


