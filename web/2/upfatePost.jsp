<%@page import="mysql.Conn"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.mysql.*,java.sql.*,conn.User.*" %>
<%
String userid =(String)session.getAttribute("ST_num");
 userLogin usl =new userLogin();
userInfo usin=new userInfo();
usin=usl.getUser(userid);     //获取登录人的信息
String de=usin.getST_department();  //获取登录用户的部门
ResultSet rsu;
String sql;String strPage;
int intPageSize=10;
int intRowCount;
int intPageCount;
int intPage;
int i;
 Conn conn=new Conn();
 sql="select * from post where PO_department='"+de+"'";
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

    <title>My JSP 'upfatePost.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body class="usin" >对本部门岗位进行操作：
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
    <td><a href="./2/upPost.jsp?id=<%=rsu.getString(1) %>" class="tb-url">编辑</a>|<a href="./2/DePo.jsp?id=<%=rsu.getString(1) %>" class="tb-url">删除</a></td>
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
