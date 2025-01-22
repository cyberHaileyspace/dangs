package com.dangs.jm;

import java.sql.Date;

public class LocationDTO {
	private String id;
	private String user_id;
	private String title;
	private String address;
	private String content;
	private Date date;

	public LocationDTO() {
		// TODO Auto-generated constructor stub
	}

	public LocationDTO(String id, String user_id, String title, String address, String content, Date date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.title = title;
		this.address = address;
		this.content = content;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "LocationDTO [id=" + id + ", user_id=" + user_id + ", title=" + title + ", address=" + address
				+ ", content=" + content + ", date=" + date + "]";
	}

}
