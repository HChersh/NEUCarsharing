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

public class ListShowing extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ListShowing() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println("ok1");
		response.setContentType("utf-8");
		String receiver = request.getParameter("from");
		BaseConnection bc = new BaseConnection();

		  Connection conn = (Connection) bc.open();

		  String sql = "select sender,count(content) as number from message where receiver='"+receiver+"' group by sender";
		  String message="";
		  try{
			  Statement stmt = (Statement) conn.createStatement();
			  ResultSet rs = stmt.executeQuery(sql);
			  
			  while (rs.next()){
				 String sender = rs.getString("sender");
				 String number = rs.getString("number");
				 message+=sender+","+number+"|";
			  }
//			  System.out.println(message+111);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		finally{
			bc.close(conn);
		}
		PrintWriter out = response.getWriter();

		out.println(message);
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
