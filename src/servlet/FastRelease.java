package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.OrderManager;

public class FastRelease extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FastRelease() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		                         
        String username = URLDecoder.decode(request.getParameter("username"), "UTF-8");
        String start = URLDecoder.decode(request.getParameter("start"),"UTF-8");
        String stop = URLDecoder.decode(request.getParameter("stop"), "UTF-8");
        String date = URLDecoder.decode(request.getParameter("date"), "UTF-8");
        String cos = URLDecoder.decode(request.getParameter("cos"), "UTF-8");
        new OrderManager().releaseOrder(username, start, stop, date, cos);
        response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("订单发布成功！");
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
