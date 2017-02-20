package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseConnection {
	public Connection open()                       //�����ݿ������     �÷�������һ��Connection���͵Ķ���
	{
		Connection conn = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); // ����������
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/neucarsharing", "root", "root"); // ��ȡ���ݿ�����ӣ�localhost�Ǳ���ip��3306�Ƕ˿�,����ֱ������ݿ������Ѿ��û���������
			return conn;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public void close(Connection conn){            //�ر����ݿ������
		try
		{
			if(conn!=null)
			conn.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
}
