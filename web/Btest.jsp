<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="faceID.FaceSearch,faceID.faceGet,conn.Journal.*,java.lang.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
  request.setCharacterEncoding("UTF-8");
  Date d = new Date();
 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
  Jour jo =new Jour();
  JournalInfo joi = new JournalInfo();
  faceGet faceget=new faceGet();
  FaceSearch faces=new FaceSearch();
  if("facelogin".equals(request.getParameter("action")) )
{
if("0".equals(request.getParameter("facetoken").length())||"null".equals(request.getParameter("facetoken")))
{out.print("<script>alert('请登陆打卡！！！'); window.location='BSfaceLogin.jsp' </script>");}
else{
 faceget.setFaceid(request.getParameter("facetoken"));
String[] iflog=new String[35];
iflog=faces.BSsearch(faceget);
if(iflog[2].equals(":0,")){
String[] con=new String[3];con=iflog[34].split(":");String[] con1=new String[3];con1=con[1].split("\\.");
int conn=Integer.decode(con1[0]);
if(conn > 80){
joi.setJO_time(now);joi.setJO_staff(iflog[27]);joi.setJO_things("BOOS人脸识别打卡");joi.setJO_remark("1");
 jo.insert(joi);
session.setAttribute("boosid", iflog[27]);
out.print("<script>alert('打卡成功'); window.location='./Boos/boosIndex.jsp' </script>");
// response.sendRedirect("user.jsp");
}else {
out.print("<script>alert('打卡失败,请确认您是否为本公司员工，并尽量不要化过浓的妆容。'); window.location='BSfaceLogin.jsp' </script>");
}
}
else{
out.print("<script>alert('打卡失败,请确保面部信息显示在人脸框中，并避免周围人的面部信息显示在人脸框！！！'); window.location='BSfaceLogin.jsp' </script>");
}}}
else{
out.print("<script>alert('请登陆打卡！！！'); window.location='BSfaceLogin.jsp' </script>");
}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  </body>
</html>

