<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/mycss.css"> 
	<script type="text/javascript"src="js/jquery.min.js"></script>
	<script type="text/javascript"src="js/bootstrap.min.js"></script>
	<script type="text/javascript"src="js/myjs.js"></script>
    
  </head>
  <style>
      #xiayou{width:625px;height:550px;float:left;padding:1px 7px;background:rgb(245,243,240);}
  </style>
  <script>
       window.onload = function(){
    	   getLimitOrderAjax(16,1);              
//    	  var oTable = document.getElementById("table");
//    	  var tbody=oTable.getElementsByTagName("tbody")[0];
//    	  var tr = tbody.getElementsByTagName("tr");
//    	  var td;
//    	  for(var i = 0 ; i < tr.length; i++){
//    		  td = tr[i].getElementsByTagName("td");
//    		  for(var j  = 0 ; j < td.length-1;j++){
//    			  alert(td[j].innerHTML);
//    		  }
//    	  }
       };
       function aa(){
    	   var m = 15;
           var n = 1;
			 var oAjax;
			 if(window.XMLHttpRequest){
				oAjax = new XMLHttpRequest();
			 }else{
				oAjax = new ActiveXObjext("Microsoft.XMLHTTP");
			 }
			 oAjax.open('GET','servlet/GetOrderinfo?m='+m+'&'+"n="+n,true);
			 oAjax.send();
			 oAjax.onreadystatechange = function(){
				 if(4==oAjax.readyState){
					 if(200==oAjax.status){
						 var txt = oAjax.responseText;
						 alert(txt);
						
					 }
				 }
			 };
       }
  </script>
  <body>
 <div id='xiayou'>
   <table class="table" id="table">
	                <thead>
	                    <tr>
	                        <th scope="col" abbr="Starter">发布者</th>
	                        <th scope="col" abbr="Starter">出发日期</th>
	                        <th scope="col" abbr="Medium">费用</th>
	                        <th scope="col" abbr="Business">出发地</th>
	                        <th scope="col" abbr="Deluxe">目的地</th>
							<th scope="col" abbr="Deluxe">目前人数</th>
							<th scope="col" abbr="Deluxe">操作</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>fuck</td>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>白塔铺</td>
	                        <td>1</td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                    <tr>
	                        <td>cherish</td>
	                        <td>2016-02-12 15:35</td>
							<td>在线交谈</td>
	                        <td>浑南校区</td>
	                        <td>沈阳音乐学院</td>
	                        <td>1</td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                   
	                     
	                </tbody>
	            </table>
	            
	            
	            <nav>
				  <ul class="pagination" style="float:right">
				    <li>
				      <a href="javascript:void(0)" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="javascript:void(0)">1</a></li>
				    <li><a href="javascript:void(0)">2</a></li>
				    <li><a href="javascript:void(0)">3</a></li>
				    <li><a href="javascript:void(0)">4</a></li>
				    <li><a href="javascript:void(0)">5</a></li>
				    <li>
				      <a href="javascript:void(0)" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
               </nav>
 </div>
  </body>
</html>
