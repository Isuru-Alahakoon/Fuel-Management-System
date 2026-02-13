package model;

import java.util.List;

public interface Admin {
	
	List<User> getManagers();
	boolean updateManager(User user);
	List<Fuel> getFuels();
	boolean InsertFuel(Fuel fuel);
	boolean updateFuel(Fuel fuel);
	void DeleteFuelType(int f_id);
	List<Station> getStations();
	List<Service_purchase> getService(int st_id);
}
