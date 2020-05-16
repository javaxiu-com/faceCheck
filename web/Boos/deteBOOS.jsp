<%@page import="javax.sound.midi.MidiDevice.Info"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Boos.*,conn.Journal.*" %>
<% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("boosid"); %>
<%
    String serverName = request.getServerName();
    String path = request.getContextPath();
    String basePath = "";
    if (serverName.equals("localhost")) {
        /*本地测试时*/
        basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    } else {
        /*线上运行时*/
        basePath = request.getScheme()+"s://"+request.getServerName()+path+"/";
    }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <base href="<%=basePath%>">
    <title>My JSP 'showBoos.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body class="usin">
  删除BOOS用户：
  <table align="center">
  <tr><th class="tb-th">BOOSID</th><th class="tb-th">BOOS名字</th><th class="tb-th">操作</th></tr>
  <%
  boosLogin bsl=new boosLogin();
  List<BoosInfo> list = bsl.degetList(boosid);
  for(BoosInfo bsi:list) {
   %>
   <tr class="tb-tr" align="center">
   <td><%out.print(bsi.getBOOS_id()); %></td>   <td><%out.print(bsi.getBOOS_name()); %></td>
  <td> <a href="./Boos/de.jsp?id=<%=bsi.getBOOS_id() %>" class="tb-url">删除</a></td>
   </tr><% } %>
  </table>
  </body>
</html>
