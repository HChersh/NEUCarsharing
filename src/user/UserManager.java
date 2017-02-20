package user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Pattern;

import database.BaseConnection;

public class UserManager {
 /*public static ArrayList<User> u = null;	            这里没有把UserList抽象为一个类，原本应该用到单例模式的思想,但暂时没想到怎么往
                                                   Userlist里面快速添加新注册的用户
*/                                                      
  public String judgeLogin(String username,String password){      //处理index.jsp传来的登录请求，返回处理结果到loginResult.jsp
	ArrayList<User> userlist = getUserList();
	User temp = findUser(userlist, username);
	if(temp==null){
		return "用户名: "+username+" "+"不存在！"+" "+"请先注册或者检查用户名是否正确!";
	}else if(password.equals(temp.getPassword())){
		return "登录成功!";
	}else{
		return "密码错误，你重新登录!";
	}
	
//	  return "哪里不对我艹";
  }
  
//判断如何处理注册请求，并返回处理结果
  public String judgeRegister(String username,String password,String repassword,String email,String tell){ 
	  ArrayList<User> userlist = getUserList();
	  if(findUser(userlist, username)!=null){                                 
		  return "用户名: "+username+" "+"已存在" + "请重新选择注册名！";
	  }
      if(!(Pattern.matches("^[a-z]\\w{3,5}$", username))){                   
		 return "请输入正确格式的用户名！";
	  }
      if(!(Pattern.matches(".{6,}",password))){                             
 		 return "请输入正确的用户密码！";
 	  }
      if(!(password.equals(repassword))){                                  
  		 return "两次密码不一致！";
  	  }
      if(!(Pattern.matches("^\\w+@([a-z0-9]+\\.)+[a-z]+$",email))){          
  		 return "请输入正确的邮箱！";
  	  }
      
	  if(!(Pattern.matches("^[1][358][0-9]{9}$", tell))){                    
		  return "请输入正确的手机!";
	  }
	  
	  insert(username,password,email,tell);
	  return "注册成功！可以登录了";
	 
  }
  
  public User findUser(ArrayList<User> userlist,String username){        //通过用户的姓名找到具体的用户
	  for(int usernub = 0 ; usernub < userlist.size();usernub++){
		  User temp = userlist.get(usernub);
		  if(temp.getUsername().equals(username)){
			  return temp;
		  }
	  }
	  return null;
  }
  
  public void insert(String username,String password,String email,String tell){    //将一个新注册的用户加入到数据库中
	    BaseConnection bc = new BaseConnection();
		Connection conn = bc.open();
		int i = 3;
		String sql = "insert into userinfo values(" + "'" + username + "'"
				+ ","+"'"+password+"'"+","+"'"+email+"'"+","+"'"+tell+"'"+","+60+")";
//		String sql = "insert into userinfo values(" + "'"+i+"'"+","+"'" + username + "'"
//				+ ","+"'"+password+"'"+","+"'"+email+"'"+","+"'"+tell+"'"+")";
		try{
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			bc.close(conn);
		}
  }
  
  
  public ArrayList<User> getUserList(){                                  //获取用户信息
	  BaseConnection bc = new BaseConnection();
	  Connection conn = bc.open();
	  String sql = "select * from userinfo";
	  try{
		  Statement stmt = conn.createStatement();
		  ResultSet rs = stmt.executeQuery(sql);
		  ArrayList<User> userlist = new ArrayList<User>();
		  while (rs.next()){
			 String username = rs.getString(1);
			 String password = rs.getString(2);
			 String email = rs.getString(3);
			 String tell = rs.getString(4);
			 User temp = new User();
			 temp.setUsername(username);
			 temp.setPassword(password);
			 temp.setEmail(email);
			 temp.setTell(tell);
			 userlist.add(temp);
		  }
		return userlist;
	}
	catch (Exception e){
		e.printStackTrace();
	}
	finally{
		bc.close(conn);
	}
	return null;
  }
  
  public User findUserInfo(String username){
	  BaseConnection bc = new BaseConnection();
	  Connection conn = bc.open();
	  String sql = "select * from userinfo where username ="+"'"+username+"'";
	  try{
		  Statement stmt = conn.createStatement();
		  ResultSet rs = stmt.executeQuery(sql);
		  User temp = new User();
		  while(rs.next()){
			  String usernames = rs.getString(1);
			  String password = rs.getString(2);
			  String email = rs.getString(3);
			  String tell = rs.getString(4);
			  temp.setUsername(usernames);
			  temp.setPassword(password);
			  temp.setEmail(email);
			  temp.setTell(tell);
		  }
		  return temp;
	  }
	  catch (Exception e){
		 e.printStackTrace();
	  }
	  finally{
		bc.close(conn);
	  }
	  return null;
  }
  
  
  public void subEvaluate(User user,int eva){                              //用户因为一些不恰当的操作而被扣了eva分
	  user.evaluate -= eva;                      //这只是在内存里面进行了加减操作，如果最后要添加这个功能再写数据库方面的操作
  }
  
  public String getMessage(String username,String leavePeople){
	  BaseConnection bc = new BaseConnection();
	  Connection conn = bc.open();
	  String sql = "select content from leaveMassage where username ="+"'"+username+"'"+"and leavePeople="+"'"+leavePeople+"'";
	  try{
		  Statement stmt = conn.createStatement();
		  ResultSet rs = stmt.executeQuery(sql);
		  String str = "";
		  while(rs.next()){
			  str = rs.getString(1);
		  }
		  return str;
	  }
	  catch (Exception e){
		 e.printStackTrace();
	  }
	  finally{
		bc.close(conn);
	  }
	  return null; 
  }
  
  
  
}
