package model;

import java.util.List;

public interface Customer {
	
	String Cus_register(User user);
	List<Vehicle> get_vehicle_details(int userid);
	boolean addvehicle(Vehicle vehicle);
	boolean cusUpdateVehicle(Vehicle vehicle);
	boolean deleteVehicle(int vehicleID);
	List<Station> getStations();
	List<Fuel> getFuel();
	List<Fuel> getFuelType(int fuel_id);
	boolean BookService(Service_purchase servicePurchase);
	boolean addFuelPurchase(Fuel_purchase fpurchase);
	void updateFuelStock(int st_id, double amount, int fuelid);
	List<FuelStock> getFuelAmount(int fuelid, int stationid);
}
