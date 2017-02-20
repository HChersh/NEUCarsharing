package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.BaseConnection;


public class AjaxUpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AjaxUpdateServlet() {
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
	  //request.setCharacterEncoding("utf-8");
		String arrays = request.getParameter("array");
		String array = URLDecoder.decode(arrays, "UTF-8");                            //解码
		String identify = request.getParameter("identify");
		String value = request.getParameter("value");
		String tablename = request.getParameter("tablename");
		String sql = "";
		BaseConnection bc = new BaseConnection();
		Connection conn = bc.open();
		sql += "update " + tablename + " set " + array +" where " + identify + "=" + "'" + value + "'";
//		System.out.println(sql);
		try{
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
//          System.out.println("执行了"+sql);
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			bc.close(conn);
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("修改成功！");
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
