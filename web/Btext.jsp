<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@page import="conn.Boos.*,conn.Journal.*"%>
 <%@page import="java.text.SimpleDateFormat"%>
<%
  request.setCharacterEncoding("UTF-8");
    Date d = new Date();
 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
  Jour jo =new Jour();
  JournalInfo joi = new JournalInfo();
	BoosInfo useri=new BoosInfo();
	boosLogin userl=new boosLogin();
  if("login".equals(request.getParameter("action")) )
{
if("0".equals(request.getParameter("number").length())||"null".equals(request.getParameter("password")))
{out.print("<script>alert('请登陆！！！'); window.location='BSlogin.jsp' </script>");}
else{
 useri.setBOOS_id(request.getParameter("number"));
 useri.setBOOS_password(request.getParameter("password"));
boolean iflog;
iflog=userl.boosLogn(useri);
if(iflog){
joi.setJO_time(now);joi.setJO_staff(request.getParameter("number"));joi.setJO_things("BOOS用户名密码登陆");joi.setJO_remark("无");
 jo.insert(joi);
//使用iflogp[27]获取权限，查看后把iflog[27]写入season，重定向至相应页面，同时吧登陆写入日志表
session.setAttribute("boosid", request.getParameter("number"));
out.print("<script>alert('登陆成功'); window.location='./Boos/boosIndex.jsp' </script>");
// response.sendRedirect("user.jsp");
}
else{
out.print("<script>alert('ID或密码不正确，请重新登录！'); window.location='BSlogin.jsp' </script>");
}}}
else{
out.print("<script>alert('请登陆！！！'); window.location='BSlogin.jsp' </script>");
}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  </body>
</html>


