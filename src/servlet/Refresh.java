package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.Order;
import order.OrderManager;

import com.google.gson.Gson;

public class Refresh extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Refresh() {
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
		  String orderid = request.getParameter("orderid");
		  OrderManager om = new OrderManager();
		  int id = Integer.parseInt(orderid);
		  Order order = om.getOrder(id);
		  Gson gson = new Gson();
	      String orderString = gson.toJson(order);    //将java对象解析为json字符串      
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
