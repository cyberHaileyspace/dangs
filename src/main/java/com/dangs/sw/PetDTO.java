package com.dangs.sw;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetDTO {
    private int petId;
    private String userId;
    private String petName;
    private String petType;
    private String petPhoto;
    private String petSize;
    
    @JsonFormat(pattern="yyyy-MM-dd")  // 날짜를 지정된 형식으로 변환
    private Date petBirth;  // DB에서 받는 원래의 Date 타입
    private String petBirthStr;  // 변환된 날짜 문자열 (응답용)
    
    private String petGender;
    private String petDescription;
    

	public String toJSON() {
		Gson gson = new Gson();
		return gson.toJson(this);
		
	}
}