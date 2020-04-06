<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@page import="conn.User.*,conn.Journal.*"%>
 <%@page import="java.text.SimpleDateFormat"%>
<%
  request.setCharacterEncoding("UTF-8");
  Date d = new Date();
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
	userInfo useri=new userInfo();
	userLogin userl=new userLogin();
	  Jour jo =new Jour();
  JournalInfo joi = new JournalInfo();
  if("login".equals(request.getParameter("action")) )
{
if("0".equals(request.getParameter("user").length())||"null".equals(request.getParameter("password")))
{out.print("<script>alert('请登陆！！！'); window.location='login.jsp' </script>");}
else{
 useri.setST_num(request.getParameter("user"));
 useri.setST_password(request.getParameter("password"));
boolean iflog;
iflog=userl.userLogn(useri);
if(iflog){
String pw= null;
pw = userl.getPower(request.getParameter("user"));
session.setAttribute("ST_num",request.getParameter("user"));
 joi.setJO_time(now);joi.setJO_staff(request.getParameter("user"));joi.setJO_things("用户名密码登陆");joi.setJO_remark("无");
 jo.insert(joi);
switch(pw){
  case "0":
    out.print("<script>alert('登陆成功'); window.location='./0/userindex.jsp' </script>");
    break;
  case "1":
    out.print("<script>alert('登陆成功'); window.location='./1/1power.jsp' </script>");
    break;
  case "2":
    out.print("<script>alert('登陆成功'); window.location='./2/2power.jsp' </script>");
    break;
  case "3":
    out.print("<script>alert('登陆成功'); window.location='./3/3power.jsp' </script>");
    break;
}}
else{
out.print("<script>alert('工号或密码不正确，请重新登录！'); window.location='login.jsp' </script>");
}}}
else{
out.print("<script>alert('请登陆！！！'); window.location='login.jsp' </script>");
}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  </body>
</html>

