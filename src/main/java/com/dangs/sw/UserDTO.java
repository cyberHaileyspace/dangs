package com.dangs.sw;

public class UserDTO {
	private String id;
	private String pw;
	private String name;
	private String no;

	public UserDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserDTO(String id, String pw, String name, String no) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", no=" + no + "]";
	}

}
