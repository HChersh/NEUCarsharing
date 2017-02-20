/**
 * 
 */
function addRow(oJson,oTable){                             //��ָ����table�����������json���������
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

function deleteAjax(id,va,tn){                           //��������ֵ�ͱ�����ֱ������ɾ��ɾ�� ,���������ֱ�Ϊ������������ֵ������
	  var oAjax;
	  // oAjax = new XMLHttpRequest();
	  //���ȴ���Ajax����
	  if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	  }else{
		oAjax = new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  //���ӵ�������
	  oAjax.open('GET','servlet/AjaxDeleteServlet?identify='+id+'&'+'value='+va+'&'+'tablename='+tn,true);    //get��ʽ���ʣ����һ��ʱ���ȥ�����棬�첽������Ϊtrue
	  oAjax.send();      //��������                                                                                                                                                                                                                    //delete from tablename where identify = value
	  //������״̬�����ı��ʱ����ú���
      oAjax.onreadystatechange = function(){
		if(4==oAjax.readyState){
			if(200==oAjax.status){
		     var txt = oAjax.responseText;               
		     alert(txt);

			}
		}  
	  };
 }


function releasOrder(){                   //���ٷ���һ���µĶ���
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
			     +'&'+'cos='+encodeURI(encodeURI(cos))+'&'+'username='+encodeURI(encodeURI(username)),true);    //get��ʽ���ʣ����һ��ʱ���ȥ�����棬�첽������Ϊtrue
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


function updateAjax(arr,id,va,tn){                                //�����޸����ݿ��������     ������Ϣ����_������_����ֵ_����
	  var oAjax;
	  if(window.XMLHttpRequest){
		oAjax = new XMLHttpRequest();
	  }else{
		oAjax = new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  //encodeURI(encodeURI(arr));                                ��������б���Ļ�����servlet������
	  oAjax.open('GET','servlet/AjaxUpdateServlet?array='+encodeURI(encodeURI(arr))+'&'+'identify='+id+'&'+'value='+va+'&'+'tablename='+tn,true);    //get��ʽ���ʣ����һ��ʱ���ȥ�����棬�첽������Ϊtrue
	  oAjax.send();      //��������                                                                                                                                                                                                                    //delete from tablename where identify = value
	  //������״̬�����ı��ʱ����ú���
     oAjax.onreadystatechange = function(){
		if(4==oAjax.readyState){
			if(200==oAjax.status){
		     var txt = oAjax.responseText;               
		     alert(txt);

			}
		}  
	  };
}

function changeAppAjax(name,state,id){                          //ͨ��orderid��username�����һ���û���һ����������������ĸ���
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

function countRows(){                                         //ͨ������һ���������������ж�����
	
}


function getOrderinfo(m,n){                          //��ҳ��ȡ�����ж������б�limit m,n
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












