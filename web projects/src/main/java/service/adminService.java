package service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Admin;
import model.Fuel;
import model.Fuel_purchase;
import model.Service_purchase;
import model.Station;
import model.User;
import util.DBconnect;

public class adminService implements Admin{
	
	static boolean isSuccess = false;
	static Statement stmt;
	static String sql;
	
	//get station managers
	public List<User> getManagers()
	{
		List<User> user = new ArrayList<>();
		User users = null;
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT * FROM user WHERE usertype = 'manager'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int userID = rs.getInt(1);
				String nic = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String password = rs.getString(5);
				long mobile = rs.getLong(6);
				
				users = new User(userID, nic, name, email, password, mobile);
				user.add(users);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	
	//update managers
	public boolean updateManager(User user)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "UPDATE user SET nic = '"+user.getNic()+"', name = '"+user.getName()+"', email = '"+user.getEmail()+"', password = '"+user.getPassword()+"', "
					+ "mobile = '"+user.getMobile()+"' where userid = '"+user.getUser_id()+"'";
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
	
	//Get all Fuel Types
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
	
	//Add Fuel type
	public boolean InsertFuel(Fuel fuel)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "INSERT INTO fuel_types VALUES(0, '"+fuel.getFuel_type()+"', '"+fuel.getFuel_price()+"')";
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
	
	//update fuel types
	public boolean updateFuel(Fuel fuel)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "UPDATE fuel_types SET fuel_types = '"+fuel.getFuel_type()+"', liter_price = '"+fuel.getFuel_price()+"'"
					+ "WHERE fuelid = '"+fuel.getFuel_id()+"'";
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
	
	//Delete fuel type
	public void DeleteFuelType(int f_id)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "DELETE FROM fuel_types WHERE fuelid = '"+f_id+"'";
			stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//get All stations
	public List<Station> getStations()
	{
		List<Station> stations = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT * FROM stations";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int st_id = rs.getInt(1);
				int managerID = rs.getInt(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				long mobile = rs.getLong(5);
				String address = rs.getString(6);
				
				Station station = new Station(st_id, managerID, name, email, mobile, address);
				
				stations.add(station);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return stations;
	}
	
	//get all service purchase
	public List<Service_purchase> getService(int st_id)
	{
		
		System.out.println("from service " + st_id);
		
		List<Service_purchase> sp = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT sp.Spurchase, s.stationid, u.name, u.mobile, sp.cus_name, sp.cus_mobile, v.make, sp.description, sp.price, sp.status"
					+" FROM service_purchase sp "
					+" LEFT JOIN user u ON sp.userid = u.userid "
					+" LEFT JOIN vehicles v ON sp.vehicleid = v.vehicleid "
					+" LEFT JOIN stations s ON sp.stationid = s.stationid"
					+" WHERE sp.stationid = '"+st_id+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int sp_id = rs.getInt(1);
				int stationid = rs.getInt(2);
				String uName = rs.getString(3);
				long uMobile = rs.getLong(4);
				String cus_name = rs.getString(5);
				long cus_mobile = rs.getLong(6);
				String v_make = rs.getString(7);
				String description = rs.getString(8);
				double price = rs.getDouble(9);
				String status = rs.getString(10);
				
				Service_purchase service = new Service_purchase(sp_id, stationid, uName, uMobile, cus_name, cus_mobile, v_make, description, price, status);
				
				sp.add(service);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("from service : " + sp.isEmpty());
		
		return sp;
	}
	
	//get fuel purchase
	public List<Fuel_purchase> getFuelPurchase(int st_id)
	{
		List<Fuel_purchase> fp = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT fp.Fpurchaseid, s.stationid, f.fuel_types, u.name, u.mobile, fp.amount, fp.price "
					+ "FROM fuel_purchase fp "
					+ "LEFT JOIN stations s ON fp.stationid = s.stationid "
					+ "LEFT JOIN user u ON fp.userid = u.userid "
					+ "LEFT JOIN fuel_types f ON fp.fuelid = f.fuelid "
					+ "WHERE fp.stationid = '"+st_id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int fp_id = rs.getInt(1);
				int stationid = rs.getInt(2);
				String f_type = rs.getString(3);
				String name = rs.getString(4);
				long mobile = rs.getLong(5);
				double amount = rs.getDouble(6);
				double price = rs.getDouble(7);
				
				Fuel_purchase fuels = new Fuel_purchase(fp_id, stationid, f_type, name, mobile, amount, price);
				
				fp.add(fuels);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return fp;
	}
}
