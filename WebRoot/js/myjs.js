/**
 * 
 */
function addRow(oJson,oTable){                             //向指定的table对象里面插入json对象的数据
	 var oTr = null;
     var oTd = null;
     for(var one in oJson){
     	oTr = document.createElement("tr");
     	for(var key in oJson[one]){
     		oTd = document.createElement("td");
     		oTd.innerHTML = oJson[one][key];
     		oTr.appendChild(oTd);
     	}
     	oTable.tBodies[0].appendChild(oTr);
     }
 }

function deleteAjax(id,va,tn){                           //传入主键值和表的名字便可请求删除删除 ,三个参数分别为主键名、主键值、表名
	  var oAjax;
	  // oAjax = new XMLHttpRequest();
	  //首先创建Ajax对象
	  if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	  }else{
		oAjax = new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  //连接到服务器
	  oAjax.open('GET','servlet/AjaxDeleteServlet?identify='+id+'&'+'value='+va+'&'+'tablename='+tn,true);    //get方式访问，添加一个时间戳去掉缓存，异步访问设为true
	  oAjax.send();      //发送请求                                                                                                                                                                                                                    //delete from tablename where identify = value
	  //当连接状态发生改变的时候调用函数
      oAjax.onreadystatechange = function(){
		if(4==oAjax.readyState){
			if(200==oAjax.status){
		     var txt = oAjax.responseText;               
		     alert(txt);

			}
		}  
	  };
 }


function releasOrder(){                   //快速发布一个新的订单
	  var start = document.getElementById("faststart").value;
	  var stop = document.getElementById("faststop").value;
	  var date = document.getElementById("fastdate").value;
	  var cos = document.getElementById("fastcos").value;
	  var username = document.getElementById("fastname").value;
	  var oAjax;
	  if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	  }else{
		oAjax = new ActiveXObject("Microsoft.XMLHTTP");
	  }
//	  oAjax.open('GET','servlet/FastRelease?start='+encodeURI(encodeURI(start)),true);
	  oAjax.open('GET','servlet/FastRelease?start='+encodeURI(encodeURI(start))+'&'+'stop='+encodeURI(encodeURI(stop))+'&'+'date='+encodeURI(encodeURI(date))
			     +'&'+'cos='+encodeURI(encodeURI(cos))+'&'+'username='+encodeURI(encodeURI(username)),true);    //get方式访问，添加一个时间戳去掉缓存，异步访问设为true
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


function updateAjax(arr,id,va,tn){                                //更新修改数据库里的内容     更改信息数组_主键名_主键值_表名
	  var oAjax;
	  if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	  }else{
		oAjax = new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  //encodeURI(encodeURI(arr));                                如果不进行编码的话传到servlet会乱码
	  oAjax.open('GET','servlet/AjaxUpdateServlet?array='+encodeURI(encodeURI(arr))+'&'+'identify='+id+'&'+'value='+va+'&'+'tablename='+tn,true);    //get方式访问，添加一个时间戳去掉缓存，异步访问设为true
	  oAjax.send();      //发送请求                                                                                                                                                                                                                    //delete from tablename where identify = value
	  //当连接状态发生改变的时候调用函数
     oAjax.onreadystatechange = function(){
		if(4==oAjax.readyState){
			if(200==oAjax.status){
		     var txt = oAjax.responseText;               
		     alert(txt);

			}
		}  
	  };
}

function changeAppAjax(name,state,id){                          //通过orderid和username，完成一个用户对一个订单的申请情况的更改
	 var oAjax;
	 if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	 }else{
		oAjax = new ActiveXObjext("Microsoft.XMLHTTP");
	 }
	 oAjax.open('GET','servlet/AjaxApplicationServlet?username='+encodeURI(encodeURI(name))+'&'+'applicantstate='+state+'&'+'orderid='+id+'&'+'t='+new Date().getTime(),true);
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

function countRows(){                                         //通过表格的一列来计算整个表有多少行
	
}


function getOrderinfo(m,n){                          //首页获取到所有订单的列表，limit m,n
	 var oAjax;
	 if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	 }else{
		oAjax = new ActiveXObjext("Microsoft.XMLHTTP");
	 }
	 oAjax.open('GET','servlet/GetOrderinfo?m='+m+'&'+'n='+n+'&'+'t='+new Date().getTime());
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

function join(orderid,username){
	 var oAjax;
	 if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	 }else{
		oAjax = new ActiveXObjext("Microsoft.XMLHTTP");
	 }
	 oAjax.open('GET','servlet/Join?username='+username+'&'+'orderid='+orderid+'&'+'t='+new Date().getTime());
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












