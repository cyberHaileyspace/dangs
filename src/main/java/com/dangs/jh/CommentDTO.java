package com.dangs.jh;

import java.util.Date;

import com.google.gson.Gson;

public class CommentDTO {
	private String pc_user;
	private String pc_product;
	private String pc_comment;
	private Date pc_date;
	
	public CommentDTO() {
		
	}

	public CommentDTO(String pc_user, String pc_product, String pc_comment, Date pc_date) {
		super();
		this.pc_user = pc_user;
		this.pc_product = pc_product;
		this.pc_comment = pc_comment;
		this.pc_date = pc_date;
	}

	public String getPc_user() {
		return pc_user;
	}

	public void setPc_user(String pc_user) {
		this.pc_user = pc_user;
	}

	public String getPc_product() {
		return pc_product;
	}

	public void setPc_product(String pc_product) {
		this.pc_product = pc_product;
	}

	public String getPc_comment() {
		return pc_comment;
	}

	public void setPc_comment(String pc_comment) {
		this.pc_comment = pc_comment;
	}

	public Date getPc_date() {
		return pc_date;
	}

	public void setPc_date(Date pc_date) {
		this.pc_date = pc_date;
	}

	@Override
	public String toString() {
		return "CommentDTO [pc_user=" + pc_user + ", pc_product=" + pc_product + ", pc_comment=" + pc_comment
				+ ", pc_date=" + pc_date + "]";
	}
	
	public String toJSON() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
}
