package order;

public class Order {                                    //����ʵ����
	
	private String username;                            //ӵ�ж����Ķ���   
	private int orderid;                             //������id��
	private String date;                                //�µ�������
	private String cos;                                 //�������ѷֳ�
	private String start;                               //������
	private String stop;                                //Ŀ�ĵ�
	private int number;                                 //����Ŀǰ����
	private int state;                                  //�����Ŀ���״̬         ����״̬�����֣�0,1�ֱ��ʾ�����رպͿ���
    public Order(String username,int orderid,String date,String cos,String start,String stop,int number,int state ){
    	this.username = username;this.orderid = orderid;
    	this.date = date;  this.cos = cos;
    	this.start = start;  this.stop = stop;
    	this.number = number; this.state = state;
    }
    public Order(){
    	
    }
	public String getUsername() {                            //һϵ��get()set()����
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
