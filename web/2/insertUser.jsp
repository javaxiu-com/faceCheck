<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.User.*,conn.Journal.*,conn.Wages.*,conn.Post.*" %>
 <%@page import="java.text.SimpleDateFormat"%>
 <%
 request.setCharacterEncoding("UTF-8");
 String boosid =(String)session.getAttribute("ST_num");
userLogin usl =new userLogin();
userInfo usin=usl.getUser(boosid);
String de=usin.getST_department(); //获取部门名称
String pow;
if(de.equals("财务部"))
{pow="1";}else{pow="0";}//给财务部员工默认配置1权限
 Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);
userInfo usi=new userInfo();
JournalInfo joi= new JournalInfo();
Jour jo=new Jour();
wage wa=new wage();
WagesInfo wain=new WagesInfo();
String name=request.getParameter("Uname");
if("insertno1".equals(request.getParameter("action")))
{
usi.setST_address(request.getParameter("addr"));
usi.setST_name(name);
usi.setST_password(request.getParameter("upass"));
usi.setST_ago(request.getParameter("ago"));
usi.setST_reamrks(request.getParameter("ream"));
usi.setST_entrytime(request.getParameter("entr"));
usi.setST_quittime(request.getParameter("quit"));
usi.setST_worktime(request.getParameter("work"));
usi.setST_condition(request.getParameter("condi"));
usi.setST_phone(request.getParameter("phon"));
usi.setST_sex(request.getParameter("sex"));
usi.setST_birthday(request.getParameter("birt"));
usi.setST_workhours(request.getParameter("workho"));
usi.setST_aggworkhours(request.getParameter("aggwo"));
usi.setST_power(pow);
usi.setST_department(request.getParameter("depa"));
usi.setST_post(request.getParameter("po"));
usl.insert(usi);
String usid=usl.getuserID(name);
 joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("添加部门默认员工信息");joi.setJO_remark("无");
 jo.insert(joi);
 wain.setWA_num(usid);wain.setWA_name(name);wain.setWA_department(request.getParameter("depa"));
 wain.setWA_post(request.getParameter("po"));wain.setWA_actual("0");wain.setWA_fine("0");wain.setWA_overtime("0");
 wain.setWA_remark(" ");wain.setWA_reward("0");wain.setWA_wages("0");
 wa.insertWage(wain);
  session.setAttribute("userid",usid);
 out.print("<script>alert('账户添加成功，点击确定进行面部信息注册'); window.location='./insertuserfa.jsp' </script>");
 } %>
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

    <title>My JSP 'insertDeno1.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body class="usin">添加本部门的员工账户:<div class="inuser">
<form id="form1" name="form1" method="post" action="./2/insertUser.jsp?action=insertno1">
<table>
<tr>
<td>用户名字</td><td><input type="text" name="Uname" id="Uname" required="required" />*不能为空</td>
</tr>
<tr>
<td>密码</td><td><input type="text" name="upass" id="upass" required="required" />*不能为空</td>
</tr>
<tr>
<td>性別</td><td><input type="radio" name="sex" id="usex" value="男" />男
<input type="radio" name="sex" id="sex" value="女" />女</td>
</tr>
<tr>
<td>年齡</td><td><input type="text" name="ago" id="ago" required="required" />*不能为空</td>
</tr>
<tr>
<td>所在部門</td><td><input type="text" name="depa" id="depa" readonly="readonly" value="<%=de %>"/></td>
</tr>
<tr>
<td>所在崗位</td><td><% Post po=new Post();List<PostInfo> list = po.getpo(de); for(PostInfo poin:list) {%>
<input type="radio" name="po" id="po"  value="<%=poin.getPO_name() %>"/>
<%=poin.getPO_name() %><%} %></td>
</tr>
<tr>
<td>入職時間</td><td><input type="date" name="entr" id="entr" required="required" />*不能为空</td>
</tr>
<tr>
<td>離職時間</td><td><input type="date" name="quit" id="quit" required="required" />*不能为空</td>
</tr>
<tr>
<td>工龄</td><td><input type="number" name="work" id="work" required="required" />*不能为空</td>
</tr>
<tr>
<td>工作状态</td><td><input type="text" name="condi" id="condi" /></td>
</tr>
<tr>
<td>电话号码</td><td><input type="number" name="phon" id="phon" required="required" />*不能为空</td>
</tr>
<tr>
<td>员工住址</td><td><input type="text" name="addr" id="addr" /></td>
</tr>
<tr>
<td>生日</td><td><input type="date" name="birt" id="birt" required="required" required="required" />*不能为空</td>
</tr>
<tr>
<td>本月工作时长</td><td><input type="number" name="workho" id="workho" required="required" />*不能为空</td>
</tr>
<tr>
<td>总工作时长</td><td><input type="number" name="aggwo" id="aggwo" required="required" />*不能为空</td>
</tr>
<tr>
<td>备注</td><td><input type="text" name="ream" id="ream" /></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="button" id="button" value="提交" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
</td></tr></table></form></div>
  </body>
</html>

