package com.dangs.jm;

public class userDTO {
	private String user_name;
	private String user_address;

	public userDTO() {
		// TODO Auto-generated constructor stub
	}

	public userDTO(String user_name, String user_address) {
		super();
		this.user_name = user_name;
		this.user_address = user_address;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	@Override
	public String toString() {
		return "userDTO [user_name=" + user_name + ", user_address=" + user_address + "]";
	}

}
