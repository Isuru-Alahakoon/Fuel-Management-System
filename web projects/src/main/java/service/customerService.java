package service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Customer;
import model.Fuel;
import model.FuelStock;
import model.Fuel_purchase;
import model.Service_purchase;
import model.Station;
import model.User;
import model.Vehicle;
import util.DBconnect;

public class customerService implements Customer{
	
	static boolean isSuccess = false;
	//register
	public String Cus_register(User user)
	{
		try {
			Statement stmt = DBconnect.getConnection().createStatement();
			String checkEmailSql = "SELECT * FROM user WHERE email = '" + user.getEmail() + "'";
	        ResultSet rs = stmt.executeQuery(checkEmailSql);

	        if (rs.next()) {
	            return "email_exists";
	        }
			
			
			String sql = "INSERT INTO user VALUES (0, '"+user.getNic()+"' , '"+user.getName()+"', '"+user.getEmail()+"', '"+user.getPassword()+"', '"+user.getMobile()+"', '"+user.getUser_type()+"')";
			int result = stmt.executeUpdate(sql);
			
			if(result > 0)
			{
				return "success";
			}else {
				
				return "fail";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	//get customer vehicle details
	public List<Vehicle> get_vehicle_details(int userid) 
	{
		List<Vehicle> vehicle = new ArrayList<>();
		
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "select v.vehicleid, v.userid, v.brand, v.make , v.chasis_no, v.type "
					+ "from vehicles v "
					+ "left join user u on v.userid = u.userid "
					+ "where v.userid = '"+userid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int vehicle_id = rs.getInt(1);
				int user_id = rs.getInt(2);
				String brand = rs.getString(3);
				String make = rs.getString(4);
				String chasis_no = rs.getString(5);
				String type = rs.getString(6);
				
				Vehicle vehicles = new Vehicle(vehicle_id, user_id, brand, make, chasis_no, type); 
				vehicle.add(vehicles);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vehicle;
	}
	
	//Add customer Vehicle
	public boolean addvehicle(Vehicle vehicle)
	{
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "INSERT INTO vehicles VALUES (0 , '"+vehicle.getUser_id()+"' , '"+vehicle.getBrand()+"', '"+vehicle.getMake()+"', '"+vehicle.getChasis_no()+"', '"+vehicle.getType()+"')";
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
	
	//customer update vehicle details
	public boolean cusUpdateVehicle(Vehicle vehicle)
	
	{
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "UPDATE vehicles SET brand = '"+vehicle.getBrand()+"', make = '"+vehicle.getMake()+"', chasis_no = '"+vehicle.getChasis_no()+"', type = '"+vehicle.getType()+"'"
					+ "WHERE vehicleid = '"+vehicle.getVehicle_id()+"'";
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
	
	//customer delete vehicle
	public boolean deleteVehicle(int vehicleID)
	{
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "DELETE FROM vehicles WHERE vehicleid = '"+vehicleID+"'";
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
	
	//customer get stations
	public List<Station> getStations()
	{
		List<Station> stations = new ArrayList<>();
		
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "SELECT stationid , name from stations";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				
				int st_id = rs.getInt(1);
				String st_name = rs.getString(2);
				
				Station station = new Station(st_id, st_name);
				
				stations.add(station);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return stations;
	}
	
	
	//get all fuel types
	public List<Fuel> getFuel()
	{
		List<Fuel> fuels = new ArrayList<>();
		
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "SELECT * FROM fuel_types";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int fuel_id = rs.getInt(1);
				String fuel_types = rs.getString(2);
				double price = rs.getDouble(3);
				
				Fuel fuel = new Fuel(fuel_id, fuel_types, price);
				
				fuels.add(fuel);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fuels;
	}
	
	//get fuel type for an id
	public List<Fuel> getFuelType(int fuel_id)
	{
		List<Fuel> fuels = new ArrayList<>();
		
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "SELECT * FROM fuel_types WHERE fuelid = '"+fuel_id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int fuelid = rs.getInt(1);
				String fuel_types = rs.getString(2);
				double price = rs.getDouble(3);
				
				Fuel fuel = new Fuel(fuelid, fuel_types, price);
				
				fuels.add(fuel);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fuels;
	}
	
	//add service Purchase
	public boolean BookService(Service_purchase servicePurchase)
	{
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "INSERT INTO service_purchase (stationid, userid, vehicleid, description, payment_method)"
					+ "VALUES('"+servicePurchase.getStation_id()+"', '"+servicePurchase.getUser_id()+"', '"+servicePurchase.getVehicle_id()+"', "
							+ "'"+servicePurchase.getDescription()+"', '"+servicePurchase.getPay_method()+"')";
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
	
	//add fuel Purchase
	public boolean addFuelPurchase(Fuel_purchase fpurchase)
	{
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "INSERT INTO fuel_purchase (Fpurchaseid,stationid,fuelid,userid,amount,price,payment_method) VALUES(0, '"+fpurchase.getStation_id()+"', '"+fpurchase.getFuel_id()+"', "
					+ "'"+fpurchase.getUserid()+"', '"+fpurchase.getAmount()+"', '"+fpurchase.getPrice()+"', '"+fpurchase.getPay_method()+"')";
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
	
	//update fuel stock for customer order fuel
	public void updateFuelStock(int st_id, double amount, int fuelid)
	{
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "UPDATE fuel_stock SET amount = '"+amount+"' WHERE stationid = '"+st_id+"' AND fuelid = '"+fuelid+"'";
			stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//get fuel amount for fuelid
	public List<FuelStock> getFuelAmount(int fuelid, int stationid)
	{
		List<FuelStock> fuel_stock = new ArrayList<>();
		
		try {
			
			Statement stmt = DBconnect.getConnection().createStatement();
			String sql = "SELECT * FROM fuel_stock WHERE fuelid = '"+fuelid+"' AND stationid = '"+stationid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int stockid = rs.getInt(1);
				int st_id = rs.getInt(2);
				int fuel_id = rs.getInt(3);
				double amount = rs.getDouble(4);
				
				FuelStock fs = new FuelStock(stockid, fuel_id, amount);
				fuel_stock.add(fs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fuel_stock;
	}
}
