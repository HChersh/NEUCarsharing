package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.BaseConnection;

public class AjaxDeleteServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AjaxDeleteServlet() {
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
 //     System.out.println("访问到这个删除的servlet");
		String identify = request.getParameter("identify");
		String value = request.getParameter("value");
		String tablename = request.getParameter("tablename");
		BaseConnection bc = new BaseConnection();
		Connection conn = bc.open();
		String sql="delete from " + tablename +" where " + identify + "=" + "'" + value + "'";
		String sqls = "delete from orderitem where "+identify+"="+"'"+value+"'";
//      System.out.println(sql);
		try{
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
			stmt.execute(sqls);
//          System.out.println("执行了"+sql);
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			bc.close(conn);
		}

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("删除成功！");
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
