package service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import model.Attendant;
import model.Fuel;
import model.FuelStock;
import model.Manager;
import model.Station;
import model.User;
import util.DBconnect;

public class managerService implements Manager{
	
	static boolean isSuccess = false;
	static Statement stmt;
	static String sql;
	
	//register as a manager
	public String register_manager(User user)
	{
		try {
			stmt = DBconnect.getConnection().createStatement();
			String checkEmailSql = "SELECT * FROM user WHERE email = '" + user.getEmail() + "'";
	        ResultSet rs = stmt.executeQuery(checkEmailSql);

	        if (rs.next()) {
	            return "email_exists";
	        }
			
			 
			 sql = "INSERT INTO user VALUES (0, '"+user.getNic()+"', '"+user.getName()+"', '"+user.getEmail()+"', '"+user.getPassword()+"', '"+user.getMobile()+"', '"+user.getUser_type()+"')";
			int results = stmt.executeUpdate(sql);
			
			if(results > 0)
			{
				 return "success";
			}
			else
			{
				 return "fail";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		
	}
	
	//manager get Station details
	public List<Station> getStations(int managerId)
	{
		List<Station> stations = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT * FROM stations WHERE managerid = '"+managerId+"' AND name IS NOT NULL";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int station_id = rs.getInt(1);
				int manager_id = rs.getInt(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				long mobile = rs.getLong(5);
				String address = rs.getString(6);
				
				Station station = new Station(station_id, manager_id, name, email, mobile, address);
				stations.add(station);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return stations;
	}

	//manager update station
	public boolean managerUpdateStation(Station station)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "UPDATE stations SET name = '"+station.getStation_name()+"', email = '"+station.getStation_email()+"', mobile = '"+station.getStation_mobile()+"', address = '"+station.getStation_address()+"'"
					+ "WHERE stationid = '"+station.getStation_id()+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//manager delete station
	public int deleteStation(int s_id)
	{
		Integer nullId = null;
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "UPDATE stations SET managerid = NULL , name = NULL, email = NULL, mobile = NULL, address = NULL WHERE stationid = '"+s_id+"'";
			stmt.executeUpdate(sql);
			
			String sIdSql = "SELECT stationid FROM stations WHERE name IS NULL";
			ResultSet rs = stmt.executeQuery(sIdSql);
			
			while(rs.next())
			{
				nullId = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return nullId;
	}
	
	
	//manager add station
	public boolean manager_add_station(Station station, Integer nullID)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			
			if(nullID != null)
			{
				String updateSql = "UPDATE stations SET managerid = '"+station.getManager_id()+"', name = '"+station.getStation_name()+"', email = '"+station.getStation_email()+"', "
						+ "mobile = '"+station.getStation_mobile()+"', address = '"+station.getStation_address()+"' WHERE stationid = '"+nullID+"'";
				int rs = stmt.executeUpdate(updateSql);
				
				if(rs > 0)
				{
					nullID = null;
					return true;
				}
				
			}
			
				String insertSql = "INSERT INTO stations VALUES (0, '"+station.getManager_id()+"', '"+station.getStation_name()+"', '"+station.getStation_email()+"' , "
						+ "'"+station.getStation_mobile()+"', '"+station.getStation_address()+"')";
				int insertRs = stmt.executeUpdate(insertSql);
				
				if(insertRs > 0)
				{
					isSuccess = true;
				}
				else
				{
					isSuccess = false;
				}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	//manager add attendants
	public boolean addAttendants(Attendant attendant , User user)
	{
		
		boolean isSuccess = false;
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			String user_sql = "INSERT INTO user VALUES(0, '"+user.getNic()+"', '"+user.getName()+"', '"+user.getEmail()+"', '"+user.getPassword()+"', "
					+ "'"+user.getMobile()+"', '"+user.getUser_type()+"')";
			int rows  = stmt.executeUpdate(user_sql, Statement.RETURN_GENERATED_KEYS);
			
			if(rows > 0)
			{
				ResultSet rs = stmt.getGeneratedKeys();
				
				if(rs.next())
				{
					int userID = rs.getInt(1);
					
					String attSql = "INSERT INTO attendant VALUES(0, '"+userID+"', '"+attendant.getStation_id()+"')";
					int attSql_rs = stmt.executeUpdate(attSql);
					
					 if (attSql_rs > 0) 
					 {
		                 isSuccess = true;
		             }
					 else
					 {
						 isSuccess = false;
					 }
				}
			}
			else 
			{
                System.out.println("No generated user ID found!");
            }
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		return isSuccess;
	}

	
	//get all attendants
	public List<Attendant> GetAttendants(int s_id)
	{
		
		List<Attendant> attendants = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT a.attendantid, a.userid, u.name, u.email, u.mobile, a.stationid "
					+ "FROM attendant a "
					+ "LEFT JOIN user u ON a.userid = u.userid "
					+ "WHERE a.stationid = '"+s_id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int a_id = rs.getInt(1);
				int u_id = rs.getInt(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				long mobile = rs.getLong(5);
				int stationId = rs.getInt(6);
				
				Attendant attendant = new Attendant(a_id, u_id, name, email, mobile, stationId);
				
				attendants.add(attendant);	
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return attendants;
	}
	
	//get all fuel stock details
	public List<FuelStock> getFuelStock(int station_id)
	{
		List<FuelStock> fuel_stock = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT fs.stockid, s.stationid, f.fuelid, f.fuel_types, fs.amount "
					+ "FROM fuel_stock fs "
					+ "LEFT JOIN stations s ON fs.stationid = s.stationid "
					+ "LEFT JOIN fuel_types f ON fs.fuelid = f.fuelid "
					+ "WHERE fs.stationid = '"+station_id+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int stock_id = rs.getInt(1);
				int stationId = rs.getInt(2);
				int fuel_id = rs.getInt(3);
				String fuel_type = rs.getString(4);
				double amount = rs.getDouble(5);
				
				FuelStock fs = new FuelStock(stock_id, stationId, fuel_id, fuel_type, amount);
				
				fuel_stock.add(fs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fuel_stock;
	}
	
	//Update Fuel Stock
	public boolean updateFuelStock(FuelStock fuel_stock)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			String sql = "UPDATE fuel_stock SET fuelid = '"+fuel_stock.getFuel_id()+"', amount = '"+fuel_stock.getFuel_amount()+"' WHERE stockid = '"+fuel_stock.getStock_id()+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false;
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//add fuel stock
	public boolean addFuelStock(FuelStock fuelStock)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "INSERT INTO fuel_stock VALUES(0, '"+fuelStock.getStation_id()+"', '"+fuelStock.getFuel_id()+"', '"+fuelStock.getFuel_amount()+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//delete fuel stock
	public void deleteFuelStock(int stock_id)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "DELETE FROM fuel_stock WHERE stockid = '"+stock_id+"'";
			stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//get all fuel types
	public List<Fuel> getFuels()
	{
		
		List<Fuel> fuel = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT * FROM fuel_types";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int fuel_id = rs.getInt(1);
				String fule_type = rs.getString(2);
				double fuel_price = rs.getDouble(3);
				
				Fuel fuels = new Fuel(fuel_id, fule_type, fuel_price);
				fuel.add(fuels);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fuel;
	}
	
}
