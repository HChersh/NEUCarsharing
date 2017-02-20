<%@ page language="java" import="java.util.*,order.*,com.google.gson.Gson" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myApplication.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<script type="text/javascript"src="js/myjs.js"></script>

  </head>
  <%
     
  %>
  <script>
	 var oRow;
	 <%                                                                        //尝试获取session判断用户是否登录了
       String username ="null";
       try{
           username = session.getAttribute("username").toString();
       }catch(Exception e){
	       e.printStackTrace();
	       username = "null";
       }
       OrderManager om = new OrderManager();
       ArrayList<ApplicationOrder> applicationOrderlist = om.getApplicationOrderList(username);  //获取到我申请的订单的信息
       Gson gson = new Gson();
       String applicationOrderlistString = gson.toJson(applicationOrderlist);                    //将java对象解析为json字符串     
       
     %>
  
     window.onload = function(){
    	var username =  '<%=username%>';
    	var oTable = document.getElementById("table");
    	var oTr = null;
    	var oTd = null;
    	var oJson = eval(<%=applicationOrderlistString%>);                                       //json字符串解析为json对象
    	var oRow;
        for(one in oJson){
    	   oTr = document.createElement("tr");
	          for(key in oJson[one].order){
	    		 oTd = document.createElement("td");
	    		 oTd.innerHTML = oJson[one].order[key];
	    		 oTr.appendChild(oTd);
	          }
	       var applicantstate = judgeNumber(oJson[one].applicantstate); 
	       oTd.innerHTML = applicantstate;                                                     //用订单申请的状态信息applicantstate覆盖order中的orderstate
	       oTd = document.createElement("td");
	       
	       if(oJson[one].applicantstate == 20){
		     	oTd.innerHTML = "<a href='javascript:void(0)'>取消申请</a>";
		     	oTd.getElementsByTagName('a')[0].onclick = function(){
		     		oRow = this.parentNode.parentNode;
		     		if(window.confirm('你确定要取消申请么?')){
		     			changeAppAjax(username,'0',oRow.childNodes[1].innerHTML);
		     			setTimeout(function(){                                                //设置一个定时器，以免直接刷新没了提示成功信息
		     			window.location.reload();
		     			},100);
		     		}
		     	};
		     	
                
	       }else if(oJson[one].applicantstate == 1){
	    	   oTd.innerHTML = "<a href='javascript:void(0)'>退出申请</a>";
	    	   oTd.getElementsByTagName('a')[0].onclick = function(){
		     		oRow = this.parentNode.parentNode;
		     		if(window.confirm('发布者已经同意，你的操作会给其他人行程带来不便，并且会对你的信誉造成影响，确认要取消么')){
		     			changeAppAjax(username,'11',oRow.childNodes[1].innerHTML);
		     			setTimeout(function(){                                               
			     		window.location.reload();
			     		},100);
		     		}
		     	};
		     	
	       }else if(oJson[one].applicantstate == 0){
	    	   oTd.innerHTML = "<a href='javascript:void(0)'>再次申请</a>";
	    	   oTd.getElementsByTagName('a')[0].onclick = function(){
		     		oRow = this.parentNode.parentNode;
		     		if(window.confirm('你确定要再次申请么？')){
		     			changeAppAjax(username,'20',oRow.childNodes[1].innerHTML);
		     			setTimeout(function(){                                               
			     		window.location.reload();
			     		},100);
		     		}
		     	};
	       }else if(oJson[one].applicantstate == 21){
	    	   oTd.innerHTML = "<a href='javascript:void(0)'>接收/拒绝</a>";
	    	   oTd.getElementsByTagName('a')[0].onclick = function(){
		     		oRow = this.parentNode.parentNode;
		     		if(window.confirm('接收对方邀请点确认，拒绝对方邀请点取消！')){
		     			changeAppAjax(username,'1',oRow.childNodes[1].innerHTML);
		     			setTimeout(function(){                                               
			     		window.location.reload();
			     		},100);
		     		}else{
		     			changeAppAjax(username,'0',oRow.childNodes[1].innerHTML);
		     			setTimeout(function(){                                               
			     		window.location.reload();
			     		},100);
		     		}
		     	}; 
	       }
	       oTr.appendChild(oTd);	
	       
	       
           oTable.tBodies[0].appendChild(oTr);                                                 //最后将这一行添加到这个table里面
        }
     };
     
     function judgeNumber(num){                                                                 //该num所处的行，判断状态
    	 if(num == 20){
    		 return '等待对方确认';
    	 }
         if(num == 21){
        	 return '对方正在邀请';
         }
    	 if(num == 1){
    		 return '申请成功';
    	 }
         if(num == 0){
        	 return '申请失败';
         }
     }
     
     function judgeOperation(num){                                                              //根据订单当前的状态判断操作按钮
    	 if(num == 2){
    		 return '取消申请';
    	 }
    	 if(num == 1){
    		 return '退出申请';
    	 }
         if(num == 0){
        	 return '再次申请';
         }
     }
  </script>
  <body>
  <!--<%=applicationOrderlistString%>--> 
     <div style="width:600px;height:480px;margin:0 auto;border:#ccc solid 1px;">
	      <table class="table" id="table">
	          <thead>
	             <tr>
	               <th scope="col" abbr="Starter">发布者</th>
	               <th scope="col" abbr="Medium">订单id</th>
	               <th scope="col" abbr="Business">日期</th>
	               <th scope="col" abbr="Deluxe">费用</th>
		           <th scope="col" abbr="Deluxe">出发地</th>
		           <th scope="col" abbr="Deluxe">目的地</th>
		           <th scope="col" abbr="Deluxe">目前人数</th>
		           <th scope="col" abbr="Deluxe">状态</th>
		           <th scope="col" abbr="Deluxe">操作</th>
	             </tr>
	          </thead>
	          
	          <tbody>
	          </tbody> 
	      </table>
      </div>
  </body>
</html>
