package order;

public class ApplicantMessage {
   int orderid;
   int number;
   String applicant;
   int state;
   
   public ApplicantMessage(int orderid,int number,String applicant,int state){
	   this.orderid = orderid;
	   this.number = number;
	   this.applicant = applicant;
	   this.state = state;
   }

   public ApplicantMessage(){
	   
   }
   
public int getOrderid() {
	return orderid;
}
public void setOrderid(int orderid) {
	this.orderid = orderid;
}
public int getNumber() {
	return number;
}
public void setNumber(int number) {
	this.number = number;
}
public String getApplicant() {
	return applicant;
}
public void setApplicant(String applicant) {
	this.applicant = applicant;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
   
}
