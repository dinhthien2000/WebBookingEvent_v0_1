package phdhtl.cntt.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class connect {
	public static final String jdbcURL = "jdbc:mysql://localhost:3306/CD2_hoanchinh?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	public static final String jdbcUsername = "root";
	public static final String jdbcPassword = "";

	// phương thức kết nối với CSDL
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			System.out.println("sucsses connect");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;

	}
}
