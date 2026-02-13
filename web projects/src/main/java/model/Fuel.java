package model;

public class Fuel {
	
	private int fuel_id;
	private String fuel_type;
	private double fuel_price;
	
	public Fuel(int fuel_id, String fuel_type, double fuel_price) {
		
		this.fuel_id = fuel_id;
		this.fuel_type = fuel_type;
		this.fuel_price = fuel_price;
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

	public double getFuel_price() {
		return fuel_price;
	}

	public void setFuel_price(int fuel_price) {
		this.fuel_price = fuel_price;
	}
	
	

}
