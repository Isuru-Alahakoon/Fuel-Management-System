package model;

import java.util.List;

public interface Worker {
	
	List<Service_purchase> getServicePurchase(int attendant_id);
	int getAttendantStationId(int attendant_id);
	boolean addServicePurchase(Service_purchase service);
	boolean updateService(Service_purchase service);
	void deleteService(int sp_id);
	List<Fuel_purchase> getFuelPurchase(int attendant_id);
	List<FuelStock> getFuelStock(int st_id);
	boolean updateFuelStock(FuelStock fs);
}
