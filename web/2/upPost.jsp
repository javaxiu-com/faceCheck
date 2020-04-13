<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Post.*" %>
<%@ page import="conn.Journal.*" %>
 <%@page import="java.text.SimpleDateFormat"%>
  <% request.setCharacterEncoding("UTF-8");
	String boosid =(String)session.getAttribute("ST_num");
	Date d = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = df.format(d);
	Post po =new Post();
	PostInfo poi=new PostInfo();
	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
	if("update".equals(request.getParameter("action"))){
	poi.setPO_id(request.getParameter("poid"));
	poi.setPO_name(request.getParameter("name"));
	poi.setPO_department(request.getParameter("po_de"));
	poi.setPO_wages(request.getParameter("po_wa"));
	poi.setPO_remark(request.getParameter("rema"));
	po.update(poi);
	 joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("修改岗位信息");joi.setJO_remark("无");
 jo.insert(joi);
 out.print("<script>alert('岗位修改成功'); window.location='./upfatePost.jsp' </script>");
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
    <title>My JSP 'upPost.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body class="usin">修改岗位信息：<div class="inuser">
<% PostInfo poino=po.getonePO(request.getParameter("id")); %>

    <form id="form1" name="form1" method="post" action="./2/upPost.jsp?action=update">
    <table>
    <tr><td>岗位名称：</td>
    <td><input type="text" id="name" name="name" required="required" value="<%=poino.getPO_name() %>"/>*不能为空</td></tr>
    <tr><td>岗位所属部门：</td>
    <td><input type="text" id="po_de" name="po_de" readonly="readonly" value="<%=poino.getPO_department() %>"/></td></tr>
    <tr><td>岗位基本工资：</td>
    <td><input type="number" id="po_wa" name="po_wa" required="required" value="<%=poino.getPO_wages() %>"/>*不能为空</td></tr>
    <tr><td>岗位备注：</td>
    <td><input type="text" id="rema" name="rema"  value="<%=poino.getPO_remark() %>"/></td></tr>
    <tr><td colspan="2"><input type="submit" name="button" id="button" value="提交" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
<input type="hidden" name="poid" value="<%=poino.getPO_id() %>" /> </td></tr>
    </table></form></div>
  </body>
</html>
