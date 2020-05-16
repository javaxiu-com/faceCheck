<%@page import="javax.sound.midi.MidiDevice.Info"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Boos.*" %>
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
  查看BOOS用户：
  <table align="center">
  <tr><th class="tb-th">BOOSID</th><th class="tb-th">BOOS名字</th></tr>
  <%
  boosLogin bsl=new boosLogin();
  List<BoosInfo> list = bsl.getList();
  for(BoosInfo bsi:list) {
   %>
   <tr class="tb-tr" align="center">
   <td ><%out.print(bsi.getBOOS_id()); %></td>   <td ><%out.print(bsi.getBOOS_name()); %></td>
   </tr><% } %>
  </table>
  </body>
</html>
