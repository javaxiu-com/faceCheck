<%@page import="conn.Department.Depar"%>
<%@page import="conn.Department.DepartmentInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Journal.*" %>
 <%@page import="java.text.SimpleDateFormat"%>
 <% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("boosid");
Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);
	DepartmentInfo dei=new DepartmentInfo();
	Depar dep=new Depar();
	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
if("update".equals(request.getParameter("action")))
{
 dei.setDE_name(request.getParameter("name"));
dei.setDE_income(request.getParameter("income"));
dei.setDE_expenditure(request.getParameter("expenditure"));
dei.setDE_id(request.getParameter("deid"));
dei.setDE_remark(request.getParameter("remark"));
dep.updatede(dei);
 joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("修改部门信息");joi.setJO_remark("无");
 jo.insert(joi); 
 out.print("<script>alert('部门修改成功'); window.location='./updateDepar.jsp' </script>");
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
    <title>My JSP 'upDepar.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body class="usin"> 修改部门信息：<div class="inuser">
    <% DepartmentInfo dein=dep.getONEde(request.getParameter("id")); %>
    <div class=bg></div>
    <form id="form1" name="form1" method="post" action="./Boos/upDepar.jsp?action=update">
    <table>
    <tr>
    <td>部门名称：</td>
    <td><input type="text" id="name" name="name" required="required" value="<%=dein.getDE_name() %>"/>*不能为空</td>
    </tr>
    <tr>
    <td>部门收入：</td>
    <td><input type="number" id="income" name="income" required="required" value="<%=dein.getDE_income() %>"/>*不能为空</td>
    </tr>
    <tr>
    <td>部门支出：</td>
    <td><input type="number" id="expenditure" name="expenditure" required="required" value="<%=dein.getDE_expenditure() %>"/>*不能为空</td>
    </tr>
    <tr>
    <td>备注：</td>
    <td><input type="text" id="remark" name="remark"  value="<%=dein.getDE_remark() %>"/></td>
    </tr>
    <tr>
    <td colspan="2"><input type="submit" name="button" id="button" value="提交" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
<input type="hidden" name="deid" value="<%=dein.getDE_id() %>" /></td>
    </tr>    
    </table></form></div>
  </body>
</html>
