<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="faceID.faceAdd,faceID.faceGet,conn.Journal.*"%>
 <%@page import="java.text.SimpleDateFormat"%>
 <%
  request.setCharacterEncoding("UTF-8");
  String inuser =(String)session.getAttribute("userid");
  if("faceadd".equals(request.getParameter("action")) )
{
  faceGet faceget=new faceGet();
  faceAdd faceadd=new faceAdd();
  	JournalInfo joi= new JournalInfo();
	Jour jo=new Jour();
   Date d = new Date();
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String now = df.format(d);
 faceget.setFaceid(request.getParameter("facetoken"));
 faceget.setUserid(inuser);
 String[] iflog=new String[35];
 iflog=faceadd.Add(faceget);
 if(iflog[2].equals(":0,")){
 joi.setJO_time(now);joi.setJO_staff(inuser);joi.setJO_things("账户添加面部信息");joi.setJO_remark("无");
 jo.insert(joi);
 out.print("<script>alert('账户添加成功'); window.location='./insertDepar.jsp' </script>");
// response.sendRedirect("user.jsp");  (String)session.getAttribute("usid")
}
else{
out.print("<script>alert('添加失败,请确保面部信息显示在人脸框中，并避免周围人的面部信息显示在人脸框！！！'); window.location='insertDeno1fa.jsp' </script>");
}

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

 <!DOCTYPE html>
  <html>
  <head>
     <link rel="stylesheet" type="text/css" href="../css/styles.css">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>webcam</title>
 <style>
      #canvas,#video {
        float: left;
        margin-right: 10px;
        background: #fff;
      }
      .box {
        overflow: hidden;
        margin-bottom: 10px;
      }
    </style> 
 </head>
     <body onload="liveVideo()" class="usin">添加账户面部信息:
<%--   <%=userid %><br/><%=facetoken %><br/>  --%>
         <div id="box">       
             <video id="video" width="400" height="300" ></video>         
             <canvas  id="canvas"style="display:none;"></canvas> 
       
 			<form  id="form" name="form"  method="post" action="insertDeno1fa.jsp?action=faceadd">
			<input id="facetoken"  type="text"  name="facetoken" style="display:none"/>
			<input type="submit" name="button" id="button" onclick="catchface()" value="注册" class="inface"/>
			</form> </div>
			<script>
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
					video.srcObject = stream;

          	video.play();   // 播放
        	}, function(error){
          	console.log(error.name || error);
        	});
      }
      function catchface(){
      ctx.drawImage(video, 0, 0, width, height);
            var url = canvas.toDataURL('image/png');
            var facebase64 = url.substring(22);
            document.getElementById("facetoken").value = facebase64;
      };
    </script>
     </body>
 </html>

