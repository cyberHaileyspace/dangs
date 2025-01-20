package com.dangs.jh;

import java.util.Date;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {
	private String pc_user;
	private String pc_product;
	private String pc_comment;
	private Date pc_date;
	
	public String toJSON() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
}
