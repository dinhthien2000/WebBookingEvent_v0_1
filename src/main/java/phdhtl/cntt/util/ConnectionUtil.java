package phdhtl.cntt.util;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

//chọn cơ sở dữ liệu để kết nối
public class ConnectionUtil {
	
	 public static Connection getConnection(String dbURL, String userName, 
	            String password) {
	        Connection conn = null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            conn = (Connection) DriverManager.getConnection(dbURL, userName, password);
	            System.out.println("connect successfully!");
	        } catch (Exception ex) {
	            System.out.println("connect failure!");
	            ex.printStackTrace();
	        }
	        return conn;
	    }
}
