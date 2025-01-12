package com.dangs.jh;

import com.google.gson.Gson;

public class DetailDTO {
	private String pd_product;
	private String pd_detail1;
	private String pd_detail2;
	private String pd_detail3;

	public DetailDTO() {

	}

	public DetailDTO(String pd_product, String pd_detail1, String pd_detail2, String pd_detail3) {
		super();
		this.pd_product = pd_product;
		this.pd_detail1 = pd_detail1;
		this.pd_detail2 = pd_detail2;
		this.pd_detail3 = pd_detail3;
	}

	public String getPd_product() {
		return pd_product;
	}

	public void setPd_product(String pd_product) {
		this.pd_product = pd_product;
	}

	public String getPd_detail1() {
		return pd_detail1;
	}

	public void setPd_detail1(String pd_detail1) {
		this.pd_detail1 = pd_detail1;
	}

	public String getPd_detail2() {
		return pd_detail2;
	}

	public void setPd_detail2(String pd_detail2) {
		this.pd_detail2 = pd_detail2;
	}

	public String getPd_detail3() {
		return pd_detail3;
	}

	public void setPd_detail3(String pd_detail3) {
		this.pd_detail3 = pd_detail3;
	}

	@Override
	public String toString() {
		return "DetailDTO [pd_product=" + pd_product + ", pd_detail1=" + pd_detail1 + ", pd_detail2=" + pd_detail2
				+ ", pd_detail3=" + pd_detail3 + "]";
	}

	public String toJSON() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
}
