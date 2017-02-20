package order;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import database.BaseConnection;

public class OrderManager {                                                    //有关订单操作的一个类
	
	  public ArrayList<Order> getOrderList(){                                  //获取到所有的订单信息
		  BaseConnection bc = new BaseConnection();
		  Connection conn = bc.open();
		  String sql = "select * from orderinfo";
		  try{
			  Statement stmt = conn.createStatement();
			  ResultSet rs = stmt.executeQuery(sql);
			  ArrayList<Order> orderlist = new ArrayList<Order>();
			  while (rs.next()){
				 String username = rs.getString(1);
				 int orderid = rs.getInt(2);
				 String date = rs.getString(3);
				 String cos = rs.getString(4);
				 String start = rs.getString(5);
				 String stop = rs.getString(6);
				 int number = rs.getInt(7);
				 int state = rs.getInt(8);
				 Order temp = new Order(username,orderid,date,cos,start,stop,number,state);
				 orderlist.add(temp);
			  }
			return orderlist;
		}
		catch (Exception e){
			e.printStackTrace();
		}
		finally{
			bc.close(conn);
		}
		return null;
	  }
	  
	  public ArrayList<Order> getReleaseOrderList(String username){                //获取用户发布的订单信息（通过用户的用户名）
		  ArrayList<Order> allOrderlist = this.getOrderList();
		  ArrayList<Order> releaseOrderlist = new ArrayList<Order>();
		  for(int order = 0 ; order < allOrderlist.size(); order++){        //遍历整个Order列表找出用户名为username的Order,并将它加入到releaseOrderlist<Order>集合里面(我发布的)
			  Order temp = allOrderlist.get(order);
			  if(temp.getUsername().equals(username)){
				  releaseOrderlist.add(temp);
			  }
		  }
		  return releaseOrderlist;
	  
	  }
	  
	  public ArrayList<ApplicationOrder> getApplicationOrderList(String username){           //获取用户申请的订单信息(通过用户的用户名)
		  BaseConnection bc = new BaseConnection();
		  Connection conn = bc.open();
		  String sql = "select orderid,applicantstate from orderitem where applicant=" + "'" + username + "'";
		  try{
			  Statement stmt = conn.createStatement();
			  ResultSet rs = stmt.executeQuery(sql);
              OrderItem temp = new OrderItem();
              Order temporder;
			  ArrayList<OrderItem> applicationOrderitem = new ArrayList<OrderItem>();
			  ArrayList<ApplicationOrder> applicationOrderlist = new ArrayList<ApplicationOrder>();
			  int temporderid;
//首先获取OrderItem的集合，然后根据循环遍历orderid找到对应的order，最后实例化每一个ApplicationOrder,最后返回这个申请Order的集合
			  while (rs.next()){
				 int orderid = rs.getInt("orderid");
				 int applicantstate = rs.getInt("applicantstate");
//				 System.out.println(orderid+"    "+applicantstate);
				 temp = new OrderItem(orderid,username,applicantstate);
				 applicationOrderitem.add(temp);
			  }
              for(int i = 0 ; i < applicationOrderitem.size() ; i++){
            	  temp = applicationOrderitem.get(i);
            	  temporderid = temp.getOrderid();
            	  sql = "select * from orderinfo where orderid=" + "'" + temporderid + "'";
            	  rs = stmt.executeQuery(sql);
            	  rs.next();                                      //!!!!next()方法指针后移才能访问这个对象
            	  temporder = new Order(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4),
            			                rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8));
            	  applicationOrderlist.add(new ApplicationOrder(temporder, temp.getApplicantstate())); 
              }
			  return applicationOrderlist;
		}
		catch (Exception e){
			e.printStackTrace();
		}
		finally{
			bc.close(conn);
		}
		  return null;
	  }
	  
	  
	  public Order getOrder(int orderid){                               //获取一条具体的Order信息(通过orderid)
		  ArrayList<Order> allOrderlist = this.getOrderList();
		  Order order = new Order();
		  for(int i = 0 ; i < allOrderlist.size() ; i++){
			  order = allOrderlist.get(i);
			  if(order.getOrderid()==orderid){
				  return order;
			  }
		  }
		  return order;
	  }
	  
	  public void releaseOrder(String username,String start,String stop,String date,String cos){
		  BaseConnection bc = new BaseConnection();
		  Connection conn = bc.open();
		  String sql = "insert into orderinfo(username,date,cos,start,stop,number,state) values("+"'"+username+"'"+","+"'"+date+"'"
				  +","+"'"+cos+"'"+","+"'"+start+"'"+","+"'"+stop+"'"+","+1+","+1+")";
		  try{
			  Statement stmt = conn.createStatement();
			  stmt.execute(sql);
		  }catch (Exception e) {
			  e.getStackTrace();
		  }finally{
			  bc.close(conn);
		  }
	  }
	  
	  public ArrayList<Order> getHomePageOrderlist(String mm,String nn){
		  int m = Integer.parseInt(mm);
	      int n = Integer.parseInt(nn);
		  String sql = "select * from orderinfo limit"+" "+m+","+n;
		//System.out.println(sql);
		        BaseConnection bc = new BaseConnection();
				Connection conn = bc.open();
				ArrayList<Order> arr = new ArrayList<Order>();
				Order temp;
				try{
					 Statement stmt = conn.createStatement();
					 ResultSet rs = stmt.executeQuery(sql);
					 while (rs.next()){
						 temp = new Order(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8));
						 arr.add(temp);
					  }
				}
				catch (Exception e){
					e.printStackTrace();
				}
				finally{
					bc.close(conn);
				}
//				Gson gson = new Gson();
//			    String orderString = gson.toJson(arr);    //将java对象解析为json字符串      
		//System.out.println(orderString);
				return arr;
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
}
