<%@ page language="java" import="java.util.*,order.*,com.google.gson.Gson" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>NEUCarSharing</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
	
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<script type="text/javascript"src="js/myjs.js"></script>
	

 	<style>
		*{margin:0;padding:0;}
	    body{background:url("images/beijing4.jpg");FONT-SIZE:20px;FONT-FAMILY: "宋体", arial}
	    #head,#shang,#content,#below{width:990px;height:130px;margin:0 auto;}
	    #head{width:980px;height:120px;padding:5px 5px;background:url("images/1234.jpg");}
	    #shang{height:350px;}
	    #content{height:880px;}
	    #below{height:80px;font-size:15px;}
	    #below a{color:gray;}
	    #login{width:280px;height:30px;float:right;}
	    #fastlogin{width:180px;height:50px;
	                 position:relative;left:788px;top:28px;
	              }
	    #fastorder{width:180px;height:50px;
	               position:relative;left:793px;top:-53px;
	    }
	    #zhong{width:970px;height:34px;padding:14px 10px;background:rgb(245,243,240);}
	    #xiazuo{width:351px;height:485px;float:left;}
	    #xiayou{width:625px;height:550px;float:left;padding:1px 7px;background:rgb(245,243,240);}
	    #beforelogin ul li{list-style:none;float:left;}
	    #afterlogin ul li{list-style:none;float:left;}
	    .btn30{ width:140px;
				height:41px;
				line-height:18px;
				font-size:22px;
				color:#ff6000;
				background:url("images/bg30.jpg") no-repeat left top;
				padding-bottom:4px;}
		.txt{   width:130px;
				height:25px;
				line-height:18px;
				font-size:15px;
				color:#ff6000;
		}
		
	    #shang{background:url("images/121.jpg");}
	    #shangshang{
	    width:990px;height:55px;
	    text-align:center;line-height:55px;
	    }
	    #shangzhong{
	    width:990px;height:200px;
	    }
	    #nav{
	    width:990px;height:275px;
	    }
	    #nav{
	    width:505px;height:38px;margin:15px auto;
	    background:-webkit-linear-gradient(rgba(40,40,40,0.55) 0%,rgba(54,54,54,0.55) 49%,rgba(24,24,24,0.8) 51%);
	    border-radius:5px;
	    box-shadow:0 0 34px #fff;
	    }
	    #nav ul li{
	    list-style-type:none;float:left;
	    width:125px;height:38px;border-right:1px solid #000;text-align:center;line-height:38px;
	    }
	    #one{border-radius:5px 0 5 0px;}
	    #four{border:none;border-radius:0 5px 5px 0;}
	    #nav ul li span{
	    color:white; font-size:15px; text-decoration:none;
		font-family:"微软雅黑";
	    }

	    #nav ul li:hover{background:rgba(54,54,54,0.8)}
	    #start{height:0;overflow:hidden; transition:0.5s;}
		#start li{border:none;background:rgba(10,5,5,0.45);}
		#start li:hover{background:rgba(10,5,5,0.7);}
		#nav ul li:hover #start{height:152px;}
		
		#shangxia{
		 width:990px;height:60px;text-align:center;line-height:60px;color:red;
		}
		#shangPage{
		 width:60px;height:22px;float:right;margin:2px 25px;background:rgb(243,227,152);
		}
		#xiaPage{
		 width:60px;height:22px;float:right;margin:2px auto;background:rgb(243,227,152);
		}
		#belowUl li{list-style:none;float:right;
		}
		
	</style>

     <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
      <%                                                                        //尝试获取session判断用户是否登录了
        String username ="null";
        //session.setAttribute("username", "null");
        //session.setAttribute("username", "victor");
        // session.setAttribute("username", "cherish");
        try{
           username = session.getAttribute("username").toString();
        }catch(Exception e){
    	   e.printStackTrace();
    	   username = "null";
        }
        
	      OrderManager om = new OrderManager();
	      ArrayList<Order> Orderlist = om.getHomePageOrderlist("0","9");   //获取到我发布的订单的集合
	      Gson gson = new Gson();
	      String OrderlistString = gson.toJson(Orderlist); 
