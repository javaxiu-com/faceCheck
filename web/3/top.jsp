<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
body {
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
}
canvas {
  width: 100%;
  height: 100%;
}
</style>
</head>
<body>
<canvas id="canvas"></canvas>
<script language="javascript">
var canvas = document.getElementById("canvas"),
   ctx = canvas.getContext('2d'),
   width = canvas.width = canvas.offsetWidth,
   height = canvas.height = canvas.offsetHeight;

var A=30,
   W=1 /200,
   Q=0,
   H= height / 2;

var A2=30,
   W2=1/300,
   Q2=0,
   H2= height / 2;

var speed=-0.01;
var speed2=-0.02;

var lingrad = ctx.createLinearGradient(0,0,width,0);
lingrad.addColorStop(0, 'rgba(220,226,236,0.8)');
lingrad.addColorStop(1, 'rgba(176,196,222,1)');  

var lingrad2 = ctx.createLinearGradient(0,0,width,0);
lingrad2.addColorStop(0,'rgba(176,196,222,1)');
lingrad2.addColorStop(1, 'rgba(220,226,236,0.8)'); 

(function draw(){
  window.requestAnimationFrame(draw);
  ctx.clearRect(0, 0, width, height);
  ctx.beginPath();
  ctx.fillStyle = lingrad;
  ctx.moveTo(0, height /2);
  //绘制第一个波形
  Q+=speed;
  for (let x = 0; x <=  width; x++) {
    var s = 0.1*Math.sin(x/150)+1;
    var y = A*Math.sin(W*x+Q) +H;
    y=y*s;
    ctx.lineTo(x, y);
  }
  ctx.lineTo(width, height);
  ctx.lineTo(0, height);
  ctx.fill();
  ctx.closePath()
  //设置重叠效果
  ctx.globalCompositeOperation = "destination-over"
  //绘制第二个波形
  ctx.beginPath();
  ctx.fillStyle = lingrad2;
  Q2+=speed2;
  for (let x = 0; x < width; x++) {
    var y = A2*Math.sin(x*W2+Q2) +H2;
    ctx.lineTo(x, y);
  }
  ctx.lineTo(width,height);
  ctx.lineTo(0,height);
  ctx.fill()
  ctx.closePath();

})()

</script>
</body>
</html>