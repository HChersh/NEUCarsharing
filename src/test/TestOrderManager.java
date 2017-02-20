package test;
import java.util.ArrayList;

import order.ApplicationOrder;
import order.Order;
import order.OrderManager;

public class TestOrderManager {
	public static void main(String[] args) {
	   Order temp;
       OrderManager om = new OrderManager();
//       ArrayList<Order> orderlist = om.getOrderList();                                 //测试getOrderList()
//       print(orderlist);
         System.out.println("下面测试我发布的函数正确性");
//       ArrayList<Order> releaseOrderlist = om.getReleaseOrderList("cherish");          //测试getReleaseOrderlist()
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
