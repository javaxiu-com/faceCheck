<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
  </head>
  <body>
<div id="log-container"><div id="log-container-vague"></div> <!-- 给背景图片加蒙版 --></div>
  <img alt="LOGO" src="./photo/logo.png" width="200" height="200" />
  <br><span class="logodow">人脸识别考勤系统</span>
  <div class="d-ss1"> <span class="ss1">“</span></div>
  <div class="d-ss2"><span class="ss2">笃志不倦</span> </div>
	<div id="log-log">
	<p align="center"><span class="text">账号登录</span></p>
<form action="Utext.jsp?action=login" Method="post" name="user">
<br>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="number" name="user" size=20 placeholder="工号"  class="login-input"/>
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="password" onpaste="return false" ondragenter="return false"  style="ime-mode:disabled" name="password" size=20 placeholder="密码" class="login-input"/>
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="log" value="登陆" class="login-submit"/>
</form>
</div>
<div id="log-footer">
<a href="faceLogin.jsp"style='text-decoration:none;float:right;color: #8d91aa'>
<span style="font-size:20px;font-family: "Microsoft Himalaya";">员工人脸识别打卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
<a href="BSfaceLogin.jsp"style='text-decoration:none;float:right;color: #8d91aa'>
<span style="font-size:20px;font-family: "Microsoft Himalaya";">Boos人脸识别打卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
<a href="login.jsp"style='text-decoration:none;float:right;color: #8d91aa'>
<span style="font-size:20px;font-family: "Microsoft Himalaya";">员工账号登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
<a href="BSlogin.jsp"style='text-decoration:none;float:right;color: #8d91aa'>
<span style="font-size:20px;font-family: "Microsoft Himalaya";">Boos账号登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</div>
  </body>
</html>
 <script language="javascript">
        //防止页面后退
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
    </script>







