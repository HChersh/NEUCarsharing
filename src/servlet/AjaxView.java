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

import order.ApplicantMessage;

import com.google.gson.Gson;

import database.BaseConnection;

public class AjaxView extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AjaxView() {
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
		
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        BaseConnection bc = new BaseConnection();
		Connection conn = bc.open();
		//select orderinfo.orderid,number,applicant,applicantstate from orderinfo,orderitem where orderinfo.orderid=orderitem.orderid and orderinfo.orderid=14
		String sql = "select orderinfo.orderid,number,applicant,applicantstate from orderinfo,orderitem "
				+ "where orderinfo.orderid=orderitem.orderid and orderinfo.orderid="+orderid;
		ArrayList<ApplicantMessage> arr = new ArrayList<ApplicantMessage>();
		ApplicantMessage temp ;
		try{
			 Statement stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery(sql);
			 while (rs.next()){
				 int id = rs.getInt(1);
				 int num = rs.getInt(2);
				 String applicant = rs.getString(3);
				 int state = rs.getInt(4);
				 temp = new ApplicantMessage(id,num,applicant,state);
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
	    String applicantMessage = gson.toJson(arr);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");               //这样就可以传输中文了
		PrintWriter out = response.getWriter();
	    out.println(applicantMessage);
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
