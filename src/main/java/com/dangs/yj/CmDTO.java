package com.dangs.yj;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
public class CmDTO {
	
	private int cm_no;
	private String cm_user_id;
	private String cm_title;
	private String cm_text;
	private String cm_cate;
	private String cm_size;
	private String cm_img; // 게시글 이미지
	private int cm_like;
	private int cm_view;
	private Date cm_date;
	private String user_profile; // 게시글 작성자 프로필 사진

	
	public String toJSONbyMe() {
		Gson gson = new Gson();
		return gson.toJson(this);
		
	}
	
	
}
