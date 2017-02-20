package order;

public class ApplicationOrder {          //��Ӧ�û�����Ķ�����ʵ����
   private Order order;
   private int applicantstate;
   
   public ApplicationOrder(Order order,int applicantstate){
	   this.order = order;
	   this.applicantstate = applicantstate;
   }
   public ApplicationOrder(){
	   
   }
   public Order getOrder() {
	   return order;
   }
   public void setOrder(Order order) {
	   this.order = order;
   }
   public int getApplicantstate() {
	   return applicantstate;
   }
   public void setApplicantstate(int applicantstate) {
	   this.applicantstate = applicantstate;
   }
   
   public String toString(){
	   return order.toString()+" applicantstate:"+applicantstate;
   }
   
   
}
