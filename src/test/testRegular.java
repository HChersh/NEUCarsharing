package test;

import java.util.regex.Pattern;

public class testRegular {

	public static void main(String[] args) {
		String re = "/^[1][358][0-9]{9}$/";
		boolean aa = Pattern.matches("^[1][358][0-9]{9}$", "13523395890");
//		System.out.println(aa);
		String emailtest = "^\\w+@([a-z0-9]+\\.)+[a-z]+$";
		boolean bb = Pattern.matches(emailtest, "845825101@qq.com");
		System.out.println(bb);

	}

}
