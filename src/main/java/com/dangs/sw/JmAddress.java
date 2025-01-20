package com.dangs.sw;

import com.google.gson.Gson;

public class JmAddress {
	String address;
	
	public JmAddress() {
		// TODO Auto-generated constructor stub
	}

	public JmAddress(String address) {
		super();
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String toJSON() {
		Gson gson = new Gson();
		return gson.toJson(this);
		
	}
}
