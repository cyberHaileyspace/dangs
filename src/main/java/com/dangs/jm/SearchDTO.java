package com.dangs.jm;

public class SearchDTO {
	private String user_address;

	public SearchDTO() {
		// TODO Auto-generated constructor stub
	}

	public SearchDTO(String user_address) {
		super();
		this.user_address = user_address;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	@Override
	public String toString() {
		return "SearchDTO [user_address=" + user_address + "]";
	}

}
