package user;

public class User {
	String username;
	String password;
    String email;
    String tell;
    int evaluate; 

    User(String username,String password,String email,String tell){           //含参构造函数
    	this.username = username;
    	this.password=password;
    	this.email=email;
    	this.tell=tell;
    	this.evaluate = 60;
    }
    public User(){                                                             //无参构造函数      
    }
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEvaluate(int evaluate){
		this.evaluate = evaluate;
	}
	public int getEvaluate(){
		return evaluate;
	}
	public String toString(){                                            //重写toString()方法
		return "username:"+ username +"  "+"email:"+email+"  "+"tell:"+tell+" "+"evaluate:"+evaluate;
	}
    
}
