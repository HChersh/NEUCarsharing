/**
* JS实现可编辑的表格  
* 用法:EditTables(tb1,tb2,tb2,......);
* Created at 2011-10-11
**/

//设置多个表格可编辑
function EditTables(){
for(var i=0;i<arguments.length;i++){
   SetTableCanEdit(arguments[i]);
}
}

//设置表格是可编辑的
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

//设置指定单元格可编辑
function EditCell(element){
    CreateTextBox(element, element.innerHTML);
}

//为单元格创建可编辑输入框
function CreateTextBox(element, value){
//检查编辑状态，如果已经是编辑状态，跳过
var editState = element.getAttribute("EditState");
if(editState != "true"){
   //创建文本框
   var textBox = document.createElement("INPUT");
   textBox.type = "text";
   textBox.style.width = '58px';
   textBox.className="EditCell_TextBox";
  
  
   //设置文本框当前值
   if(!value){
    value = element.getAttribute("Value");
   }  
   textBox.value = value;
  
   //设置文本框的失去焦点事件
   textBox.onblur = function (){
    CancelEditCell(this.parentNode, this.value);
   };
   //向当前单元格添加文本框
   ClearChild(element);
   element.appendChild(textBox);
   textBox.focus();
   textBox.select();
  
   //改变状态变量
   element.setAttribute("EditState", "true");
   element.parentNode.parentNode.setAttribute("CurrentRow", element.parentNode.rowIndex);
}

}


//为单元格创建选择框
function CreateDropDownList(element, value){
//检查编辑状态，如果已经是编辑状态，跳过
var editState = element.getAttribute("EditState");
if(editState != "true"){
   //创建下接框
   var downList = document.createElement("Select");
   downList.className="EditCell_DropDownList";
  
   //添加列表项
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
  
   //设置列表当前值
   if(!value){
    value = element.getAttribute("Value");
   }
   downList.value = value;

   //设置创建下接框的失去焦点事件
   downList.onblur = function (){
    CancelEditCell(this.parentNode, this.value, this.options[this.selectedIndex].text);
   };
  
   //向当前单元格添加创建下接框
   ClearChild(element);
   element.appendChild(downList);
   downList.focus();
  
   //记录状态的改变
   element.setAttribute("EditState", "true");
   element.parentNode.parentNode.setAttribute("LastEditRow", element.parentNode.rowIndex);
}

}


//取消单元格编辑状态
function CancelEditCell(element, value, text){
element.setAttribute("Value", value);
if(text){
   element.innerHTML = text;
}else{
   element.innerHTML = value;
}
element.setAttribute("EditState", "false");

//检查是否有公式计算
CheckExpression(element.parentNode);
}

//清空指定对象的所有字节点
function ClearChild(element){
element.innerHTML = "";
}


//提取表格的值,JSON格式
function GetTableData(table){
var tableData = new Array();
alert("行数：" + table.rows.length);
for(var i=1; i<table.rows.length;i++){
   tableData.push(GetRowData(tabProduct.rows[i]));
}

return tableData;

}
//提取指定行的数据，JSON格式
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
//或者这样：alert("ProductName:" + rowData["ProductName"]);
return rowData;

}

//记住编辑前的数据
function EditBefore(row){ 
  var rowValue = new Array();
  for(var i = 0 ;i < 8;i++){
     rowValue[i] = row.cells[i].innerHTML;
  }
  return rowValue;
};



