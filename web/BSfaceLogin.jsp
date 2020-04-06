<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录打卡</title>
	<link rel="stylesheet" type="text/css" href="./css/styles.css">
  </head>
  <body onload="liveVideo()">
<div id="log-container"><div id="log-container-vague"></div> <!-- 给背景图片加蒙版 --></div>
  <img alt="LOGO" src="./photo/logo.png" width="200" height="200" />
   <br><span class="logodow">人脸识别考勤系统</span>
  <div class="d-ss1"> <span class="ss1">“</span></div>
  <div class="d-ss2"><span class="ss2">勤思则得</span> </div>
	<div id="log-logface">
	<p align="center"><span class="text">人脸识别打卡</span></p>
<video id="video" width="350" height="300" ></video>
<canvas  id="canvas" style="display:none;"></canvas>
			<form  id="form" name="form"  method="post" action="Btest.jsp?action=facelogin">
			<input id="facetoken"  type="text"  name="facetoken" style="display:none"/>
			<input type="submit" name="button" id="button" onclick="catchface()" value="人脸识别打卡"  class="facelog-submit"/>
			</form>
		<script language="javascript" for="window" event="onload">
      	var video = document.getElementById('video');
      	var canvas = document.getElementById('canvas');
      	var ctx = canvas.getContext('2d');
      	var width = video.width;
      	var height = video.height;
      	canvas.width = width;
      	canvas.height = height;
      	function liveVideo(){
        var URL = window.URL || window.webkitURL;   // 获取到window.URL对象
        navigator.getUserMedia({
          video: true
        }, function(stream){
   				// 将获取到的视频流对象转换为地址
		video.srcObject = stream;
          video.play();   // 播放
        }, function(error){
          console.log(error.name || error);
        }); }
        function catchface(){
      ctx.drawImage(video, 0, 0, width, height);
            var url = canvas.toDataURL('image/png');
            var facebase64 = url.substring(22);
            document.getElementById("facetoken").value = facebase64;
      };
    </script>
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
