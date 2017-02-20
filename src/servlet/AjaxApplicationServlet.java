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

public class AjaxApplicationServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AjaxApplicationServlet() {
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
		int applicantstate = Integer.parseInt(request.getParameter("applicantstate"));
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		
		String sql = "";
		BaseConnection bc = new BaseConnection();
		Connection conn = bc.open();
//		sql += "update " + tablename + " set " + array +" where " + identify + "=" + "'" + value + "'";
		try{
			Statement stmt = conn.createStatement();       //�������������Ǽ��ͽ���Ӧ��applicantstate��Ϊ����
			if(20==applicantstate){                    
				sql += "update orderitem set applicantstate=20 where applicant = " + "'" + username + "'" +"and orderid="+orderid;
			}else if(0==applicantstate){                  //�����ڴ�ȷ�Ͻ׶ξ͵��ȡ��
				sql += "update orderitem set applicantstate=0 where applicant = " + "'" + username + "'" +"and orderid="+orderid;
			}else if(11==applicantstate){                 //����0���������Ѿ�ȷ�ϵ�����µ��ȡ���������Ҫnumber-1
				sql += "update orderitem set applicantstate=0 where applicant = " + "'" + username + "'" +"and orderid="+orderid;
//				System.out.println(sql);
				stmt.execute(sql);
				sql = "update orderinfo set number=number-1 where orderid="+orderid;
			}else if(1==applicantstate){                 //�ɹ�֮��number����Ҫ��1
				sql += "update orderitem set applicantstate=1 where applicant = " + "'" + username + "'" +"and orderid="+orderid;
				stmt.execute(sql);
				sql = "update orderinfo set number=number+1 where orderid="+orderid;
			}else if(21==applicantstate){
				sql += "update orderitem set applicantstate=21 where applicant = " + "'" + username + "'" +"and orderid="+orderid;
			}
			stmt.execute(sql);
//          System.out.println("ִ����"+sql);
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			bc.close(conn);
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("�޸ĳɹ���");
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
