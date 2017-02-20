package order;

public class OrderItem {
   private int orderid;
   private String applicant;
   private int applicantstate;
   
   public OrderItem(int orderid,String applicant,int applicantstate){
	   this.orderid = orderid;
	   this.applicant = applicant;
	   this.applicantstate = applicantstate;
   }
   
   public OrderItem(){
	   
   }

public int getOrderid() {
	return orderid;
}

public void setOrderid(int orderid) {
	this.orderid = orderid;
}

public String getApplicant() {
	return applicant;
}

public void setApplicant(String applicant) {
	this.applicant = applicant;
}

public int getApplicantstate() {
	return applicantstate;
}

public void setApplicantstate(int applicantstate) {
	this.applicantstate = applicantstate;
}

public String toString(){
	return "orderid:" + orderid + " applicant:" + applicant + " applicantstate:" + applicantstate;
}
   
   
}
