package user;

public class User {
	String username;
	String password;
    String email;
    String tell;
    int evaluate; 

    User(String username,String password,String email,String tell){           //���ι��캯��
    	this.username = username;
    	this.password=password;
    	this.email=email;
    	this.tell=tell;
    	this.evaluate = 60;
    }
    public User(){                                                             //�޲ι��캯��      
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
	public String toString(){                                            //��дtoString()����
		return "username:"+ username +"  "+"email:"+email+"  "+"tell:"+tell+" "+"evaluate:"+evaluate;
	}
    
}
