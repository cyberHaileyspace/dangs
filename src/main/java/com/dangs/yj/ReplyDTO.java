package com.dangs.yj;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;

@Data
public class ReplyDTO {
	private int cmr_no;
	private int cmr_post_no;
	private String cmr_user_id;
	private String cmr_text;
	private Date cmr_date;
	private String user_profile; // 댓글 작성자 프로필 사진
	
	
	
	public String toJSONbyMe() {
		Gson gson = new Gson();
		return gson.toJson(this);
		
	}

}
