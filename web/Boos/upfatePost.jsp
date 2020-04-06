<%@page import="mysql.Conn"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.mysql.*,java.sql.*" %>
<%
ResultSet rsu;
String sql;String strPage;
int intPageSize=10;
int intRowCount;
int intPageCount;
int intPage;
int i;
 Conn conn=new Conn();
 sql="select * from post";
 rsu=conn.executeQuery(sql);
 rsu.last();
 intRowCount=rsu.getRow();
 intPageCount=(intRowCount+intPageSize-1)/intPageSize;
strPage = request.getParameter("page");
if (strPage == null){intPage=1;}
else{ intPage=Integer.valueOf(strPage).intValue();
	 if(intPage<1){intPage=1;}
 	else if(intPage>intPageCount){intPage=intPageCount;}
 		else{intPage=intPage;}
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
    <title>My JSP 'upfatePost.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body class="usin" >对所有岗位进行操作：
   <table align="center">
   <tr><th class="po-th">岗位id</th> <th class="po-th">岗位名称</th>
   <th class="po-th">岗位所属部门</th><th class="po-th">岗位基本工资</th><th class="po-th">岗位备注</th>
   <th>操作</th></tr>
    <%
  if(intPageCount>0){
  rsu.absolute((intPage-1)*intPageSize+1);
  i=0;
  while(i<intPageSize &&!rsu.isAfterLast()){ 
  %>
   <tr class="usertb-tr" align="center"><td><%=rsu.getString(1) %></td><td><%=rsu.getString(2) %></td><td><%=rsu.getString(3) %></td>
   <td><%=rsu.getString(4) %></td><td><%=rsu.getString(5) %></td>
    <td><a href="./Boos/upPost.jsp?id=<%=rsu.getString(1) %>"  class="tb-url">编辑</a>|<a href="./Boos/DePo.jsp?id=<%=rsu.getString(1) %>"  class="tb-url">删除</a></td>
    </tr>
  <% 
   rsu.next();i++;}
   } %>
   </table>
   <center>
  第<%=intPage %>页  共<%=intPageCount %>页
  <% if(intPage>1&&intPage<intPageCount){ %> <a href="./Boos/upfatePost.jsp?page=<%=intPage-1 %>" class="tb-url">上一页</a>
  <a href="./Boos/upfatePost.jsp?page=<%=intPage+1 %>" class="tb-url">下一页</a>
  <% }else if(intPage<=1){ %>上一页  <a href="./Boos/upfatePost.jsp?page=<%=intPage+1 %>" class="tb-url">下一页</a>
  <% }else{ %><a href="./Boos/upfatePost.jsp?page=<%=intPage-1 %>" class="tb-url">上一页</a> 下一页<% } %>
  </center>
  </body>
</html>
<% conn.close(); %>
