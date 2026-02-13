package model;

public class Service_purchase {
	
	private int s_purchase_id;
	
	private int station_id;
	private String station_name;
	
	private int user_id;
	private String auto_user_name;
	private long auto_user_mobile;
	
	private String manual_cusName;
	private long cus_mobile;
	
	private int vehicle_id;
	private String vehicle_name;
	
	private String description;
	private double price;
	private String pay_method;
	private String status;
	private String dateTime;
	private double sumPrice;
	
	public Service_purchase(int s_purchase_id, int station_id, int user_id, String manual_cusName, long cus_mobile,
			int vehicle_id, String description, double price, String pay_method, String status, String dateTime) {
		
		this.s_purchase_id = s_purchase_id;
		this.station_id = station_id;
		this.user_id = user_id;
		this.manual_cusName = manual_cusName;
		this.cus_mobile = cus_mobile;
		this.vehicle_id = vehicle_id;
		this.description = description;
		this.price = price;
		this.pay_method = pay_method;
		this.status = status;
		this.dateTime = dateTime;
	}

	public Service_purchase(int s_purchase_id, String station_name, String auto_user_name, String manual_cusName,
			long cus_mobile, String vehicle_name, String description, double price, String pay_method, String status,
			String dateTime) {
		
		this.s_purchase_id = s_purchase_id;
		this.station_name = station_name;
		this.auto_user_name = auto_user_name;
		this.manual_cusName = manual_cusName;
		this.cus_mobile = cus_mobile;
		this.vehicle_name = vehicle_name;
		this.description = description;
		this.price = price;
		this.pay_method = pay_method;
		this.status = status;
		this.dateTime = dateTime;
	}

	public Service_purchase(int s_purchase_id, int station_id, String auto_user_name, long auto_user_mobile,String manual_cusName,
			long cus_mobile, String vehicle_name, String description, double price, String pay_method, String status,
			String dateTime) {
		
		this.s_purchase_id = s_purchase_id;
		this.station_id = station_id;
		this.auto_user_name = auto_user_name;
		this.auto_user_mobile = auto_user_mobile;
		this.manual_cusName = manual_cusName;
		this.cus_mobile = cus_mobile;
		this.vehicle_name = vehicle_name;
		this.description = description;
		this.price = price;
		this.pay_method = pay_method;
		this.status = status;
		this.dateTime = dateTime;
	}
	
	public Service_purchase(int s_purchase_id, int station_id, String manual_cusName, long cus_mobile, String description, double price,
			String pay_method, String status, String dateTime) {
		
		this.s_purchase_id = s_purchase_id;
		this.station_id = station_id;
		this.manual_cusName = manual_cusName;
		this.cus_mobile = cus_mobile;
		this.description = description;
		this.price = price;
		this.pay_method = pay_method;
		this.status = status;
		this.dateTime = dateTime;
	}
	
	
	public Service_purchase(int s_purchase_id, String description,double price, String pay_method, String status,
			String dateTime) {
		
		this.s_purchase_id = s_purchase_id;
		this.description = description;
		this.price = price;
		this.pay_method = pay_method;
		this.status = status;
		this.dateTime = dateTime;
	}
	
	public Service_purchase(int station_id, int user_id, int vehicle_id, String description, String pay_method) {
		super();
		this.station_id = station_id;
		this.user_id = user_id;
		this.vehicle_id = vehicle_id;
		this.description = description;
		this.pay_method = pay_method;
	}
	

	public Service_purchase(int s_purchase_id, int station_id, String auto_user_name, long auto_user_mobile,
			String manual_cusName, long cus_mobile, String vehicle_name, String description, double price,
			String status) {
		
		this.s_purchase_id = s_purchase_id;
		this.station_id = station_id;
		this.auto_user_name = auto_user_name;
		this.auto_user_mobile = auto_user_mobile;
		this.manual_cusName = manual_cusName;
		this.cus_mobile = cus_mobile;
		this.vehicle_name = vehicle_name;
		this.description = description;
		this.price = price;
		this.status = status;
	}
	
	

	public double getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(double sumPrice) {
		this.sumPrice = sumPrice;
	}

	public long getAuto_user_mobile() {
		return auto_user_mobile;
	}

	public void setAuto_user_mobile(long auto_user_mobile) {
		this.auto_user_mobile = auto_user_mobile;
	}

	public int getS_purchase_id() {
		return s_purchase_id;
	}

	public void setS_purchase_id(int s_purchase_id) {
		this.s_purchase_id = s_purchase_id;
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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAuto_user_name() {
		return auto_user_name;
	}

	public void setAuto_user_name(String auto_user_name) {
		this.auto_user_name = auto_user_name;
	}

	public String getManual_cusName() {
		return manual_cusName;
	}

	public void setManual_cusName(String manual_cusName) {
		this.manual_cusName = manual_cusName;
	}

	public long getCus_mobile() {
		return cus_mobile;
	}

	public void setCus_mobile(long cus_mobile) {
		this.cus_mobile = cus_mobile;
	}

	public int getVehicle_id() {
		return vehicle_id;
	}

	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}

	public String getVehicle_name() {
		return vehicle_name;
	}

	public void setVehicle_name(String vehicle_name) {
		this.vehicle_name = vehicle_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	

}