//	      System.out.println(OrderlistString);
	      
      %>
     <script>
     /*  function aaa(){
   	      window.open("index.jsp","","width=365,height=400");
       }
       function bbb(){
    	   window.open("myOrder.jsp","","width=600,height=420");
       }*/
       function beforeLogin(){                                                 //登录之前的操作    
    	   var beforelogin = document.getElementById("beforelogin");
    	   var afterlogin = document.getElementById("afterlogin");
    	   beforelogin.style.display = "block";
    	   afterlogin.style.display = "none";
       } 
       function afterLogin(){                                                  //登录之后的操作
    	   var beforelogin = document.getElementById("beforelogin");
    	   var afterlogin = document.getElementById("afterlogin");
    	   beforelogin.style.display = "none";
    	   afterlogin.style.display = "block";
       }
       function fix(num, length) {                                            //将时间转化为两位
     	  return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
       } 
       function getDate(){// 获取到当前的日期
       	  var date = new Date(); 
          var result = date.getFullYear()+'-'+fix((date.getMonth()+1),2)+'-'+fix(date.getDate(),2)+' '+
          fix(date.getHours(),2)+':'+fix(date.getMinutes(),2);
       	  return result;
       }
       
       
       window.onload = function(){
    	  var username =  '<%=username %>';
    	  if(username=="null"){
    		  beforeLogin();
    	  }else{
    		  afterLogin();
    	  }
    	  var oJson = eval(<%=OrderlistString%>);
    	  var oTbody = document.getElementById("tbody");
    	  var tr = oTbody.getElementsByTagName("tr");
          var oTr;
          for(var i = 0 ; i < oJson.length ; i++){
         	 oTr = tr[i];
        	 var oTd = oTr.getElementsByTagName("td");
        	 var username = oJson[i].username;
        	 oTd[0].innerHTML = oJson[i].username;
        	 oTd[0].onclick = function(){
        		 window.open("chatroom.jsp?from="+'<%=username%>'+"&to="+this.innerHTML,"newwindow","width:50,height:50");
        	};
        	oTd[1].innerHTML = oJson[i].orderid;
        	oTd[2].innerHTML = oJson[i].date;
        	oTd[3].innerHTML = oJson[i].cos;
        	oTd[4].innerHTML = oJson[i].start;
        	oTd[5].innerHTML = oJson[i].stop;
        	oTd[6].innerHTML = oJson[i].number;
        	oTd[7].innerHTML = "<a href='javascript:void(0)'>申请加入</a>";
        	//alert(orderid);
        	oTr.getElementsByTagName('a')[0].onclick = function(){
              var orderid = this.parentNode.parentNode.childNodes[3].innerHTML;
        	  join(orderid,username);
        	};
         }
    	  
//    	  getLimitOrderAjax(1,1);
    	  //alert(username);
//导航栏添加点击事件
    	  var faststartul = document.getElementsByTagName("ul")[3];
    	  var faststopul = document.getElementsByTagName("ul")[4];
    	  var fastdateul = document.getElementsByTagName("ul")[5];
          var fastcosul = document.getElementsByTagName("ul")[6];
    	  faststartul.childNodes[1].onclick=function(){document.getElementById("faststart").value = faststartul.childNodes[1].childNodes[0].innerHTML;};
    	  faststartul.childNodes[3].onclick=function(){document.getElementById("faststart").value = faststartul.childNodes[3].childNodes[0].innerHTML;};
    	  faststartul.childNodes[5].onclick=function(){document.getElementById("faststart").value = faststartul.childNodes[5].childNodes[0].innerHTML;};
    	  faststartul.childNodes[7].onclick=function(){document.getElementById("faststart").value = faststartul.childNodes[7].childNodes[0].innerHTML;};
    	  faststopul.childNodes[1].onclick=function(){document.getElementById("faststop").value = faststopul.childNodes[1].childNodes[0].innerHTML;};
    	  faststopul.childNodes[3].onclick=function(){document.getElementById("faststop").value = faststopul.childNodes[3].childNodes[0].innerHTML;};
    	  faststopul.childNodes[5].onclick=function(){document.getElementById("faststop").value = faststopul.childNodes[5].childNodes[0].innerHTML;};
    	  faststopul.childNodes[7].onclick=function(){document.getElementById("faststop").value = faststopul.childNodes[7].childNodes[0].innerHTML;};
    	  fastdateul.childNodes[1].onclick=function(){document.getElementById("fastdate").value = getDate();};
    	  fastdateul.childNodes[3].onclick=function(){document.getElementById("fastdate").value = getDate();};
    	  fastdateul.childNodes[5].onclick=function(){document.getElementById("fastdate").value = getDate();};
    	  fastdateul.childNodes[7].onclick=function(){document.getElementById("fastdate").value = getDate();};
    	  fastcosul.childNodes[1].onclick = function(){document.getElementById("fastcos").value = fastcosul.childNodes[1].childNodes[0].innerHTML;};
    	  fastcosul.childNodes[3].onclick = function(){document.getElementById("fastcos").value = fastcosul.childNodes[3].childNodes[0].innerHTML;};
    	  fastcosul.childNodes[5].onclick = function(){document.getElementById("fastcos").value = fastcosul.childNodes[5].childNodes[0].innerHTML;};
    	  fastcosul.childNodes[7].onclick = function(){document.getElementById("fastcos").value = fastcosul.childNodes[7].childNodes[0].innerHTML;};

//getLimitOrderAjax(m,n)获取订单消息
       
          
       };
       
       function getLimitOrderAjax(m,n){
    		 var oAjax;
    		 var txt;
    		 if(window.XMLHttpRequest){
    			oAjax = new XMLHttpRequest();
    		 }else{
    			oAjax = new ActiveXObjext("Microsoft.XMLHTTP");
    		 }
    		 oAjax.open('GET','servlet/GetOrderinfo?m='+m+'&'+"n="+n+'&'+'t='+new Date().getTime(),true);
    		 oAjax.send();
    		 oAjax.onreadystatechange = function(){
    			 if(4==oAjax.readyState){
    				 if(200==oAjax.status){
    					 txt = oAjax.responseText;
    					 alert(txt);
    				 }
    			 }
    		 };
    	}
     </script>
     
  </head>
   
  <body>
    <div id="head">头部
        <div id="login">
        
           <div id="beforelogin" style="display:block;" >
	          <ul>
		         <li><a href="login.html">登录</a>|</li>
		         <li><a href="register.html">注册</a>|</li>
		         <li><a href="javascript:void(0)" onclick="bbb()">新手指南</a>|</li>
		         <li><a href="javascript:void(0)">信息反馈</a></li>
	          </ul>
	        </div>
	        <div id="afterlogin" style="display:none;" >
	          <ul>
		         <li style="font-size:15px;color:red "><%=username %>欢迎您|</li>
		        <!-- <li><a href="index.jsp" style="font-size:15px;">注销</a>|</li> --> 
		         <li><a href="userPage.jsp" onclick="bbb()"style="font-size:20px;">个人主页</a>|</li>
		         <li><a href="advice.jsp"style="font-size:20px;">信息反馈</a></li>
	          </ul>
	        </div>
	        
        </div>
    
        <div id="fastlogin"> <input type="button" class="btn30" value="快速登录" /></div>
    </div>
    
    
    
    <div id="content">
             <!-- 这一板块根据数据库获得的数据来判断推荐哪几个地方 -->
	    <div id="shang">
	      <div id="shangshang">
	         <form action="servlet/FastRelease" method="post">
		          <b>出发地</b>:<input type="text" class="txt" id="faststart" name = "start">
	              <b>目的地</b>:<input type="text" class="txt" id="faststop" name = "stop">
	              <b>出发时间</b>:<input type="text" class="txt" id="fastdate" name = "date">
	              <b>费用分成</b>:<input type="text" class="txt" id="fastcos" name = "cos">
	              <input style="display:none" type="text" class="txt" id="fastname" name="username" value='<%=username%>'>
	              
              </form>
	      </div>
	      <div id="shangzhong">
		      <div id="nav"><!--利用下拉导航点击来快速获得下单信息-->
		        <ul>
		           <li id="one"><span>出发地</span>
			              <ul id = "start">
							  <li><span>白塔铺</span></li>
							  <li><span>浑南校区</span></li>
							  <li><span>南湖校区</span></li>
							  <li><span>沈阳南站</span></li>
					      </ul>
		            </li>
		           
		           
		           <li id="two"><span>目的地</span>
			              <ul id = "start">
							  <li><span>白塔铺</span></li>
							  <li><span>浑南校区</span></li>
							  <li><span>南湖校区</span></li>
							  <li><span>沈阳南站</span></li>
					      </ul>
		           </li>
		           
		           
		           <li id="three"><span>出发时间</span>
			              <ul id = "start">
							  <li><span>十分钟后</span></li>
							  <li><span>十五分钟后</span></li>
							  <li><span>半小时后</span></li>
							  <li><span>一小时后</span></li>
					      </ul>
			           </li>
		           
		           
		           <li id="four"><span>费用预算</span>
			              <ul id = "start">
							  <li><span>在线交谈</span></li>
							  <li><span>五五开分</span></li>
							  <li><span>见面再议</span></li>
							  <li><span>八二开分</span></li>
					      </ul>
		           </li>
		           
		           
		        </ul>
		      </div>
		      <div id="fastorder" onclick="releasOrder()"> <input type="button" class="btn30" value="快速发布" /></div>
		      
	      </div>
	      
	      <div id="shangxia">  <!--用来获取热门地点告诉用户-->
	                      热门出发：<a href="javascript:void(0)">东大浑南校区</a>&nbsp<a href="javascript:void(0)">白塔铺</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	                      热门到达：<a href="javascript:void(0)">白塔铺</a>&nbsp<a href="javascript:void(0)">东大南湖校区</a>&nbsp&nbsp<br>
	                              
	      </div>
        </div>
	    
	    
	    <div id="zhong">
		        <form action="" method="post">
                       <b>出发地</b>:<input type="text" class="txt" name = "start">&nbsp&nbsp&nbsp&nbsp
                       <b>目的地</b>:<input type="text" class="txt" name = "stop">&nbsp&nbsp&nbsp&nbsp
                       <b>出发日期</b>:<input style="width=220px;" type="date" class="txt" name = "date" >
		       <!--   <button id="imgBt"><img src="images/date.gif"/></button> --> 
		          &nbsp&nbsp
		          <button id="imgBt2"><img src="images/search.jpg"/></button>
		        </form>
	    </div>
	    <div id="xia">
	    
	        <div id="xiazuo">
	           <div style="width:347px;height:550px;border:#ccc solid 1px;font-size:12px" id="map"></div> 
				    <script type="text/javascript">
					    //创建和初始化地图函数：
					    function initMap(){
					      createMap();//创建地图
					      setMapEvent();//设置地图事件
					      addMapControl();//向地图添加控件
					      addMapOverlay();//向地图添加覆盖物
					    }
					    function createMap(){ 
					      map = new BMap.Map("map"); 
					      map.centerAndZoom(new BMap.Point(123.428257,41.696089),16);
					    }
					    function setMapEvent(){
					      map.enableScrollWheelZoom();
					      map.enableKeyboard();
					      map.enableDragging();
					      map.enableDoubleClickZoom();
					    }
					    function addClickHandler(target,window){
					      target.addEventListener("click",function(){
					        target.openInfoWindow(window);
					      });
					    }
					    function addMapOverlay(){
					      var markers = [
					        {content:"",title:"东北大学浑南校区",imageOffset: {width:0,height:3},position:{lat:41.659592,lng:123.427533}},
					        {content:"",title:"东北大学南湖校区",imageOffset: {width:0,height:3},position:{lat:41.771399,lng:123.42562}},
					        {content:"",title:"沈阳南站",imageOffset: {width:0,height:3},position:{lat:41.673279,lng:123.41338}},
					        {content:"",title:"白塔铺",imageOffset: {width:0,height:3},position:{lat:41.693961,lng:123.42894}}
					      ];
					      for(var index = 0; index < markers.length; index++ ){
					        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
					        var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
					          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
					        })});
					        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
					        var opts = {
					          width: 200,
					          title: markers[index].title,
					          enableMessage: false
					        };
					        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
					        marker.setLabel(label);
					        addClickHandler(marker,infoWindow);
					        map.addOverlay(marker);
					      };
					    }
					    //向地图添加控件
					    function addMapControl(){
					      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
					      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
					      map.addControl(scaleControl);
					      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:0});
					      map.addControl(navControl);
					      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
					      map.addControl(overviewControl);
					    }
					    var map;
					      initMap();
                  </script>  
              
	        </div>
	        
	        <script>                //用Limit获取到的订单信息
	              
	        </script>
	        
	        <div id="xiayou">
		         <table class="table">
	                <thead>
	                    <tr>
	                        <th scope="col" abbr="Starter">发布者</th>
							<th scope="col" abbr="Deluxe">订单id</th>
	                        <th scope="col" abbr="Starter">出发日期</th>
	                        <th scope="col" abbr="Medium">费用</th>
	                        <th scope="col" abbr="Business">出发地</th>
	                        <th scope="col" abbr="Deluxe">目的地</th>
							<th scope="col" abbr="Deluxe">目前人数</th>
							<th scope="col" abbr="Deluxe">操作</th>
	                    </tr>
	                </thead>
	                <tbody id="tbody"> 	
	               <!--     <tr>
	                        <td><a target="_blank" href="chatroom.jsp?from=cherish&to=rrrrrr">rrrrrr</td>
	                        <td>2015-10-25 14:35</td>
							<td>我六你四</td>
	                        <td>浑南校区</td>
	                        <td>白塔铺</td>
	                        <td>1</td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	               --> 
	               
	                    <tr>
	                        <td></td>
	                        <td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                     <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                     <tr>
	                        <td></td>
	                        <td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                    
	                    <tr>
	                        <td></td>
	                        <td></td>
							<td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
							<td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
						 <tr>
	                        <td></td>
	                        <td></td>
							<td></td>
							<td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
							<td><a href="javascript:void(0)">申请加入</a></td>
	                    </tr>
	                     
	                </tbody>
	            </table>	
	             <div id="shangPage"><a href="javascript:void(0)">上一页</a></div>
	             <div id="xiaPage"><a href="javascript:void(0)">下一页</a></div>
	        </div>
	    </div><hr> 
    </div>
    <br><br><br>
    <div id="below">
      <br><br><hr>
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