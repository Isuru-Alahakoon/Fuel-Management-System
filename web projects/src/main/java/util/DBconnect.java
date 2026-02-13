package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		String url = "jdbc:mysql://localhost:3306/vehicle_service";
		String username = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		
		return con;
	}

}
