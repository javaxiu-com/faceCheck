/**
 * 
 */
 function findObject(fName,initValue){
   var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
   xmlhttp.open("POST","test.jsp?findObject="+fName+"&initValue="+initValue,false);//注意修改jsp页面
   xmlhttp.send();
   document.getElementById(fName).innerHTML=bytes2BSTR(xmlhttp.responsebody); //bytes2BSTR函数在bytetostr.js中
 }
