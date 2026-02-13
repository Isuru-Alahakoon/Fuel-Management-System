package service;


import java.sql.ResultSet;
import java.sql.Statement;

import model.User;
import util.DBconnect;

public class publicServices {
	
	//login
	public static User login(String email , String password)
	{
		User user = null;
		
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "SELECT * FROM user WHERE email = '"+email+"' AND password = '"+password+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int user_id = rs.getInt(1);
				String nic = rs.getString(2);
				String name = rs.getString(3);
				String Email = rs.getString(4);
				String Password = rs.getString(5);
				long mobile = rs.getLong(6);
				String user_type = rs.getString(7);
				
				user = new User(user_id, nic, name, Email, Password, mobile, user_type);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}

}
