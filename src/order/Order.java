package order;

public class Order {                                    //订单实体类
	
	private String username;                            //拥有订单的对象   
	private int orderid;                             //订单的id号
	private String date;                                //下单的日期
	private String cos;                                 //订单话费分成
	private String start;                               //出发地
	private String stop;                                //目的地
	private int number;                                 //订单目前人数
	private int state;                                  //订单的开关状态         订单状态有两种，0,1分别表示订单关闭和开启
    public Order(String username,int orderid,String date,String cos,String start,String stop,int number,int state ){
    	this.username = username;this.orderid = orderid;
    	this.date = date;  this.cos = cos;
    	this.start = start;  this.stop = stop;
    	this.number = number; this.state = state;
    }
    public Order(){
    	
    }
	public String getUsername() {                            //一系列get()set()方法
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCos() {
		return cos;
	}
	public void setCos(String cos) {
		this.cos = cos;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getStop() {
		return stop;
	}
	public void setStop(String stop) {
		this.stop = stop;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public String toString(){
		return "username:"+username+" orderid:"+orderid+" date:"+date+" cos:"+cos+" start:"+start+" stop:"+stop+" number:"+number+" state:"+state;
	}
	  
	  
	}
