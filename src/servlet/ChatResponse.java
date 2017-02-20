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

public class ChatResponse extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChatResponse() {
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

		String from = "";
		String to = "";
		String req = request.getParameter("request");
		String sql = "";
		String date = "";
		String message = "";
		 BaseConnection bc = new BaseConnection();

		 Connection conn = (Connection) bc.open();
		if(req.equals("send")){
			from = request.getParameter("from");
			message = request.getParameter("message");
			to = request.getParameter("to");
			date=request.getParameter("time");
			sql="insert into message"
					+ " values('"+to+"','"+from+"','"+message+"','"+date+"','1')";
			try{
				  Statement stmt = (Statement) conn.createStatement();
				  stmt.executeUpdate(sql);			  
			}
			catch (Exception e){
				e.printStackTrace();
			}
			finally{
				bc.close(conn);
			}
		}else{
			from = request.getParameter("to");
			to = request.getParameter("from");
			sql="select content from message where receiver='"+to+"'and sender='"
			+from+"'";

			try{
				  Statement stmt = (Statement) conn.createStatement();
				  ResultSet result = stmt.executeQuery(sql);
				  if(result==null)message="00000000";
				  while (result.next()){
						 String content = result.getString("content");
						 message+=content+"|";
					  }
				  sql="delete from message where receiver='"+to+"' and sender='"+from+"'";
				  stmt.executeUpdate(sql);	
			}
			catch (Exception e){
				e.printStackTrace();
			}
			finally{
				bc.close(conn);
			}
			response.setContentType("utf-8");			
			if(!message.equals("00000000")){
				PrintWriter out = response.getWriter();
				out.println(message);
				out.flush();
				out.close();
			}
			
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
