<%@page import="user.UserManager,com.mysql.jdbc.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>loginResult</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  <%
     String username = request.getParameter("username");
     String password = request.getParameter("password");
     String loginResult = new UserManager().judgeLogin(username, password);
     if(loginResult.startsWith("用户名")){
    	 out.println("<html><body><h1>" + loginResult + "<h1></body></html>");
    	 out.println("2秒后跳转到登录页面");
    	 response.setHeader("refresh" , "2; url=/jspclass/login.html");
	     out.flush();
     }else if(loginResult.startsWith("登录成功")){            //这里应该进行session的设置，表示已经登录成功了，后面处理
    	 session.setAttribute("username", username);
        // out.println(session.getAttribute("username")+"登陆成功");
    	 out.print("<html><body><h1>" + loginResult + "<h1></body></html>");
    	 out.println("2秒后跳转到主页面");
    	 response.setHeader("refresh" , "2; url=/jspclass/homePage.jsp");
     }else{
    	 out.print("<html><body><h1>" + loginResult + "<h1></body></html>");
    	 out.println("2秒后跳转到登录页面");
    	 response.setHeader("refresh" , "2; url=/jspclass/login.html");
	     out.flush();
     }
     
  %>
    
  </body>
</html>
