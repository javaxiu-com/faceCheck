<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="faceID.FaceSearch,faceID.faceGet,conn.User.*,conn.Journal.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
 request.setCharacterEncoding("UTF-8");
 Date d = new Date();
 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
  faceGet faceget=new faceGet();
  FaceSearch faces=new FaceSearch();
  userLogin usl=new userLogin();
  userInfo usi=new userInfo();
  Jour jo =new Jour();
  JournalInfo joi = new JournalInfo();
  if("facelogin".equals(request.getParameter("action")) )
{
if("0".equals(request.getParameter("facetoken").length())||"null".equals(request.getParameter("facetoken")))
{out.print("<script>alert('请登陆打卡！！！'); window.location='faceLogin.jsp' </script>");}
else{
 faceget.setFaceid(request.getParameter("facetoken"));
String[] iflog=new String[35];
iflog=faces.search(faceget);
if(iflog[2].equals(":0,")){//使用iflogp[27]获取权限，查看后把iflog[27]写入season，重定向至相应页面，同时吧登陆写入日志表
String[] con=new String[3];con=iflog[34].split(":");String[] con1=new String[3];con1=con[1].split("\\.");
int conn=Integer.decode(con1[0]);
if(conn > 80){
String pw= null;
pw = usl.getPower(iflog[27]);
session.setAttribute("ST_num", iflog[27]);
 joi.setJO_time(now);joi.setJO_staff(iflog[27]);joi.setJO_things("人脸识别打卡");joi.setJO_remark("1");
 jo.insert(joi);
switch(pw){
  case "0":
    out.print("<script>alert('打卡成功'); window.location='./0/userindex.jsp' </script>");
    break;
  case "1":
    out.print("<script>alert('打卡成功'); window.location='./1/1power.jsp' </script>");
    break;
  case "2":
    out.print("<script>alert('打卡成功'); window.location='./2/2power.jsp' </script>");
    break;
  case "3":
    out.print("<script>alert('打卡成功'); window.location='./3/3power.jsp' </script>");
    break;
}
}
// response.sendRedirect("user.jsp");
else {
out.print("<script>alert('打卡失败,请确认您是否为本公司员工，并尽量不要化过浓的妆容。'); window.location='BSfaceLogin.jsp' </script>");
}
}
else{
out.print("<script>alert('打卡失败,请确保面部信息显示在人脸框中，并避免周围人的面部信息显示在人脸框！！！'); window.location='faceLogin.jsp' </script>");
}}}
else{
out.print("<script>alert('请登陆打卡！！！'); window.location='faceLogin.jsp' </script>");
}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  </body>
</html>
