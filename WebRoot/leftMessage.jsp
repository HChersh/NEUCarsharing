<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'homePage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.min.js"> </script>
	<link rel="stylesheet" href="css/bootstrap.min.css" media="screen" type="text/css" />
	<link rel="stylesheet" href="js/bootstrap.min.js" media="screen" type="text/css" />
	<style type="text/css">
ol li{position:relative; padding-left:20px;  height:20px; overflow:hidden; line-height:20px; width:250px; list-style:none;padding-right:60px;}
li a{ display:inline-block; text-decoration:none; color:#000;}
	 body{background:rgb(203,217,231);FONT-SIZE:20px;FONT-FAMILY: "宋体", arial}
	</style>
  </head>
  <body onload="load()">
    
  	<div id="list" class="sidebar-module">
  		<h4>消息通知：</h4>
  		<ol class="list-unstyled">
  			
  		</ol>
  	</div>
    <p  id="username" style="display: none"><%=session.getAttribute("username").toString()%></p>
    <script type="text/javascript">
  	function load(){		
  		setInterval("request()",5*1000);
  		//request();
  	} 	
  	function request(){
				
    		  if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
		  	var sender=document.getElementById("username").innerHTML;
			 xmlhttp.open("POST","servlet/ListShowing",true);
			 xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("time="+new Date().toString()+
			 "&status=0&from="+sender);
			xmlhttp.onreadystatechange=function()
			  {
				
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    	$("ol").html("");
			    	var a = xmlhttp.responseText;
			    	var list = a.split("|");
			    	var i=0;
			    	for(i=0;i<list.length-1;i++){	
			    		var item = list[i].split(",");
			    		$("ol").append("<li>User <a href='chatroom.jsp?from="+sender+"&to="
			    		+item[0]+"' target='_blank'>"+item[0]+
			    		"</a> send you "+item[1]+" messages</li>");			    					    		    		
			    	}			    	
				}	
			  };
    	}
  </script>
  </body>
</html>
