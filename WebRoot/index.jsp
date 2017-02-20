<%@ page language="java" import="java.util.*,com.mysql.jdbc.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	   *{margin:0;padding:0}
	   #outDiv{width:400px;height:410px;border:5px dotted black;background:url("images/beijing3.jpg");)
	   }
	   #loginDiv{width:600px;height:400px;
	   }
	   #registerDiv{width:600px;height:400px;
	   }
	   .registerBox{width:700px;height:60px;margin:10px 30px;
	   }
	   .loginBox{width:700px;height:80px;margin:60px 60px;
	   }
	   #txt1 {width:210px;height:30px;} #txt2 {width:210px;height:30px;} #txt3 {width:210px;height:30px;} 
	   #txt4{width:210px;height:30px;}#txt5 {width:210px;height:30px;} #aaa{width:210px;height:30px;} #bbb {width:210px;height:30px;}
	</style>
	
	<script>
	 var bool1 = false;var bool2=false;var bool3 = false;var bool4 = false;var bool1 = false;
	 window.onload = function(){          //暂时用来查错误的一个主要运行函数
	     setInterval(function(){
	    	 judgeName();
	    	 judgePassword();
	    	 judgeRepassword();
	    	 judgeEmail();
	    	 judgeTell();
	     },500);	  
	   };
	function registerClick(){
	 var oLoginDiv = document.getElementById("loginDiv");
	 oLoginDiv.style.display="none";
	 var oRegisterDiv = document.getElementById("registerDiv");
	 oRegisterDiv.style.display="block";
	};
	
	function loginClick(){
	  var oLoginDiv = document.getElementById("loginDiv");
	  oLoginDiv.style.display="block";
      var oRegisterDiv = document.getElementById("registerDiv");
	  oRegisterDiv.style.display="none";
	}
	   function judgeName(){                       //判断username
		   bool1=false;
		   var oTxt1 = document.getElementById("txt1");
		   var oDivd1 = document.getElementById("divd1");
	       var oSpan1 = document.getElementById("span1");
	       var re1 = /^[a-z]\w{3,5}$/i;
	       
	       if(oTxt1.value){
	    	   oDivd1.style.display="none";
	    	   oSpan1.style.display="block";
	    	    if(re1.test(oTxt1.value)){
	    	    	oDivd1.style.display = "block";
	    	    	oSpan1.style.display="none";
	    	    	bool1=true;
	    	    }
	       }else{
	    	   oDivd1.style.display="none";
	    	   oSpan1.style.display="none";
	       }
	   }
	   function judgePassword(){                  //判断密码
		   bool2=false;
		   var oTxt2 = document.getElementById("txt2");
		   var oDivd2 = document.getElementById("divd2");
	       var oSpan2 = document.getElementById("span2");
	       var re2 = /.{6,}/;
	       if(oTxt2.value){
	    	   oDivd2.style.display="none";
	    	   oSpan2.style.display="block";
	    	    if(re2.test(oTxt2.value)){
	    	    	oDivd2.style.display = "block";
	    	    	oSpan2.style.display="none";
	    	    	bool2=true;
	    	    }
	       }else{
	    	   oDivd2.style.display="none";
	    	   oSpan2.style.display="none";
	       }
	   }
	   function judgeRepassword(){                //判断确认密码     
		   bool3=false;
		   var oTxt3 = document.getElementById("txt3");
		   var oDivd3 = document.getElementById("divd3");
	       var oSpan3 = document.getElementById("span3");
	       var oTxt = document.getElementById("txt2");
	       if(oTxt3.value){
	    	   oDivd3.style.display="none";
	    	   oSpan3.style.display="block";
	    	   if(oTxt3.value==oTxt.value){
		    	   oSpan3.style.display="none";
		    	   oDivd3.style.display="block";
		    	   bool3=true;
		       }
	       }else{                                //添加else确保在文本框中没有内容的时候不会出现绿色的小框和灰色的提醒字体
	    	   oDivd3.style.display="none";
	    	   oSpan3.style.display="none";
	       }
	   }
	   function judgeEmail(){                     //判断邮箱
		   bool4=false;
		   var oTxt4 = document.getElementById("txt4");
		   var oDivd4 = document.getElementById("divd4");
	       var oSpan4 = document.getElementById("span4");
	       var re4 = /^\w+@([a-z0-9]+\.)+[a-z]+$/i;
	       if(oTxt4.value){
	    	   oDivd4.style.display="none";
	    	   oSpan4.style.display="block";
	    	    if(re4.test(oTxt4.value)){
	    	    	oDivd4.style.display = "block";
	    	    	oSpan4.style.display="none";
	    	    	bool4=true;
	    	    }
	       }else{
	    	   oDivd4.style.display="none";
	    	   oSpan4.style.display="none";
	       }  
	   }
	   function judgeTell(){                      //判断电话
		   bool5=false;
		   var oTxt5 = document.getElementById("txt5");
		   var oDivd5 = document.getElementById("divd5");
	       var oSpan5 = document.getElementById("span5");
	       var re5 = /^[1][358][0-9]{9}$/;
	       if(oTxt5.value){
	    	   oDivd5.style.display="none";
	    	   oSpan5.style.display="block";
	    	    if(re5.test(oTxt5.value)){
	    	    	oDivd5.style.display = "block";
	    	    	oSpan5.style.display="none";
	    	    	bool5=true;
	    	    }
	       }else{
	    	   oDivd5.style.display="none";
	    	   oSpan5.style.display="none";
	       }
	   }
       function succeed(){
		 if(bool1&&bool2&&bool3&&bool4&&bool5){
			 document.registerform.submit();
			 return true;
		  }else{
			 alert('请正确填写信息');
			 return false;
		 }
	 }
	   
	   
	 
	</script>
  </head>
   
  <body>

    <div id="outDiv">
    
	    <div id="loginDiv">
          <form action="<%=basePath%>loginResult.jsp" method="post" name = "loginform">
		          <div class="loginBox">  账号:<input id="aaa" type="text" name = "username"></div>
			      <div class="loginBox"> 密码:<input id="bbb" type="password" name= "password"></div>
		    <input type="submit" value="登录"style="width:50px;height:35px;margin:1px 40px;margin-left:110px;"/>
		    <input type="button" value="注册" style="width:50px;height:35px;margin:1px 20px;"onclick="registerClick()" />
         </form>
        </div>
  
  
         <div id="registerDiv" style="display:none">
            <form action="<%=basePath%>registerResult.jsp" method="post" name = "registerform">
				<div class="registerBox"> 
				  <div id="divt1">&nbsp&nbsp&nbsp&nbsp账号: 
				    <input id="txt1" type="text" name = "username">
				  <span id="span1" style="display:none">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp请输入以字母开头的4-6位无标点id</span>
				  </div>
				  <div id="divd1" style="position:absolute;left:72;top:40;width:14px;height:14px;border:2px solid green;display:none;background:rgb(120,250,22);"></div>
				</div>
				
				<div class="registerBox"> 
				  <div id="divt2">&nbsp&nbsp&nbsp&nbsp密码:<input id="txt2" type="password" name="password">
				  <span id="span2" style="display:none">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp密码至少6位以上</span>
				  </div>
				  <div id="divd2" style="position:absolute;left:72;top:110;width:14px;height:14px;border:2px solid green;display:none;background:rgb(120,250,22);"></div>
				</div>
				
				<div class="registerBox"> 
				  <div id="divt3">确认密码 :    
				    <input id="txt3" type="password" name="repassword">
				  <span id="span3" style="display:none">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp前后两次密码不一致</span>
				  </div>
				  <div id="divd3" style="position:absolute;left:72;top:180;width:14px;height:14px;border:2px solid green;display:none;background:rgb(120,250,22);"></div>
				</div>
				
				<div class="registerBox">
				  <div id="divt4">&nbsp&nbspe-mail:<input id="txt4" type="text" name="email">
				  <span id="span4" style="display:none">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp请输入合法的邮箱</span>
				  </div>
				  <div id="divd4" style="position:absolute;left:72;top:250;width:14px;height:14px;border:2px solid green;display:none;background:rgb(120,250,22);"></div>
				</div>
				
				<div class="registerBox">
                  <div id="divt5">&nbsp&nbsp&nbsp&nbspTELL:<input id="txt5" type="text" name="tell">
                   <span id="span5" style="display:none">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp请输入正确的手机号码</span>
                  </div>				
				  <div id="divd5" style="position:absolute;left:72;top:320;width:14px;height:14px;border:2px solid green;display:none;background:rgb(120,250,22);"></div>
				</div>
				
			    <input type="button" value="完成" onClick="succeed()" style="width:50px;height:35px;margin:1px 40px;margin-left:110px;"/> 
			    <input type="button" value="取消" onClick="loginClick()"style="width:50px;height:35px;margin:1px 20px;"/>
	         </form>
         </div>
	     
    </div>
  </body>
</html>
