package model;

public class FuelStock {
	
	private int stock_id;
	private int station_id;
	
	private int fuel_id;
	private String fuel_type;
	
	private double fuel_amount;

	public FuelStock(int stock_id, int station_id, int fuel_id, double fuel_amount) {
		
		this.stock_id = stock_id;
		this.station_id = station_id;
		this.fuel_id = fuel_id;
		this.fuel_amount = fuel_amount;
	}

	public FuelStock(int stock_id, int station_id, String fuel_type, double fuel_amount) {
		
		this.stock_id = stock_id;
		this.station_id = station_id;
		this.fuel_type = fuel_type;
		this.fuel_amount = fuel_amount;
	}
	
	

	public FuelStock(int stock_id, int station_id, int fuel_id, String fuel_type, double fuel_amount) {
		
		this.stock_id = stock_id;
		this.station_id = station_id;
		this.fuel_id = fuel_id;
		this.fuel_type = fuel_type;
		this.fuel_amount = fuel_amount;
	}
	

	public FuelStock(int stock_id, int fuel_id, double fuel_amount) {
		
		this.stock_id = stock_id;
		this.fuel_id = fuel_id;
		this.fuel_amount = fuel_amount;
	}

	public FuelStock(int stock_id, String fuel_type, double fuel_amount) {
		
		this.stock_id = stock_id;
		this.fuel_type = fuel_type;
		this.fuel_amount = fuel_amount;
	}

	public int getStock_id() {
		return stock_id;
	}

	public void setStock_id(int stock_id) {
		this.stock_id = stock_id;
	}

	public int getStation_id() {
		return station_id;
	}

	public void setStation_id(int station_id) {
		this.station_id = station_id;
	}

	public int getFuel_id() {
		return fuel_id;
	}

	public void setFuel_id(int fuel_id) {
		this.fuel_id = fuel_id;
	}

	public String getFuel_type() {
		return fuel_type;
	}

	public void setFuel_type(String fuel_type) {
		this.fuel_type = fuel_type;
	}

	public double getFuel_amount() {
		return fuel_amount;
	}

	public void setFuel_amount(double fuel_amount) {
		this.fuel_amount = fuel_amount;
	}
	
	

}
