/**
* JSʵ�ֿɱ༭�ı��  
* �÷�:EditTables(tb1,tb2,tb2,......);
* Created at 2011-10-11
**/

//���ö�����ɱ༭
function EditTables(){
for(var i=0;i<arguments.length;i++){
   SetTableCanEdit(arguments[i]);
}
}

//���ñ���ǿɱ༭��
function SetTableCanEdit(table){
for(var i=1; i<table.rows.length;i++){
   SetRowCanEdit(table.rows[i]);
}
}

function SetRowCanEdit(row){
for(var j=0;j<row.cells.length; j++){ 
    row.cells[j].onclick = function (){
     EditCell(this);
    };
   
}
}

//����ָ����Ԫ��ɱ༭
function EditCell(element){
    CreateTextBox(element, element.innerHTML);
}

//Ϊ��Ԫ�񴴽��ɱ༭�����
function CreateTextBox(element, value){
//���༭״̬������Ѿ��Ǳ༭״̬������
var editState = element.getAttribute("EditState");
if(editState != "true"){
   //�����ı���
   var textBox = document.createElement("INPUT");
   textBox.type = "text";
   textBox.style.width = '58px';
   textBox.className="EditCell_TextBox";
  
  
   //�����ı���ǰֵ
   if(!value){
    value = element.getAttribute("Value");
   }  
   textBox.value = value;
  
   //�����ı����ʧȥ�����¼�
   textBox.onblur = function (){
    CancelEditCell(this.parentNode, this.value);
   };
   //��ǰ��Ԫ������ı���
   ClearChild(element);
   element.appendChild(textBox);
   textBox.focus();
   textBox.select();
  
   //�ı�״̬����
   element.setAttribute("EditState", "true");
   element.parentNode.parentNode.setAttribute("CurrentRow", element.parentNode.rowIndex);
}

}


//Ϊ��Ԫ�񴴽�ѡ���
function CreateDropDownList(element, value){
//���༭״̬������Ѿ��Ǳ༭״̬������
var editState = element.getAttribute("EditState");
if(editState != "true"){
   //�����½ӿ�
   var downList = document.createElement("Select");
   downList.className="EditCell_DropDownList";
  
   //����б���
   var items = element.getAttribute("DataItems");
   if(!items){
    items = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("DataItems");
   }
  
   if(items){
    items = eval("[" + items + "]");
    for(var i=0; i<items.length; i++){
     var oOption = document.createElement("OPTION");
     oOption.text = items[i].text;
     oOption.value = items[i].value;
     downList.options.add(oOption);
    }
   }
  
   //�����б�ǰֵ
   if(!value){
    value = element.getAttribute("Value");
   }
   downList.value = value;

   //���ô����½ӿ��ʧȥ�����¼�
   downList.onblur = function (){
    CancelEditCell(this.parentNode, this.value, this.options[this.selectedIndex].text);
   };
  
   //��ǰ��Ԫ����Ӵ����½ӿ�
   ClearChild(element);
   element.appendChild(downList);
   downList.focus();
  
   //��¼״̬�ĸı�
   element.setAttribute("EditState", "true");
   element.parentNode.parentNode.setAttribute("LastEditRow", element.parentNode.rowIndex);
}

}


//ȡ����Ԫ��༭״̬
function CancelEditCell(element, value, text){
element.setAttribute("Value", value);
if(text){
   element.innerHTML = text;
}else{
   element.innerHTML = value;
}
element.setAttribute("EditState", "false");

//����Ƿ��й�ʽ����
CheckExpression(element.parentNode);
}

//���ָ������������ֽڵ�
function ClearChild(element){
element.innerHTML = "";
}


//��ȡ����ֵ,JSON��ʽ
function GetTableData(table){
var tableData = new Array();
alert("������" + table.rows.length);
for(var i=1; i<table.rows.length;i++){
   tableData.push(GetRowData(tabProduct.rows[i]));
}

return tableData;

}
//��ȡָ���е����ݣ�JSON��ʽ
function GetRowData(row){
var rowData = {};
for(var j=0;j<row.cells.length; j++){
   name = row.parentNode.rows[0].cells[j].getAttribute("Name");
   if(name){
    var value = row.cells[j].getAttribute("Value");
    if(!value){
     value = row.cells[j].innerHTML;
    }
   
    rowData[name] = value;
   }
}
//alert("ProductName:" + rowData.ProductName);
//����������alert("ProductName:" + rowData["ProductName"]);
return rowData;

}

//��ס�༭ǰ������
function EditBefore(row){ 
  var rowValue = new Array();
  for(var i = 0 ;i < 8;i++){
     rowValue[i] = row.cells[i].innerHTML;
  }
  return rowValue;
};



