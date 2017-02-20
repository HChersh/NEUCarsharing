package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseConnection {
	public Connection open()                       //打开数据库的链接     该方法返回一个Connection类型的对象
	{
		Connection conn = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); // 加载驱动类
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/neucarsharing", "root", "root"); // 获取数据库的链接，localhost是本机ip，3306是端口,后面分别是数据库名字已经用户名和密码
			return conn;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public void close(Connection conn){            //关闭数据库的链接
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
