package model;

public class User {
	
	private int user_id;
	private String nic;
	private String name;
	private String email;
	private String password;
	private long mobile;
	private String user_type;
	
	public User(int user_id, String nic, String name, String email, String password, long mobile, String user_type) {
	
		this.user_id = user_id;
		this.nic = nic;
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.user_type = user_type;
	}
	
	public User(int user_id, String nic, String name, String email, String password ,long mobile) {
		
		this.user_id = user_id;
		this.nic = nic;
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		
	}



	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	

}
