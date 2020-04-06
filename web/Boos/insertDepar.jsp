<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@page import="java.text.SimpleDateFormat"%>
 <%@page import="conn.Department.Depar"%>
<%@page import="conn.Department.DepartmentInfo"%><%@ page import="conn.Journal.*,conn.Post.*" %>
 <% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("boosid");
Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);
	DepartmentInfo dei=new DepartmentInfo();
	Depar dep=new Depar();
	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
	PostInfo poin=new PostInfo();
	Post po=new Post();
	if("insert".equals(request.getParameter("action")))
	{
	dei.setDE_expenditure(request.getParameter("expenditure"));
	dei.setDE_name(request.getParameter("name"));
	dei.setDE_income(request.getParameter("income"));
	dei.setDE_remark(request.getParameter("remark"));
	dep.inseert(dei);
	session.setAttribute("deparname", request.getParameter("name"));
	poin.setPO_department(request.getParameter("name"));poin.setPO_name("部长");poin.setPO_wages("0");poin.setPO_remark(" ");
	po.insert(poin);
	joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("添加部门信息");joi.setJO_remark("无");
 jo.insert(joi);
 out.print("<script>alert('部门添加成功,点击确定进行添加部门默认主管信息'); window.location='./insertDeno1.jsp' </script>");
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
    
    <title>My JSP 'insertDepar.jsp' starting page</title>
    
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
  添加部门时同样需要给部门添加一个默认主管，并采集其面部信息！！！<div class="inuser">
    <form id="form1" name="form1" method="post" action="./Boos/insertDepar.jsp?action=insert">
    <table>
    <tr>
    <td>部门名称：</td>
    <td><input type="text" id="name" name="name" required="required" />*不能为空</td>
    </tr>
    <tr>
    <td>部门收入：</td>
    <td><input type="number" id="income" name="income" required="required" "/>*不能为空</td>
    </tr>
    <tr>
    <td>部门支出：</td>
    <td><input type="number" id="expenditure" name="expenditure" required="required" />*不能为空</td>
    </tr>
    <tr>
    <td>备注：</td>
    <td><input type="text" id="remark" name="remark"  /></td>
    </tr>
    <tr>
    <td colspan="2"><input type="submit" name="button" id="button" value="提交" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
</td>
    </tr>    
    </table></form></div>
  </body>
</html>
