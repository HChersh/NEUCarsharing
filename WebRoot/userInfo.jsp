<%@ page language="java" import="java.util.*,user.*,com.google.gson.Gson" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
   String username = session.getAttribute("username").toString();
   UserManager um = new UserManager();
   User user = um.findUserInfo(username);
   Gson gson = new Gson();
   String userinfo = gson.toJson(user);
   String autograph = um.getMessage(username, username);
      
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <style>
	  
		#contactform {
		 
		    width: 500px;
		    padding: 20px;
		    background: #f0f0f0;
		    overflow:auto;
		 
		    /* Border style */
		    border: 1px solid #cccccc;
		    -moz-border-radius: 7px;
		    -webkit-border-radius: 7px;
		    border-radius: 7px; 
		 
		    /* Border Shadow */
		    -moz-box-shadow: 2px 2px 2px #cccccc;
		    -webkit-box-shadow: 2px 2px 2px #cccccc;
		    box-shadow: 2px 2px 2px #cccccc;
		 
		    }
		label {
		    font-family: Arial, Verdana;
		    text-shadow: 2px 2px 2px #ccc;
		    display: block;
		    float: left;
		    font-weight: bold;
		    margin-right:10px;
		    text-align: right;
		    width: 120px;
		    line-height: 25px;
		    font-size: 15px;
		    }
		.input{
		    font-family: Arial, Verdana;
		    font-size: 15px;
		    padding: 5px;
		    border: 1px solid #b9bdc1;
		    width: 300px;
		    color: #797979;
		    }
		.hint{
		    display:none;
		    }
		.field:hover .hint {
		    position: absolute;
		    display: block;
		    margin: -30px 0 0 455px;
		    color: #FFFFFF;
		    padding: 7px 10px;
		    background: rgba(0, 0, 0, 0.6);
		 
		    -moz-border-radius: 7px;
		    -webkit-border-radius: 7px;
		    border-radius: 7px;
		    }
		.button{
		    float: right;
		    margin:10px 55px 10px 0;
		    font-weight: bold;
		    line-height: 1;
		    padding: 6px 10px;
		    cursor:pointer;
		    color: #fff;
		 
		    text-align: center;
		    text-shadow: 0 -1px 1px #64799e;
		 
		    /* Background gradient */
		    background: #a5b8da;
		    background: -moz-linear-gradient
		       (top, #a5b8da 0%, #7089b3 100%);
		    background: -webkit-gradient
		       (linear, 0% 0%, 0% 100%,
		       from(#a5b8da), to(#7089b3));
		 
		    /* Border style */
		    border: 1px solid #5c6f91;
		    -moz-border-radius: 10px;
		    -webkit-border-radius: 10px;
		    border-radius: 10px;
		 
		    /* Box shadow */
		    -moz-box-shadow: inset 0 1px 0 0 #aec3e5;
		    -webkit-box-shadow: inset 0 1px 0 0 #aec3e5;
		    box-shadow: inset 0 1px 0 0 #aec3e5;
		 
		    }
	  </style>
  </head>
  <script>
   window.onload = function(){
	  var oJson = eval(<%=userinfo%>);
      var name = document.getElementById("name");
      var email = document.getElementById("email");
      var password = document.getElementById("password");
      var evaluate = document.getElementById("evaluate");
      var tell = document.getElementById("tell");
      var autograph = document.getElementById("autograph");
      
      name.value = oJson.username;
      email.value = oJson.email;
      password.value = oJson.password;
      evaluate.value = oJson.evaluate;
      tell.value = oJson.tell;

   };
  </script>
  
  <body>
	  <div id ="formDiv" style="width:500px;margin:0 auto;">
	  
		   <form id="contactform" class="rounded" method="post" action="servlet/userInfoChange" >
		     <h3>Contact Form</h3>
		 
				<div class="field">
				    <label for="name">姓名：</label>
				    <input type="text" class="input" name="name" id="name" />
				    <p class="hint">暂时不要更改用户 ，后台数据库没写好一致性，容易崩。。。</p>  
				</div>
				 
				<div class="field">
				    <label for="email">邮箱：</label>
				    <input type="text" class="input" name="email" id="email" />
				    <!-- <p class="hint">Enter your name.</p> --> 
				</div>
				<div class="field">
				    <label for="tell">电话：</label>
				    <input type="text" class="input" name="tell" id="tell" />
				    <!-- <p class="hint">Enter your name.</p> --> 
				</div>
				<div class="field">
				    <label for="password">密码：</label>
				    <input type="text" class="input" name="password" id="password" />
				    <!-- <p class="hint">Enter your name.</p> --> 
				</div>
				 
				<div class="field">
				    <label for="evaluate">评估：</label>
				    <input type="text" class="input" name="evaluate" id="evaluate" />
				    <p class="hint">良好的拼车习惯会将会提升你的信用评级，不良操作将会扣分</p> 
				</div>
		 
		 
			    <div class="field">
				    <label for="autograph">个性签名：</label>
				    <input type="text" class="input" name="autograph" id="autograph" value="<%=autograph%>"/>
				    <p class="hint">个性签名</p> 
				</div>
				
				<div class="field">
				    <label for="leave_message">留言板：</label>
				    <textarea class="input textarea" name="message" id="leave_message">
				    </textarea>
				    <p class="hint">别人给你的留言</p> 
				</div>
				
				
		<!-- <a href="homePage.jsp"><input type="button" class="button" value="返回主页"/></a> -->	
		    <input type="submit" name="Submit"  class="button" value="修改我的信息" />
		  </form>
		  
	</div>   
  
  
  
  
  
  </body>
</html>
