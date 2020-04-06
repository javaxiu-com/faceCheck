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
 Conn conn=new Conn();sql="select * from staff";
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
    <title>My JSP 'showUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body class="usin" >
  对员工账户进行操作：
  <table  class="user-table">
  <tr><th class="usertb-th" title="员工ID">员工ID</th><th class="usertb-th" title="员工名字">员工名字</th><th class="usertb-th" title="员工登陆密码">员工登陆密码</th>
  <th class="usertb-th" title="员工性别">员工性别</th><th class="usertb-th" title="员工年龄">员工年龄</th><th class="usertb-th" title="员工所在部门">员工所在部门</th>
  <th class="usertb-th" title="员工所在岗位">员工所在岗位</th><th class="usertb-th" title="入职时间">入职时间</th><th class="usertb-th" title="离职时间">离职时间</th>
  <th class="usertb-th" title="员工工龄">员工工龄</th><th class="usertb-th" title="员工工作状态">员工工作状态</th><th class="usertb-th" title="员工电话号码">员工电话号码</th>
  <th class="usertb-th" title="员工家庭住址">员工家庭住址</th><th class="usertb-th" title="员工生日">员工生日</th><th class="usertb-th" title="员工本月工作时长">员工本月工作时长</th>
  <th class="usertb-th" title="员工总工作时长">员工总工作时长</th><th class="usertb-th" title="权限">权限</th><th class="usertb-th" title="备注">备注</th>
  <th>操作</th>
  </tr>
  <%
  if(intPageCount>0){
  rsu.absolute((intPage-1)*intPageSize+1);
  i=0;
  while(i<intPageSize &&!rsu.isAfterLast()){
//   userLogin usl=new userLogin();
//   List<userInfo> list = usl.getList();
//   for(userInfo usi:list) {
   %>
   <tr class="usertb-tr" align="center">
   <td class="usertb-td"><%=rsu.getString(1) %></td><td class="usertb-td"><%=rsu.getString(2) %></td>
   <td class="usertb-td"><%=rsu.getString(3) %></td><td class="usertb-td"><%=rsu.getString(4) %></td>
   <td class="usertb-td"><%=rsu.getString(5) %></td><td class="usertb-td"><%=rsu.getString(6) %></td>
   <td class="usertb-td"><%=rsu.getString(7) %></td><td class="usertb-td"><%=rsu.getString(8) %></td>
   <td class="usertb-td"><%=rsu.getString(9) %></td><td class="usertb-td"><%=rsu.getString(10) %></td>
   <td class="usertb-td"><%=rsu.getString(11) %></td><td class="usertb-td"><%=rsu.getString(12) %></td>
   <td class="usertb-td"><%=rsu.getString(13) %></td><td class="usertb-td"><%=rsu.getString(14) %></td>
   <td class="usertb-td"><%=rsu.getString(15) %></td><td class="usertb-td"><%=rsu.getString(16) %></td>
   <td class="usertb-td"><%=rsu.getString(17) %></td><td class="usertb-td"><%=rsu.getString(18) %></td>
   <td ><a href="./Boos/upUaer.jsp?id=<%=rsu.getString(1) %>" class="tb-url">编辑</a>|<a href="./Boos/DeUs.jsp?id=<%=rsu.getString(1) %>" class="tb-url">删除</a></td>
   </tr><% 
   rsu.next();i++;}
   } %>
  </table>
  <center>
  第<%=intPage %>页  共<%=intPageCount %>页
  <% if(intPage>1&&intPage<intPageCount){ %> <a href="./Boos/updateUser.jsp?page=<%=intPage-1 %>" class="tb-url">上一页</a>
  <a href="./Boos/updateUser.jsp?page=<%=intPage+1 %>" class="tb-url">下一页</a>
  <% }else if(intPage<=1){ %>上一页  <a href="./Boos/updateUser.jsp?page=<%=intPage+1 %>" class="tb-url">下一页</a>
  <% }else{ %><a href="./Boos/updateUser.jsp?page=<%=intPage-1 %>" class="tb-url">上一页</a> 下一页<% } %>
  </center>
  </body>
</html>
<% conn.close(); %>


