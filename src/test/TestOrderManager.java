package test;
import java.util.ArrayList;

import order.ApplicationOrder;
import order.Order;
import order.OrderManager;

public class TestOrderManager {
	public static void main(String[] args) {
	   Order temp;
       OrderManager om = new OrderManager();
//       ArrayList<Order> orderlist = om.getOrderList();                                 //����getOrderList()
//       print(orderlist);
         System.out.println("��������ҷ����ĺ�����ȷ��");
//       ArrayList<Order> releaseOrderlist = om.getReleaseOrderList("cherish");          //����getReleaseOrderlist()
//       print(releaseOrderlist);
         ArrayList<ApplicationOrder> orders = om.getApplicationOrderList("cherish");
         System.out.println(orders);
       
	}
	
	static void print(ArrayList<Order> arry){
		for(int i = 0 ;i < arry.size();i++){
			   Order temp;
	    	   temp = arry.get(i);
	    	   System.out.println(temp);
	       }
	}

}
