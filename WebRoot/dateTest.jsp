<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dateTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
  window.onload = function(){
	     var reg_time=/^(d{1,4})-(d{1,2})-(d{1,2}) (d{1,2}):(d{1,2})$/;
		 var date=timeParse("2008-8-8 09:00",reg_time);
		 printLine(date);
		 var reg_timeSpan=/^(?:(d+)年)?(?:(d+)个?月)?(?:(d+)天)?(?:(d+)小时)?(?:(d+)分钟?)?$/;


		 var timeSpan=timeSpanParse("10分",reg_timeSpan);
		 date.addTime(timeSpan);
		 printLine("增加10分钟后:"+date);


		 timeSpan=timeSpanParse("3小时10分",reg_timeSpan);
		 date.addTime(timeSpan);
		 printLine("增加3小时10分后:"+date);


		 timeSpan=timeSpanParse("2天3小时10分",reg_timeSpan);
		 date.addTime(timeSpan);
		 printLine("增加2天1小时5分后:"+date);


		 timeSpan=timeSpanParse("1个月1天1小时1分",reg_timeSpan);
		 date.addTime(timeSpan);
		 printLine("增加1个月1天1小时1分后:"+date);

		timeSpan=timeSpanParse("2年1小时1分钟",reg_timeSpan);
		 date.addTime(timeSpan);
		 printLine("增加2年1小时1分钟后:"+date);
  };
  
  function printLine(s){
	     document.write(s,"<br />");
	 }
	 function timeParse(timeString,pattern){
	     var date=new Date();
	     var match=timeString.match(pattern);
	     date.setYear(parseInt(match[1],10));
	     date.setMonth(parseInt(match[2],10)-1);
	     date.setDate(parseInt(match[3],10));
	     date.setHours(parseInt(match[4],10));
	     date.setMinutes(parseInt(match[5],10));
	     date.setSeconds(0);
	     return date;
	 }
	 Date.prototype.addTime=function(timeSpan){
	     this.setYear(this.getYear()+timeSpan.years);
	     this.setMonth(this.getMonth()+timeSpan.months);
	     this.setDate(this.getDate()+timeSpan.days);
	     this.setHours(this.getHours()+timeSpan.hours);
	     this.setMinutes(this.getMinutes()+timeSpan.minutes);
	 }
	 Date.prototype.toString=function(){
	     return this.getYear()+"-"
	         +(this.getMonth()+1)+"-"
	         +this.getDate()+" "
	         +this.getHours()+":"
	         +this.getMinutes();
	 }
	 function timeSpanParse(timeSpanString,pattern){
	     var match=timeSpanString.match(pattern);
	     var y=match[1]==""?0:parseInt(match[1]);
	     var mon=match[2]==""?0:parseInt(match[2]);
	     var d=match[3]==""?0:parseInt(match[3]);
	     var h=match[4]==""?0:parseInt(match[4]);
	     var m=match[5]==""?0:parseInt(match[5]);
	     return {years:y,months:mon,days:d,hours:h,minutes:m};
	 }
	

  </script>  
  <body>
    This is my JSP page. <br>
  </body>
</html>
