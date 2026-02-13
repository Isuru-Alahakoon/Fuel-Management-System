package model;

public class Attendant {
	
	private int attendant_id;
	
	private int user_id;
	private String name;
	private String email;
	private long mobile;
	
	private int station_id;

	public Attendant(int attendant_id, int user_id, String name, String email, long mobile, int station_id) {
		
		this.attendant_id = attendant_id;
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.station_id = station_id;
	}
	
	

	public Attendant(int station_id) {
		
		this.station_id = station_id;
	}



	public int getAttendant_id() {
		return attendant_id;
	}

	public void setAttendant_id(int attendant_id) {
		this.attendant_id = attendant_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public int getStation_id() {
		return station_id;
	}

	public void setStation_id(int station_id) {
		this.station_id = station_id;
	}
	
	

}
