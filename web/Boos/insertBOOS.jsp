<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="conn.Boos.*,conn.Journal.*"%>
 <%@page import="java.text.SimpleDateFormat"%>
  <%
  request.setCharacterEncoding("UTF-8");
 boosLogin bsl=new boosLogin();
 BoosInfo bsi=new BoosInfo();
  String name=request.getParameter("Bname");
   bsi.setBOOS_name(name);
    if("insert".equals(request.getParameter("action")) )
{
 bsi.setBOOS_password(request.getParameter("Bpass"));
bsl.insert(bsi);
  	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
   Date d = new Date();
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
 String a=bsl.getboosID(name);
  joi.setJO_time(now);joi.setJO_staff(a);joi.setJO_things("boos添加账户");joi.setJO_remark("无");
 jo.insert(joi);
 session.setAttribute("inboosid", a);
  out.print("<script>alert('BOOS账户添加成功,点击确定进行面部信息添加'); window.location='./inBOOSFice.jsp' </script>");
}%>
<%--本地测试时:--%>
<%--<%--%>
<%--String path = request.getContextPath();--%>
<%--String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>
<%--线上运行时:--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"s://"+request.getServerName()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <base href="<%=basePath%>">
    <title>My JSP 'insertBOOS.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body class="usin">增加BOOS用户：
   <div class="usinn">
<form id="form1" name="form1" method="post" action="./Boos/insertBOOS.jsp?action=insert">
<table>
<tr>
<td>BOOS用户名字：</td><td><input type="text" name="Bname" id="Bname" /></td>
</tr>
<tr><td></td></tr>  <tr><td></td></tr>
<tr>
<td>BOOS账户密码：</td><td><input type="password" name="Bpass" id="Bpass" /></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="button" id="button" value="进行面部信息注册》》》" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
</td>
</tr>
</table>
</form></div>
  </body>
</html>
