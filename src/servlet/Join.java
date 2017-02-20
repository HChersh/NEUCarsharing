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

public class Join extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Join() {
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
		String username = request.getParameter("username");
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		String tablename = request.getParameter("tablename");
		BaseConnection bc = new BaseConnection();
		Connection conn = bc.open();
		// String sql = "insert into orderinfo(username,date,cos,start,stop,number,state) values("+"'"+username+"'"+","+"'"+date+"'"
		//  +","+"'"+cos+"'"+","+"'"+start+"'"+","+"'"+stop+"'"+","+1+","+1+")";
		//insert into orderitem(orderid,applicant,applicantstate) values(13,'jjjj',0);
		String sql = "insert into orderitem(orderid,applicant,applicantstate) values("+orderid+","+"'"+username+"'"+","+20+")";
		try{
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			bc.close(conn);
		}

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("…Í«Î≥…π¶£°");
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
