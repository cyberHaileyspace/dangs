package com.dangs.yj;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;


@Data
public class CmDTO {
	
	private int cm_no;
	private String cm_user_id;
	private String cm_title;
	private String cm_text;
	private String cm_cate;
	private String cm_size;
	private int cm_like;
	private int cm_view;
	private Date cm_date;
//	private String cm_img;
	
	
	public String toJSONbyMe() {
		Gson gson = new Gson();
		return gson.toJson(this);
		
	}
	
	
}
