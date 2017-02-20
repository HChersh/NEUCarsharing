<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chatroom.jsp' starting page</title>
    
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
	<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
  </head>
  
  <body onload="get()">
  <p id="from" style="display: none;"><%=request.getParameter("from") %></p>
  <p id="to" style="display: none"><%=request.getParameter("to")%></p>
    <div class="container">
    	<div id="myDiv" class="chat-thread">
    	<ul id="list"></ul>
    	</div>
  		<div class="row">
		  <div class="col-md-4"></div>
		  <div class="col-md-4">
		  <textarea id="message" class="form-control" rows="3"></textarea>
				<input class="button" type="button" value="发送" onclick="send()">
				<input type="button" value="表情" >
		  </div>
		  <div class="col-md-4"></div>
		</div>
    </div>
    <script type="text/javascript">
    	function get(){

    		 setInterval("request()",2000);
    		
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
			 var sender = document.getElementById("from").innerHTML;
			 var receiver = document.getElementById("to").innerHTML;
			xmlhttp.open("POST","servlet/ChatResponse",true);
			 xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			 xmlhttp.send("time="+new Date().toString()+
			"&from="+sender+"&to="+receiver+
			 "&request=get");
			xmlhttp.onreadystatechange=function()
			  {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    	var response = xmlhttp.responseText;
			    	var list = response.split("|");
			    	var i = 0;

					for(i=0;i<list.length-1;i++){
						var a = document.createElement("li");
						a.innerHTML = list[i];
						if(a.innerHTML.trim()!=""&&a.innerHTML!=null){
						var ul=document.getElementById('list');
						var length=ul.getElementsByTagName('li').length;
						if(length%2!=0){
							$("ul").append(a);
						}else{
							var b = document.createElement("li");
							b.innerHTML="";
							b.style.display='none';
							$("ul").append(b);
							$("ul").append(a);
						}
						
					  }
					}										
					
			    }
			  };
    	}
    	function send(){
			var ul=document.getElementById('list');
			var length=ul.getElementsByTagName('li').length;
    		var text = document.getElementById("message").value;
    		if(text!=null&&text.trim()!=""){
	    		if(length%2==0){				
	    		 	$("ul").append("<li>"+text+"</li>");
	    			document.getElementById("message").value = "";
				}else{
					var a = document.createElement("li");
					a.innerHTML="";
					a.style.display='none';
					$("ul").append(a);
					$("ul").append("<li>"+text+"</li>");
	    			document.getElementById("message").value = "";
				}
    		}
			
    		if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			  var message="message="+text;	
			  var sender = document.getElementById("from").innerHTML;
			  var receiver = document.getElementById("to").innerHTML;		  
			 xmlhttp.open("POST","servlet/ChatResponse",true);
			  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			 xmlhttp.send("time="+new Date().toString()+
			 "&"+message+"&from="+sender+"&to="+receiver+
			 "&request=send"); 			   	
    	}
    </script>
  </body>
</html>
