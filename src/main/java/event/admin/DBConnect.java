package event.admin;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3308/event_management";
	private static String un = "root";
	private static String pw = "123456";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, un, pw);
			
		} catch (Exception e) {
			
			System.out.println("Connection faild!!");
		}
		
		return con;
	}

}