<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="conn.Journal.*" %>
 <%@ page import="java.text.SimpleDateFormat"%><%@ page import="conn.Wages.*" %>
 <% request.setCharacterEncoding("UTF-8");
	String boosid =(String)session.getAttribute("boosid");
	Date d = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = df.format(d);
	wage wa=new wage();
	WagesInfo wain=new WagesInfo();
	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
	if("update".equals(request.getParameter("action"))){
	wain.setWA_num(request.getParameter("waid"));
	wain.setWA_name(request.getParameter("name"));
	wain.setWA_department(request.getParameter("wa_de"));
	wain.setWA_post(request.getParameter("wa_po"));
	wain.setWA_wages(request.getParameter("wawa"));
	wain.setWA_reward(request.getParameter("ware"));
	wain.setWA_overtime(request.getParameter("waov"));
	wain.setWA_fine(request.getParameter("wafi"));
	wain.setWA_actual(request.getParameter("waac"));
	wain.setWA_remark(request.getParameter("warecc"));
	wa.uponeWage(wain);
	 joi.setJO_time(now);joi.setJO_staff(boosid);joi.setJO_things("修改工资表信息");joi.setJO_remark("无");
 jo.insert(joi);
 out.print("<script>alert('工资表修改成功'); window.location='./updateWage.jsp' </script>");
}
	%>
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
    <title>My JSP 'upWage.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>

  <body class="usin">修改工资信息：<div class="inuser">
    <% WagesInfo waino=wa.getoneWage(request.getParameter("id")); %>

    <form id="form1" name="form1" method="post" action="./Boos/upWage.jsp?action=update">
    <table>
    <tr><td>员工姓名：</td>
    <td><input type="text" id="name" name="name" readonly="readonly" value="<%=waino.getWA_name() %>"/></td></tr>
    <tr><td>员工所在部门：</td>
    <td><input type="text" id="wa_de" name="wa_de" readonly="readonly" value="<%=waino.getWA_department() %>"/></td></tr>
    <tr><td>员工所在岗位：</td>
    <td><input type="text" id="wa_po" name="wa_po" readonly="readonly" value="<%=waino.getWA_post() %>"/></td></tr>
    <tr><td>员工基本工资：</td>
    <td><input type="number" id="wawa" name="wawa" required="required" value="<%=waino.getWA_wages() %>"/>*不能为空</td></tr>
    <tr><td>员工奖励金额：</td>
    <td><input type="number" id="ware" name="ware" required="required" value="<%=waino.getWA_reward() %>"/>*不能为空</td></tr>
    <tr><td>员工加班时长：</td>
    <td><input type="number" id="waov" name="waov" required="required" value="<%=waino.getWA_overtime() %>"/>*不能为空</td></tr>
    <tr><td>员工罚款金额：</td>
    <td><input type="number" id="wafi" name="wafi" required="required" value="<%=waino.getWA_fine() %>"/>*不能为空</td></tr>
    <tr><td>员工实际发放金额：</td>
    <td><input type="number" id="waac" name="waac" required="required" value="<%=waino.getWA_actual() %>"/>*不能为空</td></tr>
    <tr><td>备注：</td>
    <td><input type="text" id="warecc" name="warecc"  value="<%=waino.getWA_remark() %>"/></td></tr>
    <tr><td colspan="2"><input type="submit" name="button" id="button" value="提交" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="button1" id="button1" value="重置" />
<input type="hidden" name="waid" value="<%=waino.getWA_num() %>" /> </td></tr>
    </table></form></div>
  </body>
</html>
