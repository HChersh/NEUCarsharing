package user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Pattern;

import database.BaseConnection;

public class UserManager {
 /*public static ArrayList<User> u = null;	            ����û�а�UserList����Ϊһ���࣬ԭ��Ӧ���õ�����ģʽ��˼��,����ʱû�뵽��ô��
                                                   Userlist������������ע����û�
*/                                                      
  public String judgeLogin(String username,String password){      //����index.jsp�����ĵ�¼���󣬷��ش�������loginResult.jsp
	ArrayList<User> userlist = getUserList();
	User temp = findUser(userlist, username);
	if(temp==null){
		return "�û���: "+username+" "+"�����ڣ�"+" "+"����ע����߼���û����Ƿ���ȷ!";
	}else if(password.equals(temp.getPassword())){
		return "��¼�ɹ�!";
	}else{
		return "������������µ�¼!";
	}
	
//	  return "���ﲻ����ܳ";
  }
  
//�ж���δ���ע�����󣬲����ش�����
  public String judgeRegister(String username,String password,String repassword,String email,String tell){ 
	  ArrayList<User> userlist = getUserList();
	  if(findUser(userlist, username)!=null){                                 
		  return "�û���: "+username+" "+"�Ѵ���" + "������ѡ��ע������";
	  }
      if(!(Pattern.matches("^[a-z]\\w{3,5}$", username))){                   
		 return "��������ȷ��ʽ���û�����";
	  }
      if(!(Pattern.matches(".{6,}",password))){                             
 		 return "��������ȷ���û����룡";
 	  }
      if(!(password.equals(repassword))){                                  
  		 return "�������벻һ�£�";
  	  }
      if(!(Pattern.matches("^\\w+@([a-z0-9]+\\.)+[a-z]+$",email))){          
  		 return "��������ȷ�����䣡";
  	  }
      
	  if(!(Pattern.matches("^[1][358][0-9]{9}$", tell))){                    
		  return "��������ȷ���ֻ�!";
	  }
	  
	  insert(username,password,email,tell);
	  return "ע��ɹ������Ե�¼��";
	 
  }
  
  public User findUser(ArrayList<User> userlist,String username){        //ͨ���û��������ҵ�������û�
	  for(int usernub = 0 ; usernub < userlist.size();usernub++){
		  User temp = userlist.get(usernub);
		  if(temp.getUsername().equals(username)){
			  return temp;
		  }
	  }
	  return null;
  }
  
  public void insert(String username,String password,String email,String tell){    //��һ����ע����û����뵽���ݿ���
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
  
  
  public ArrayList<User> getUserList(){                                  //��ȡ�û���Ϣ
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
  
  
  public void subEvaluate(User user,int eva){                              //�û���ΪһЩ��ǡ���Ĳ�����������eva��
	  user.evaluate -= eva;                      //��ֻ�����ڴ���������˼Ӽ�������������Ҫ������������д���ݿⷽ��Ĳ���
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
