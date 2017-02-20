<%@ page language="java" import="java.util.*,order.*,com.google.gson.Gson" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myRelease.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<script type="text/javascript"src="js/myjs.js"></script>
	<script type="text/javascript"src="js/GridEdit.js"></script>
	
	<script>
	function getX(){
	    return event.clientX; 
	}
	function getY(){
		return event.clientY;
	}
	 var oRow;
	 <%                                                                        //尝试获取session判断用户是否登录了
     String username ="null";
     try{
        username = session.getAttribute("username").toString();
     }catch(Exception e){
 	   e.printStackTrace();
 	   username = "null";
     }
   //  if(!username.equals("null")){                    //当获取到的username不为null的时候
        OrderManager om = new OrderManager();
        ArrayList<Order> releaseOrderlist = om.getReleaseOrderList(username);   //获取到我发布的订单的集合
        Gson gson = new Gson();
        String releaseOrderlistString = gson.toJson(releaseOrderlist);    //将java对象解析为json字符串      
   //   System.out.println(releaseOrderlistString);
   //  }
   %>
   
   
	window.onload = function(){
		var modifyDiv;
		var rowValue;                                                     //用来储存点击编辑按钮之前的数据----这儿有点小问题原则上只能一行一行的编辑
		var oJson = eval(<%=releaseOrderlistString%>);                    //用eval函数将上面获得的json字符串转换为json对象
		var oTable = document.getElementById("table");
 	//	addRow(oJson,oTable);                            //函数在myjs.js文件里面，将传入的json对象里面的信息显示到传入的table对象里面         
		                    
		 var oTr = null;                                 
	     var oTd = null;
	     for(var one in oJson){
	     	oTr = document.createElement("tr");
	     	for(var key in oJson[one]){
	     		oTd = document.createElement("td");
	     		oTd.innerHTML = oJson[one][key];
	     		oTr.appendChild(oTd);
	     	}
	     	//添加编辑按钮
	     	oTd = document.createElement("td");
	     	oTd.innerHTML = "<a href='javascript:void(0)'>编辑</a>";
	     	oTr.appendChild(oTd);
	     	oTd.getElementsByTagName('a')[0].onclick = function(){
	     	    rowValue = EditBefore(this.parentNode.parentNode);  //用来记住编辑之前的数据
	     		var editRow = this.parentNode.parentNode;
	     		for(var j=2;j<8; j++){                              //给单元格添加点击事件，发布者，订单id，目前人数不给添加
	     			 if(j==6) continue;
	     		     editRow.cells[j].onclick = function (){
	     		        EditCell(this);
	     		     };
	     		}
	     	};
	     	//添加确认修改按钮，保证前台显示与后台存储数据的一致性
	     	oTd = document.createElement("td");
	     	oTd.innerHTML = "<a href='javascript:void(0)'>确认_or_取消</a>";
	     	oTr.appendChild(oTd);
	     	oTd.getElementsByTagName('a')[0].onclick = function(){
	     		    oRow = this.parentNode.parentNode;
	     		if(window.confirm('你确定要修改么')){
	     			oRow = this.parentNode.parentNode;
                    var identify = 'orderid';
                    var value = oRow.childNodes[1].innerHTML;
                    var tablename = 'orderinfo';
                    var array='';
                    array+="username="+"'"+oRow.cells[0].innerHTML+"'";
                    array+=","+"orderid="+"'"+oRow.cells[1].innerHTML+"'";
                    array+=","+"date="+"'"+oRow.cells[2].innerHTML+"'";
                    array+=","+"cos="+"'"+oRow.cells[3].innerHTML+"'";
                    array+=","+"start="+"'"+oRow.cells[4].innerHTML+"'";
                    array+=","+"stop="+"'"+oRow.cells[5].innerHTML+"'";
                    array+=","+"number="+"'"+oRow.cells[6].innerHTML+"'";
                    array+=","+"state="+"'"+oRow.cells[7].innerHTML+"'";
	     			updateAjax(array,identify,value,tablename);
	     		}else{
//                    window.location.reload();       //如果问题没有解决的话就用重新刷新这个功能                                 可以用ajax局部刷新这一行就行了
					//                 ajax附带orderid请求servlet,重新赋值
					var orderid = this.parentNode.parentNode.cells[1].innerHTML;
					var oAjax;
					if(window.XMLHttpRequest){
					oAjax = new XMLHttpRequest();
					}else{
					oAjax = new ActiveXObject("Microsoft.XMLHTTP");
					}
					oAjax.open('GET','servlet/Refresh?orderid='+orderid+'&'+'t='+new Date().getTime(),true);    //get方式访问，添加一个时间戳去掉缓存，异步访问设为true
					oAjax.send();      //发送请求                                                                                                                                                                                                                    
					oAjax.onreadystatechange = function(){
						if(4==oAjax.readyState){
							if(200==oAjax.status){
//							   alert(oAjax.responseText);
							   var oOrderJson = eval('(' + oAjax.responseText + ')');
//							   alert(oOrderJson);
                               oRow.cells[2].innerHTML = oOrderJson['date'];
                               oRow.cells[3].innerHTML = oOrderJson['cos'];
                               oRow.cells[4].innerHTML = oOrderJson['start'];
                               oRow.cells[5].innerHTML = oOrderJson['stop'];
                               oRow.cells[7].innerHTML = oOrderJson['state'];
							}
						}  
					};
					
	     		}
	     	};	
	     	//添加删除按钮
	     	oTd = document.createElement("td");
	     	oTd.innerHTML = "<a href='javascript:void(0)'>删除</a>";
	     	oTr.appendChild(oTd);
	     	oTd.getElementsByTagName('a')[0].onclick = function(){                     // 删除
	     		if(window.confirm('确定删除这个订单么？')){
	     		   oTable.tBodies[0].removeChild(this.parentNode.parentNode);          //仅仅是在网页上删除了,下面通过Ajax在后台进行删除
	     		   var identify = 'orderid';        
	     		   var value = this.parentNode.parentNode.childNodes[1].innerHTML;
	     		   var tablename = 'orderinfo';
	     		   deleteAjax(identify,value,tablename);                               //delete from tablename where identify = value

	     		}
			};
			
			
			
			
			//添加查看按钮
			oTd = document.createElement("td");
	     	oTd.innerHTML = "<a href='javascript:void(0)'>查看</a>";
	     	oTr.appendChild(oTd);
	     	oTd.getElementsByTagName('a')[0].onclick = function(){                     // 查看
	     		
	     	    var frameId = window.frameElement.parentNode;                                     //这样居然可以获取父页面的iframe元素
//	     	    var modifyDiv = frameId.parentNode.childNodes[3];                      //获得这个Div
	     	    
//	     	    modifyDiv.innerHTML="";                                                //先置空这个div,下面为Div添加表头
//	     	    modifyDiv.style.background="white"; 
                if(modifyDiv)
                modifyDiv.parentNode.removeChild(modifyDiv);
                modifyDiv = document.createElement("div");                         //其实也可以尝试重新创建一个新的div，操作之后将它关闭就行
                frameId.appendChild(modifyDiv);
                modifyDiv.style.position = "absolute";
                modifyDiv.style.left=getX()+460;
                modifyDiv.style.top=getY()+160;
                
                
	     	    var oTable = document.createElement("table");
	     	    oTable.border="3";
	     	    var oThead = document.createElement("thead");
	     	    var oTr;
	     	    var oTd;
	     	    oTr = document.createElement("tr");
	     	    oTd = document.createElement("td");
	     	    oTr.appendChild(oTd);
	     	    oTd.innerHTML="订单id";
	     	    oTd = document.createElement("td");
	     	    oTr.appendChild(oTd);
	     	    oTd.innerHTML="目前人数";
	     	    oTd = document.createElement("td");
	     	    oTd.innerHTML="申请者";
	     	    oTr.appendChild(oTd);
	     	    oTd = document.createElement("td");
	     	    oTd.innerHTML="申请状态";
	     	    oTr.appendChild(oTd);
	     	    oTd = document.createElement("td");
	     	    oTd.innerHTML="操作";
	     	    oTr.appendChild(oTd);
	     	    oTd = document.createElement("td");
	     	    oTd.innerHTML="<a href='javascript:void(0)'>关闭</a>";
	     	    oTr.appendChild(oTd);
	     	    oTd.getElementsByTagName('a')[0].onclick = function(){
	     	    	this.parentNode.parentNode.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode.parentNode.parentNode);
	     	    };
	     	    
	     	    
	     	    oThead.appendChild(oTr);
	     	    oTable.appendChild(oThead);
	     	    modifyDiv.appendChild(oTable);
	     	    
	     	    var orderId = this.parentNode.parentNode.childNodes[1].innerHTML;
	     		var oAjax;
				if(window.XMLHttpRequest){
				oAjax = new XMLHttpRequest();
				}else{
				oAjax = new ActiveXObject("Microsoft.XMLHTTP");
				}
				oAjax.open('GET','servlet/AjaxView?orderid='+orderId+'&'+'t='+new Date().getTime(),true);    //get方式访问，添加一个时间戳去掉缓存，异步访问设为true
				oAjax.send();      //发送请求                                                                                                                                                                                                                    
				oAjax.onreadystatechange = function(){
					if(4==oAjax.readyState){
						if(200==oAjax.status){
						   var oAppMesJson = eval('(' + oAjax.responseText + ')');
                           for(one in oAppMesJson){
                        	   oTr = document.createElement("tr");
                        	   
                       		   oTd = document.createElement("td");           //orderid列
                       		   oTd.innerHTML = oAppMesJson[one].orderid;
                       		   oTr.appendChild(oTd);
                       		   oTd = document.createElement("td");           //number列
                    		   oTd.innerHTML = oAppMesJson[one].number;
                    		   oTr.appendChild(oTd);
                    		   oTd = document.createElement("td");
                    		   oTd.innerHTML = oAppMesJson[one].applicant;   //applicant列
                    		   oTr.appendChild(oTd);
                    		   
                    		   oTd = document.createElement("td");          //applicantstate列,同时把操作那一列给加进来
                    		   var state = oAppMesJson[one].applicant;
                    		   if(oAppMesJson[one].state==1){
                    			 oTd.innerHTML = "已同意"; 
                    			 oTr.appendChild(oTd);
                    			 oTd = document.createElement("td");
                    			 oTd.innerHTML = "<a href='javascript:void(0)'>取消同意</a>";
                    			 oTr.appendChild(oTd);
                    			 oTd.getElementsByTagName('a')[0].onclick = function(){
                    			//     id=this.parentNode.parentNode.childNodes[0].innerHTML  applicant=this.parentNode.parentNode.childNodes[2].innerHTML
                    			     var username = this.parentNode.parentNode.childNodes[2].innerHTML;
                    			     var id = this.parentNode.parentNode.childNodes[0].innerHTML;
                    				 if(window.confirm("此操作会对他人的行程造成不良影响，而且会降低你的信誉额度，确认进行此操作么？")){
                    					changeAppAjax(username,'11',id);
//                    					setTimeout(function(){                                               
//                      			     	window.location.reload();
//                      			     	},100);
                    				 }else{
                    					 
                    				 }
                    			 };
                    		   }else if(oAppMesJson[one].state==20){
                    			 oTd.innerHTML = "待你确认";
                    			 oTr.appendChild(oTd);
                    			 oTd = document.createElement("td");
                    			 oTd.innerHTML = "<a href='javascript:void(0)'>同意订单</a>";
                    			 oTr.appendChild(oTd);
                    			 oTd.getElementsByTagName('a')[0].onclick = function(){
                    				 var username = this.parentNode.parentNode.childNodes[2].innerHTML;
                    			     var id = this.parentNode.parentNode.childNodes[0].innerHTML;
                    				 if(window.confirm("同意点确认，拒绝点取消！")){
                    					changeAppAjax(username,'1',id);
//                  		     			setTimeout(function(){                                               
//                  			     		window.location.reload();
//                  			     		},100);
                    				 }else{
                    					changeAppAjax(username,'0',id);
                   		     			setTimeout(function(){                                               
                   			     		window.location.reload();
                   			     		},100);
                    				 }
                    			 };
                    		   }else if(oAppMesJson[one].state==0){
                    			 oTd.innerHTML = "已拒绝";
                    			 oTr.appendChild(oTd);
                    			 oTd = document.createElement("td");
                    			 oTd.innerHTML = "<a href='javascript:void(0)'>发出邀请</a>";
                    			 oTr.appendChild(oTd);
                    			 oTd.getElementsByTagName('a')[0].onclick = function(){
                    				 var username = this.parentNode.parentNode.childNodes[2].innerHTML;
                    			     var id = this.parentNode.parentNode.childNodes[0].innerHTML;
                    				 if(window.confirm("确定对该用户发出再次邀请么？")){
                    					changeAppAjax(username,'21',id);
//                    					modifyDiv.parentNode.removeChild(modifyDiv);
//                    					setTimeout(function(){                                               
//                       			        window.location.reload();
//                       			     	},100);
                    				 }
                    			 };
                    		   }else if(oAppMesJson[one].state==21){
                    			 oTd.innerHTML = "等待对方确认";
                      			 oTr.appendChild(oTd);
                      			 oTd = document.createElement("td");
                      			 oTd.innerHTML = "<a href='javascript:void(0)'>取消邀请</a>";
                      			 oTr.appendChild(oTd);
                      			 oTd.getElementsByTagName('a')[0].onclick = function(){
                      				var username = this.parentNode.parentNode.childNodes[2].innerHTML;
                   			        var id = this.parentNode.parentNode.childNodes[0].innerHTML;
                      				if(window.confirm("确定取消对该用户的邀请么？")){
                      					changeAppAjax(username,'0',id);
//                   		     			setTimeout(function(){                                                                          
//                  			     		window.location.reload();
//                   			     		},100); 
                      				}
                      			 };
                    		   }
                    		  
                    		   
                    		   
                        	   oTable.appendChild(oTr);
                        	   
                           }
						}
					}  
				};
	     	    
	     	    
	     	    
	     	    
		    
	     	    
			};
			
			
			
     	    oTable.tBodies[0].appendChild(oTr);
         }
 
	};
	
	</script>

  </head>
    
  <body>
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
		           <th scope="col" abbr="Deluxe">修改</th>
		           <th scope="col" abbr="Deluxe">确定修改</th>
		           <th scope="col" abbr="Deluxe">删除</th>
		           <th scope="col" abbr="Deluxe">查看</th>
		           
	             </tr>
	          </thead>
	          
	          <tbody>
	            
	          </tbody> 
	           
	      </table>
      </div>
  
  </body>
  
  
  
  
  
  
  
  
  
</html>
