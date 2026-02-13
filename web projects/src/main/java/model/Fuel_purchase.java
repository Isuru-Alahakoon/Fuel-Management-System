package model;

public class Fuel_purchase {
	
	private int F_purchase_id;
	
	private int station_id;
	private String station_name;
	
	private int fuel_id;
	private String fuel_type;
	
	private int userid;
	private String uname;
	private long uMobile;
	
	private double amount;
	private double price;
	private String pay_method;
	private String date_time;
	
	public Fuel_purchase(int station_id, int fuel_id, int userid, double amount, double price, String pay_method) {
		
		this.station_id = station_id;
		this.fuel_id = fuel_id;
		this.userid = userid;
		this.amount = amount;
		this.price = price;
		this.pay_method = pay_method;
	}
	
	

	public Fuel_purchase(int f_purchase_id, String station_name, String fuel_type, String uname, long uMobile,
			double amount, double price, String pay_method, String date_time) {
		
		F_purchase_id = f_purchase_id;
		this.station_name = station_name;
		this.fuel_type = fuel_type;
		this.uname = uname;
		this.uMobile = uMobile;
		this.amount = amount;
		this.price = price;
		this.pay_method = pay_method;
		this.date_time = date_time;
	}

	

	public Fuel_purchase(int f_purchase_id, int station_id, String fuel_type, String uname, long uMobile, double amount,
			double price) {
		
		F_purchase_id = f_purchase_id;
		this.station_id = station_id;
		this.fuel_type = fuel_type;
		this.uname = uname;
		this.uMobile = uMobile;
		this.amount = amount;
		this.price = price;
	}



	public String getUname() {
		return uname;
	}



	public void setUname(String uname) {
		this.uname = uname;
	}



	public long getuMobile() {
		return uMobile;
	}



	public void setuMobile(long uMobile) {
		this.uMobile = uMobile;
	}



	public int getF_purchase_id() {
		return F_purchase_id;
	}

	public void setF_purchase_id(int f_purchase_id) {
		F_purchase_id = f_purchase_id;
	}

	public int getStation_id() {
		return station_id;
	}

	public void setStation_id(int station_id) {
		this.station_id = station_id;
	}

	public String getStation_name() {
		return station_name;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
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

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getDate_time() {
		return date_time;
	}

	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	
	
	
}
