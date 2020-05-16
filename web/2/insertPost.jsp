<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@page import="java.text.SimpleDateFormat"%>
<%@ page import="conn.Journal.*,conn.Post.*,conn.User.*" %>
 <% request.setCharacterEncoding("UTF-8");
String boosid =(String)session.getAttribute("ST_num");
userLogin usl =new userLogin();
userInfo usin=usl.getUser(boosid);
String de=usin.getST_department(); //获取部门名称
Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);
JournalInfo joi= new JournalInfo();
Jour jo=new Jour();
PostInfo poin=new PostInfo();
Post po=new Post();
	if("insert".equals(request.getParameter("action")))
	{
	poin.setPO_wages(request.getParameter("expenditure"));
	poin.setPO_name(request.getParameter("name"));
	poin.setPO_department(request.getParameter("income"));
	poin.setPO_remark(request.getParameter("remark"));
	po.insert(poin);
	joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("添加岗位信息");joi.setJO_remark("无");
 jo.insert(joi);
 out.print("<script>alert('岗位添加成功'); window.location='./upfatePost.jsp' </script>");
	}
	%>
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
  添加岗位
<div class="inuser">
    <form id="form1" name="form1" method="post" action="./2/insertPost.jsp?action=insert">
    <table>
    <tr>
    <td>岗位名称：</td>
    <td><input type="text" id="name" name="name" required="required" />*不能为空</td>
    </tr>
    <tr>
    <td>岗位所属部门：</td>
    <td><input type="text" id="income" name="income" readonly="readonly" value="<%=de  %>"/>*不能为空</td>
    </tr>
    <tr>
    <td>岗位基本工资：</td>
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
