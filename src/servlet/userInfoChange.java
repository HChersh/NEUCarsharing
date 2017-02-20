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

public class userInfoChange extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public userInfoChange() {
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
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("name");                                    //获取前台传来的需要修改的数据
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String tell = request.getParameter("tell");
        String autograph = request.getParameter("autograph");
//System.out.println(username+"   "+password+"   "+email+"   "+tell+"   "+autograph);
        
        //下面链接数据库进行修改操作
        BaseConnection bc = new BaseConnection();
		Connection conn = bc.open();
		//update userinfo set username = 'yyyyy',email="yyyy" where username='yyyyy';
		String sql_one = "update userinfo set username="+"'"+username+"',password="+"'"+password+"',email="+"'"+email+"',tell="+"'"+tell+"'"
				+" where username="+"'"+username+"'";
		String sql_two = "update leaveMassage set content="+"'"+autograph+"'" +" where username="+"'"+username+"'"+" and leavePeople="+"'"+username+"'";
//System.out.println(sql_two);
//System.out.println(sql_one);
		try{
			Statement stmt = conn.createStatement();
			stmt.execute(sql_one);
			stmt.execute(sql_two);
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			bc.close(conn);
		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY><h1>");
		out.print("Modify Sucessfully！");
		out.println("  </h1></BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		response.sendRedirect("/jspclass/userPage.jsp");
		
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
