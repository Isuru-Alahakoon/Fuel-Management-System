package service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.FuelStock;
import model.Fuel_purchase;
import model.Service_purchase;
import model.Worker;
import util.DBconnect;

public class attendantService implements Worker{
	
	static boolean isSuccess = false;
	static Statement stmt;
	static String sql;
	
	//get Service Purchase details
	public List<Service_purchase> getServicePurchase(int attendant_id)
	{
		
		List<Service_purchase> service = new ArrayList<>();
		Service_purchase servicePurchase = null;
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "select sp.Spurchase, s.stationid, u.name,u.mobile ,sp.cus_name, sp.cus_mobile, v.make, sp.description, sp.price, sp.payment_method, sp.status, sp.date_time "
					+ "from service_purchase sp "
					+ "left join stations s on sp.stationid = s.stationid "
					+ "left join user u on sp.userid = u.userid "
					+ "left join vehicles v on sp.vehicleid = v.vehicleid "
					+ "join attendant a on sp.stationid = a.stationid "
					+ "where a.userid = '"+attendant_id+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int sp_id = rs.getInt(1);
				int s_id = rs.getInt(2);
				String u_name = rs.getString(3);
				long u_mobile = rs.getLong(4);
				String cus_name = rs.getString(5);
				long cus_mobile = rs.getLong(6);
				String v_make = rs.getString(7);
				String description = rs.getString(8);
				double price = rs.getDouble(9);
				String pay_method = rs.getString(10);
				String status = rs.getString(11);
				String date_time = rs.getString(12);
				
				servicePurchase = new Service_purchase(sp_id, s_id, u_name,u_mobile,cus_name, cus_mobile, v_make, description, price, pay_method, status, date_time);
			
				service.add(servicePurchase);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return service;
	}
	
	//get attendant's station id
	public int getAttendantStationId(int attendant_id)
	{
		
		int st_id = 0;
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT stationid FROM attendant WHERE userid = '"+attendant_id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				st_id = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return st_id;
	}
	
	//Add Service Purchase
	public boolean addServicePurchase(Service_purchase service)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "INSERT INTO service_purchase (Spurchase, stationid, cus_name, cus_mobile, description, price, payment_method, status, date_time) "
					+ "VALUES(0,'"+service.getStation_id()+"', '"+service.getManual_cusName()+"', '"+service.getCus_mobile()+"','"+service.getDescription()+"', '"+service.getPrice()+"', '"+service.getPay_method()+"', '"+service.getStatus()+"', '"+service.getDateTime()+"')";
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
	
	//update service purchase
	public boolean updateService(Service_purchase service)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "UPDATE service_purchase SET description = '"+service.getDescription()+"',price = '"+service.getPrice()+"', "
					+ "payment_method = '"+service.getPay_method()+"', status = '"+service.getStatus()+"', date_time = '"+service.getDateTime()+"' "
							+ "WHERE Spurchase = '"+service.getS_purchase_id()+"'";
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
	
	//delete service purchase
	public void deleteService(int sp_id)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "DELETE FROM service_purchase WHERE Spurchase = '"+sp_id+"'";
			stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//get fuel purchase
	public List<Fuel_purchase> getFuelPurchase(int attendant_id)
	{
		List<Fuel_purchase> fuelPurchase = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT fp.Fpurchaseid, s.name, f.fuel_types, u.name, u.mobile, fp.amount, fp.price, fp.payment_method, fp.date_time "
					+ "FROM fuel_purchase fp "
					+ "LEFT JOIN stations s ON fp.stationid = s.stationid "
					+ "LEFT JOIN fuel_types f ON fp.fuelid = f.fuelid "
					+ "LEFT JOIN user u ON fp.userid = u.userid "
					+ "JOIN attendant a ON a.stationid = s.stationid "
					+ "WHERE a.userid = '"+attendant_id+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int fPurchase_id = rs.getInt(1);
				String station_name = rs.getString(2);
				String fuel_type = rs.getString(3);
				String user_name = rs.getString(4);
				long mobile = rs.getLong(5);
				double fuel_amount = rs.getDouble(6);
				double price = rs.getDouble(7);
				String pay_method = rs.getString(8);
				String date_time = rs.getString(9);
				
				Fuel_purchase fp = new Fuel_purchase(fPurchase_id, station_name, fuel_type, user_name, mobile, fuel_amount, price, pay_method, date_time);
				
				fuelPurchase.add(fp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fuelPurchase;
	}
	
	//get fuel stock
	public List<FuelStock> getFuelStock(int st_id)
	{
		List<FuelStock> fuel_stock = new ArrayList<>();
		
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "SELECT fs.stockid,s.stationid,f.fuelid,f.fuel_types, fs.amount "
					+ "FROM fuel_stock fs "
					+ "LEFT JOIN fuel_types f ON fs.fuelid = f.fuelid "
					+ "LEFT JOIN stations s ON fs.stationid = s.stationid "
					+ "WHERE fs.stationid = '"+st_id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int stock_id = rs.getInt(1);
				int stationid = rs.getInt(2);
				int fuelid = rs.getInt(3);
				String fuel_type = rs.getString(4);
				double amount = rs.getDouble(5);
				
				FuelStock fs = new FuelStock(stock_id,stationid,fuelid,fuel_type, amount);
				
				fuel_stock.add(fs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fuel_stock;
	}
	
	//update fuel stock
	public boolean updateFuelStock(FuelStock fs)
	{
		try {
			
			stmt = DBconnect.getConnection().createStatement();
			sql = "UPDATE fuel_stock SET amount = '"+fs.getFuel_amount()+"' WHERE stationid = '"+fs.getStation_id()+"' AND fuelid ='"+fs.getFuel_id()+"'";
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
}
