<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Department.*" %>
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
    <title>My JSP 'updateDepar.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body class="usin">
  对部门进行操作：
<table align="center">
  <tr><th class="dep-th">部门id</th><th class="dep-th">部门名称</th><th class="dep-th">部门营收</th>
  <th class="dep-th">部门支出</th><th class="dep-th">备注</th><th>操作</th></tr>
  <%
  Depar de=new Depar();
  List<DepartmentInfo> list = de.getList();
  for(DepartmentInfo dei:list) {
   %>
   <tr class="usertb-tr" align="center">
   <td><%out.print(dei.getDE_id()); %></td>   <td><%out.print(dei.getDE_name()); %></td>
   <td><%out.print(dei.getDE_income()); %></td>  <td><%out.print(dei.getDE_expenditure()); %></td>
   <td><%out.print(dei.getDE_remark()); %></td>
   <td><a href="./Boos/upDepar.jsp?id=<%=dei.getDE_id() %>" class="tb-url">编辑</a>|<a href="./Boos/deDeparm.jsp?id=<%=dei.getDE_id() %>" class="tb-url">删除</a></td>
   </tr><% } %>
  </table>
  </body>
</html>
