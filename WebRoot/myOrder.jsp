<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myOrder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style>
    .outDiv{
     width:600px;
     height:360px;
     background:black;
     border:5px dotted black;
     background:url("images/beijing3.jpg");
    }
    .table1{
	    font-family: "Trebuchet MS", sans-serif;
	    font-size:12px;
	    font-weight: bold;
	    line-height: 1.0em;
	    font-style: normal;
	    border-collapse:separate;
	    margin:3px 0;
	    }
	    .table1 thead th{
	    padding:15px;
	    color:#fff;
	    text-shadow:1px 1px 1px #568F23;
	    border:1px solid #93CE37;
	    border-bottom:3px solid #9ED929;
	    background-color:#9DD929;
	    background:-webkit-gradient(
	        linear,
	        left bottom,
	        left top,
	        color-stop(0.02, rgb(123,192,67)),
	        color-stop(0.51, rgb(139,198,66)),
	        color-stop(0.87, rgb(158,217,41))
	        );
	    background: -moz-linear-gradient(
	        center bottom,
	        rgb(123,192,67) 2%,
	        rgb(139,198,66) 51%,
	        rgb(158,217,41) 87%
	        );
	    -webkit-border-top-left-radius:5px;
	    -webkit-border-top-right-radius:5px;
	    -moz-border-radius:5px 5px 0px 0px;
	    border-top-left-radius:5px;
	    border-top-right-radius:5px;
	   }
	   .table1 thead th:empty{
	    background:transparent;
	    border:none;
	   }
	    .table1 tbody th{
	    color:#fff;
	    text-shadow:1px 1px 1px #568F23;
	    background-color:#9DD929;
	    border:1px solid #93CE37;
	    border-right:3px solid #9ED929;
	    padding:0px 10px;
	    background:-webkit-gradient(
	        linear,
	        left bottom,
	        right top,
	        color-stop(0.02, rgb(158,217,41)),
	        color-stop(0.51, rgb(139,198,66)),
	        color-stop(0.87, rgb(123,192,67))
	        );
	    background: -moz-linear-gradient(
	        left bottom,
	        rgb(158,217,41) 2%,
	        rgb(139,198,66) 51%,
	        rgb(123,192,67) 87%
	        );
	    -moz-border-radius:5px 0px 0px 5px;
	    -webkit-border-top-left-radius:5px;
	    -webkit-border-bottom-left-radius:5px;
	    border-top-left-radius:5px;
	    border-bottom-left-radius:5px;
	    }
	    .table1 tfoot td{
	    color: #9CD009;
	    font-size:32px;
	    text-align:center;		
	    padding:10px 0px;
	    text-shadow:1px 1px 1px #444;
	    }
	    .table1 tfoot th{
	    color:#666;
	    }
	    .table1 tbody td{
	    padding:10px;
	    text-align:center;
	    background-color:#DEF3CA;
	    border: 2px solid #E7EFE0;
	    -moz-border-radius:2px;
	    -webkit-border-radius:2px;
	    border-radius:2px;
	    color:#666;
	    text-shadow:1px 1px 1px #fff;
	    }
	    .table1 tbody span.check::before{
	    content : url(../images/check0.png)
	    }
    
    </style>
    
    <script type="text/javascript">
    
    </script>
  </head>
  
  <body>
      <div id="outDiv">
         <div id="xiayou">
		         <table class="table1">
	                <thead>
	                    <tr>
	                        <th></th>
	                        <th scope="col" abbr="Starter">出发日期</th>
	                        <th scope="col" abbr="Medium">费用</th>
	                        <th scope="col" abbr="Business">出发地</th>
	                        <th scope="col" abbr="Deluxe">目的地</th>
							<th scope="col" abbr="Deluxe">目前人数</th>
							<th scope="col" abbr="Deluxe">目前状态</th>
	                    </tr>
	                </thead>
	                <tbody>
	                   
	                    <tr>
	                        <th scope="row">订单1</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>奥体中心</td>
	                        <td>3</td>
							<td><a href="javascript:void(0)">等待评价</a></td>
	                    </tr>
	                    <tr>
	                        <th scope="row">订单2</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>白塔铺</td>
	                        <td>4</td>
							<td><a href="javascript:void(0)">确认订单</a></td>
	                    </tr>
	                    <tr>
	                       <th scope="row">订单3</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>南湖校区</td>
	                        <td>3</td>
							<td><a href="javascript:void(0)">等待同意</a></td>
	                    </tr>
	                     <tr>
	                        <th scope="row">订单4</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>奥体中心</td>
	                        <td>3</td>
							<td><a href="javascript:void(0)">等待评价</a></td>
	                    </tr>
	                    <tr>
	                        <th scope="row">订单5</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>白塔铺</td>
	                        <td>4</td>
							<td><a href="javascript:void(0)">放弃订单</a></td>
	                    </tr>
	                    <tr>
	                       <th scope="row">订单6</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>南湖校区</td>
	                        <td>3</td>
							<td><a href="javascript:void(0)">等待同意</a></td>
	                    </tr>
	                     <tr>
	                        <th scope="row">订单7</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>奥体中心</td>
	                        <td>3</td>
							<td><a href="javascript:void(0)">确认订单</a></td>
	                    </tr>
	                    <tr>
	                        <th scope="row">订单8</th>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>白塔铺</td>
	                        <td>4</td>
							<td><a href="javascript:void(0)">放弃订单</a></td>
	                    </tr>
	                     
	                </tbody>
	            </table>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	
	             <!-- <div id="shangPage"><a href="javascript:void(0)">上一页</a></div>
	             <div id="xiaPage"><a href="javascript:void(0)">下一页</a></div> -->
	        </div>
	    </div><hr> 
    </div>
	   
	     
    </div>
  </body>
</html>
