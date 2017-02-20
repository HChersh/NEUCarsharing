<%@page import="user.UserManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>registerResult</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
     <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String email = request.getParameter("email");
        String tell = request.getParameter("tell");
        String registerResult = new UserManager().judgeRegister(username, password, repassword, email, tell);
        if(registerResult.startsWith("用户名")||registerResult.startsWith("请输入正确")||registerResult.startsWith("两次密码")){
            out.println("<html><body><h2>" + registerResult + "</h2></body></html>");	
            out.println("3秒后跳转到登录界面，请重新尝试注册");
       	    response.setHeader("refresh" , "3; url=/jspclass/register.html");
        }if(registerResult.startsWith("注册成功")){
        	out.println("<html><body><h2>" + registerResult + "</h2></body></html>");	
            out.println("2秒后跳转到登录界面，请登录");
       	    response.setHeader("refresh" , "2; url=/jspclass/login.html");
        }
       
     %>
  </body>
</html>
