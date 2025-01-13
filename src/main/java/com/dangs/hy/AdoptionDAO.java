package com.dangs.hy;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dangs.main.DBManager;

public class AdoptionDAO {
	
		public static void getInfoAPI() {
			  Connection con  = null;
			  PreparedStatement pstmt = null;
			try {
	            // API URL 설정
	            String apiURL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?";
	            
	            // API Key 설정
	            String serviceKey = "PaQw4uKw%2FBnvpzwGrwVLUU3OEpMspXDv0IKVJS84H5bGSaAjVx%2BJh5J9vBdQhtZTt%2F6XhgoGCXaZpq0baUFjsA%3D%3D";
	            // 요청 파라미터 설정 (예시: 필요에 따라 수정)
	            String queryParams = "serviceKey=" + serviceKey + "&_type=json";

	            // URL 생성
	            URL url = new URL(apiURL + queryParams);

	            // HttpURLConnection 객체 생성
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET"); // 요청 방식 설정
	            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
	            conn.setDoOutput(true);

	            // 응답 코드 확인
	            int responseCode = conn.getResponseCode();
	            System.out.println("Response Code: " + responseCode);

	            // 응답 데이터 읽기
	            BufferedReader br;
	            if (responseCode == 200) { // 정상 응답
	                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	            } else { // 에러 응답
	                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	            }
	            
	            // 응답 출력
	            StringBuilder response = new StringBuilder(); 
	            String line;
	            while ((line = br.readLine()) != null) { // 데이터를 한 줄씩 읽어옴
	                response.append(line);
	            }
	            br.close();
				  br.close(); System.out.println(response.toString());
				 
				  String sql = "insert into json_data_table values(default,?)";
				  		
				  	con = DBManager.connect();
				  	pstmt = con.prepareStatement(sql);
				  	pstmt.setString(1, response.toString());
				  	if(pstmt.executeUpdate()==1)
				  		System.out.println("성공");
				  
				  
				  
	        } catch(Exception e){
	        	e.printStackTrace();
	        }
		}
		
}
