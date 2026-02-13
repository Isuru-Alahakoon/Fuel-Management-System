package model;

public class Station {
	
	private int station_id;
	
	private int manager_id;
	private String manager_name;
	
	private String station_name;
	private String station_email;
	private long station_mobile;
	private String station_address;
	
	public Station(int station_id, int manager_id, String station_name, String station_email, long station_mobile, String station_address) {
		
		this.station_id = station_id;
		this.manager_id = manager_id;
		this.station_name = station_name;
		this.station_email = station_email;
		this.station_mobile = station_mobile;
		this.station_address = station_address;
	}

	public Station(int station_id, String manager_name, String station_name, String station_email, long station_mobile, String station_address) {
		
		this.station_id = station_id;
		this.manager_name = manager_name;
		this.station_name = station_name;
		this.station_email = station_email;
		this.station_mobile = station_mobile;
		this.station_address = station_address;
	}

	public Station(int station_id, String station_name, String station_email, long station_mobile, String station_address) {
		
		this.station_id = station_id;
		this.station_name = station_name;
		this.station_email = station_email;
		this.station_mobile = station_mobile;
		this.station_address = station_address;
	}
	
	public Station(int station_id, String station_name) {
		
		this.station_id = station_id;
		this.station_name = station_name;
	}

	public int getStation_id() {
		return station_id;
	}

	public void setStation_id(int station_id) {
		this.station_id = station_id;
	}

	public int getManager_id() {
		return manager_id;
	}

	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getStation_name() {
		return station_name;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}

	public String getStation_email() {
		return station_email;
	}

	public void setStation_email(String station_email) {
		this.station_email = station_email;
	}

	public long getStation_mobile() {
		return station_mobile;
	}

	public void setStation_mobile(long station_mobile) {
		this.station_mobile = station_mobile;
	}

	public String getStation_address() {
		return station_address;
	}

	public void setStation_address(String station_address) {
		this.station_address = station_address;
	}
	
	
}
