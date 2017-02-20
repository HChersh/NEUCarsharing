package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import user.User;
import database.BaseConnection;

public class testgetUserList {

	public static void main(String[] args) {
		 BaseConnection bc = new BaseConnection();
		  Connection conn = bc.open();
		  String sql = "select * from userinfo";
		  try{
			  Statement stmt = conn.createStatement();
			  ResultSet rs = stmt.executeQuery(sql);
			  ArrayList<User> u = new ArrayList<User>();
			  while (rs.next()){
				 String id = rs.getString(1);
				 String username = rs.getString(2);
				 String password = rs.getString(3);
				 String email = rs.getString(4);
				 String tell = rs.getString(5);
				 User temp = new User();
				 temp.setUsername(username);
				 temp.setPassword(password);
				 temp.setEmail(email);
				 temp.setTell(tell);
				 u.add(temp);
			  }
			  for(int i = 0 ; i < u.size();i ++){
				  System.out.println(u.get(i).getUsername()+" "+u.get(i).getEmail());
			  }
			
		}
		catch (Exception e){
			e.printStackTrace();
		}
		finally{
			bc.close(conn);
		}

	}

}
