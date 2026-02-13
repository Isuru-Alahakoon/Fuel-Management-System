package model;

public class Vehicle {
	
	private int vehicle_id;
	
	private int user_id;
	private String user_name;
	
	private String brand;
	private String make;
	private String chasis_no;
	private String type;
	
	public Vehicle(int vehicle_id, int user_id, String brand, String make, String chasis_no, String type) {
		
		this.vehicle_id = vehicle_id;
		this.user_id = user_id;
		this.brand = brand;
		this.make = make;
		this.chasis_no = chasis_no;
		this.type = type;
	}

	public Vehicle(int vehicle_id, String user_name, String brand, String make, String chasis_no, String type) {
		
		this.vehicle_id = vehicle_id;
		this.user_name = user_name;
		this.brand = brand;
		this.make = make;
		this.chasis_no = chasis_no;
		this.type = type;
	}
	
	public Vehicle(int vehicle_id, String brand, String make, String chasis_no, String type) {
		
		this.vehicle_id = vehicle_id;
		this.brand = brand;
		this.make = make;
		this.chasis_no = chasis_no;
		this.type = type;
	}

	public int getVehicle_id() {
		return vehicle_id;
	}

	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getChasis_no() {
		return chasis_no;
	}

	public void setChasis_no(String chasis_no) {
		this.chasis_no = chasis_no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
