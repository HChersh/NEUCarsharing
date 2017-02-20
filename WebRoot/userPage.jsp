<%@ page language="java" import="java.util.*,javax.swing.JOptionPane " pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/mycss.css"> 
	<script type="text/javascript"src="js/jquery.min.js"></script>
	<script type="text/javascript"src="js/bootstrap.min.js"></script>
	
    <style>
      body{background:url("images/userpic.png");FONT-SIZE:20px;FONT-FAMILY: "宋体", arial}
      *{margin:0;padding:0;}
	  #login{width:280px;height:30px;float:right;}
	  #afterlogin{padding:3px;}
	  #afterlogin ul li{list-style:none;float:left;}
	  #head{width:980px;height:120px;margin:0 auto;background:url("images/1234.jpg");}
	  #content{width:980px;height:53px;margin:0 auto;background:rgb(203,217,231);}
	  #iframe{width:980px;height:700px;margin:0 auto;background:rgb(221,224,255);}
	  #beforeModify{background:rgb(203,217,200);}
	  #below{width:990px;font-size:15px;margin:0 auto;}
	  #below a{color:gray;}
	  #belowUl li{list-style:none;float:right;
	  }
    </style>
    
    <script>
       function iframeChange(src){
    	  var oIframe = document.getElementById("iframes");
    	  oIframe.src=src;
       }
    </script>
  </head>
  
   <%                                                                        //尝试获取session判断用户是否登录了
        String username ="null";
        try{
           username = session.getAttribute("username").toString();
        }catch(Exception e){
        	e.printStackTrace();
        }
    %>
    
  <body>
  
     <div id="head">
        <div id="login">
	        <div id="afterlogin">
	          <ul>
		         <li style="font-size:15px;color:red ;margin-left:4px;"><%=username %>欢迎您|</li>
		         <!-- <li><a href="index.jsp" style="font-size:15px;">注销</a>|</li> --> 
		         <li><a href="homePage.jsp" onclick="bbb()"style="font-size:19px;">返回主页</a>|</li>
		         <li><a href="advice.jsp"style="font-size:19px;">信息反馈</a></li>
	          </ul>
	        </div>
        </div>
    </div>
    <div id ="content">
			<div class="btn-group" style="float:left;margin-left:100px">
			  <button type="button" class="btn btn-lg btn-info">我的订单</button>
			  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="caret"></span>
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <ul class="dropdown-menu">
			    <li><a href="javascript:void(0)" onclick="iframeChange('myRelease.jsp')">我发布的</a></li>
			    <li><a href="javascript:void(0)" onclick="iframeChange('myApplication.jsp')">我申请的</a></li>
			  </ul>
			</div>
			
			<div class="btn-group" style="margin:0 145px;">
			  <button type="button" class="btn btn-lg btn-info">个人信息</button>
			  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="caret"></span>
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <ul class="dropdown-menu">
			    <li><a href="javascript:void(0)" onclick="iframeChange('userInfo.jsp')">查看信息</a></li>
			    <li><a href="javascript:void(0)">我的好友</a></li>
			    <li role="separator" class="divider"></li>
			    <li><a href="javascript:void(0)">其他选项</a></li>
			  </ul>
			</div>
			
			<div class="btn-group"style="float:right;margin-right:100px">
			  <button type="button" class="btn btn-lg btn-info">消息列表</button>
			  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="caret"></span>
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <ul class="dropdown-menu">
			    <li><a href="javascript:void(0)" onclick="iframeChange('leftMessage.jsp')">离线消息</a></li>
			    <li><a href="javascript:void(0)">好友畅聊</a></li>
			    <li><a href="javascript:void(0)">Separated link</a></li>
			    <li role="separator" class="divider"></li>
			    <li><a href="javascript:void(0)">Separated link</a></li>
			  </ul>
			</div>
    </div>
    
    <div id="iframe">
       <iframe style="width:975px;height:500px;" id="iframes" src="myRelease.jsp" allowTransparency="true" scrolling="auto" frameborder="0">
       </iframe>
       
       <div id="beforeModify" style="display:block;width:975px;height:200px;">
                          
                                                                      这里可以投放各种广告！！！
              <!--   <div id="beforeModify" style="display:block; background:yellow;width:970px;height:150px;border-style:dotted;border-color:green;">
                     </div>
              -->
       </div>
    </div>
    
        <div id="below">
          <ul id="belowUl">
	        <li><a href="javascript:void(0)">关于我们</a>|</li>
	        <li><a href="javascript:void(0)">合作伙伴</a>|</li>
	        <li><a href="javascript:void(0)">路程估计</a>|</li>
	        <li><a href="javascript:void(0)">路费估计</a>|</li>
        </ul>
         |~~~2015-2020 &nbsp&nbsp&nbsp<a class="gray" href="javascript:void(0)">东大拼车</a>  
         <br>
         &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
         &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp       
         <a href="javascript:void(0)">某某某网</a>|<a href="javascript:void(0)">某某网</a>|<a href="javascript:void(0)">某某某网</a>
       <hr>
    </div>
  </body>
</html>
