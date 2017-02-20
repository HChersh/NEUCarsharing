<%@ page language="java" import="java.util.*,java.sql.*,database.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    
    <title>反馈页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery.min.js"> </script>
	<link rel="stylesheet" href="css/bootstrap.min.css" media="screen" type="text/css" />
	<link rel="stylesheet" href="js/bootstrap.min.js" media="screen" type="text/css" />
	
	<style type="text/css">
	body{background-image:url(images/2.jpg);
	background-repeat:no-repeat;}
	</style>
  </head>
  
  <body >
  <br>
   <br>
    <br>
     <br>
  <center>
    <font face="微软雅黑"  size =20  color="white" >意见反馈</font> 
    <br>
    </center>
    <hr width =50% size =0.01 align =center color=" #7CFC00 "  noshade >
    <br>
    <br>
     <br>
     <br>
     <br>
     <p style="text-indent:27em;"><font face="楷体"  size =4  color="white" >亲，让我们开始留言吧！</font></p>
	    <%  
    //BaseConnection bc=new BaseConnection();
    	String username = session.getAttribute("username").toString();
    	String feedback = request.getParameter("feedback");
    	if(username!=null&&feedback!=null){
	    	BaseConnection bc=new BaseConnection();
	
			Connection conn = bc.open();
			String sql="insert into mail"
						+ " values('"+username+"','"+feedback+"')";
			try{
				  Statement stmt = (Statement) conn.createStatement();
				  stmt.executeUpdate(sql);			  
			}
			catch (Exception e){
				e.printStackTrace();
			}
			finally{
				conn.close();
			}
    	}
    	
     %>
    <p id="username" style="display:none"><%=session.getAttribute("username").toString()%></p>
    <center> 
    <div id="advice_list" style="display: none" class="contact"><ul></ul></div>
    <div id="feedback_div" class="contact">
    <textarea id="feedback" name ="feedback"  rows=10 cols=80 ></textarea>
    <script type="text/javascript">
    	function history() {
    		$("ul").html(" ");
    		document.getElementById("advice_list").style.display="block";
    		document.getElementById("feedback_div").style.display="none";
			if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			
			  xmlhttp.open("POST","servlet/Advice",true);
			  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			  var username=document.getElementById("username").innerHTML;
			  alert(username);
			  xmlhttp.send("&username="+username);
			  xmlhttp.onreadystatechange=function()
			  {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    	var response = xmlhttp.responseText;
			    	var list = response.split("|");
			    	var i = 0;

					for(i=0;i<list.length-1;i++){
						var a = document.createElement("h4");
						a.innerHTML = list[i];
						a.setAttribute("class", "h4");
						//a.style.backgroundImage=url("bg.jpeg");
						if(a.innerHTML.trim()!=""&&a.innerHTML!=null){
							$("ul").append(a);
							$("ul").append("<br>");					
					  }
					}	
			    }
			  };
			  			 
		}
		
		function back(){
			document.getElementById("advice_list").style.display="none";
    		document.getElementById("feedback_div").style.display="block";
		}
		
		function submit(){
			if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			  var feedback = document.getElementById("feedback").value;	 
			  if(feedback==""||feedback==null){
			  	alert("请输入内容后再提交");
			  }else{
			  	xmlhttp.open("POST","advice.jsp",true);
				  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				 xmlhttp.send("feedback="+feedback);
				 document.getElementById("feedback").value="";
				 
				 alert("提交完毕");	
			  }
		}
    </script>

    </div>
    
  <br>
    <div>
    <input type="button" align=left onClick="submit()" name="affirm_button" value="提交"  style="background-color:#00CD00;color:white; width:70px;height:30px;"> 
    <input type="button" align=left onClick="history()" name="affirm_button" value="我的意见"  style="background-color:#00CD00;color:white; width:70px;height:30px;"> 
    <input type="button" align=left onClick="back()" name="affirm_button" value="返回"  style="background-color:#00CD00;color:white; width:70px;height:30px;">  
    <br><br>
      <a style="color:black;" href="homePage.jsp"style="font-size:20px;">返回主页</a>
  </center>

    
  </body>
</html>
