package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.Order;

import com.google.gson.Gson;

import database.BaseConnection;

public class GetOrderinfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetOrderinfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        int m = Integer.parseInt(request.getParameter("m"));
        int n = Integer.parseInt(request.getParameter("n"));
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
		Gson gson = new Gson();
	    String orderString = gson.toJson(arr);    //将java对象解析为json字符串      
//System.out.println(orderString);
        response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println(orderString);
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
