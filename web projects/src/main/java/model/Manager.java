package model;

import java.util.List;

public interface Manager{
	
	List<FuelStock> getFuelStock(int station_id);
	boolean updateFuelStock(FuelStock fuel_stock);
	boolean addFuelStock(FuelStock fuelStock);
	void deleteFuelStock(int stock_id);
	List<Fuel> getFuels();
	List<Attendant> GetAttendants(int s_id);
	boolean addAttendants(Attendant attendant , User user);
	boolean manager_add_station(Station station, Integer nullID);
	int deleteStation(int s_id);
	boolean managerUpdateStation(Station station);
	List<Station> getStations(int managerId);
	String register_manager(User user);
}
