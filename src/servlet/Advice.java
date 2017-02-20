package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import database.BaseConnection;

public class Advice extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Advice() {
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
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BaseConnection bc = new BaseConnection();
		Connection conn = (Connection) bc.open();
		String username = request.getParameter("username");
		System.out.println(username);
		String sql = "select feedback from mail where username='"+username+"'";

		String advice = "";
		try{
			  Statement stmt = (Statement) conn.createStatement();
			  ResultSet result = stmt.executeQuery(sql);
			  if(result!=null){
				  while (result.next()){
						 String feedback = result.getString("feedback");
						 advice+=feedback+"|";
					  } 
			  }
			  
		}
		catch (Exception e){
			e.printStackTrace();
		}
		finally{
			bc.close(conn);
		}
		response.setContentType("utf-8");			
		if(advice!=null){
			PrintWriter out = response.getWriter();
			out.println(advice);
			out.flush();
			out.close();
		}
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
