package com.dangs.hy;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.dangs.main.DBManager;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class AdoptionDAO {
	
	private static final AdoptionDAO ADAO = new AdoptionDAO();
	
	private static Connection con = null;

	private AdoptionDAO() {
		try {
			con = DBManager.connect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
	public static AdoptionDAO getAdao() {
		return ADAO;
	}
	
	
	// API를 DB에 저장
	
	public void getAPI(int pageNo, int numOfRows) {
			
			PreparedStatement pstmt = null;

			try {
	        
				// API URL 설정
	            String apiURL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?";
	            
	            // API Key 설정
	            String serviceKey = "PaQw4uKw%2FBnvpzwGrwVLUU3OEpMspXDv0IKVJS84H5bGSaAjVx%2BJh5J9vBdQhtZTt%2F6XhgoGCXaZpq0baUFjsA%3D%3D";
	            
	            String upkind = "417000";
	            
	            // 요청 파라미터 설정 (예시: 필요에 따라 수정)
	            String queryParams = String.format("serviceKey=%s&_type=json&upkind=%s&numOfRows=%d&pageNo=%d", 
	            								serviceKey, upkind , numOfRows, pageNo);
	            		

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
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	            StringBuilder response = new StringBuilder();
	            String line;
	            while ((line = br.readLine()) != null) {
	                response.append(line);
	            }
	            br.close();

	            // JSON 데이터 파싱
	            JsonObject jsonResponse = JsonParser.parseString(response.toString()).getAsJsonObject();
	            JsonArray items = jsonResponse
	                .getAsJsonObject("response")
	                .getAsJsonObject("body")
	                .getAsJsonObject("items")
	                .getAsJsonArray("item");

	            System.out.println("데이터 파싱 완료: " + items.size() + "개");

	            // SQL 쿼리 준비
	            String sql = """
	                MERGE INTO abandoned_animal_info target 
	                USING (SELECT ? AS desertionNo, ? AS json_data FROM dual) source ON (target.desertionNo = source.desertionNo)
	                WHEN MATCHED THEN
	                    UPDATE SET target.json_data = source.json_data, target.created_at = CURRENT_TIMESTAMP
	                WHEN NOT MATCHED THEN
	                    INSERT (desertionNo, json_data, created_at)
	                    VALUES (source.desertionNo, source.json_data, CURRENT_TIMESTAMP);
	            """;

	            // 데이터베이스 연결 및 SQL 실행
	            con = DBManager.connect();
	            pstmt = con.prepareStatement(sql);

	            for (int i = 0; i < items.size(); i++) {
	                JsonObject item = items.get(i).getAsJsonObject();
	                String desertionNo = item.get("desertionNo").getAsString();
	                String jsonData = item.toString();

	                pstmt.setString(1, desertionNo);
	                pstmt.setString(2, jsonData);

	                int result = pstmt.executeUpdate();
	                System.out.println("데이터 삽입/업데이트 결과: " + result + "행 처리됨 (desertionNo=" + desertionNo + ")");
	            }

	            System.out.println("데이터 삽입 완료: " + items.size() + "개");

	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            DBManager.close(con, pstmt, null);
	        }
	    }
	
	
	// 저장된 API 데이터를 호출
	
	@SuppressWarnings("deprecation")
	public List<JsonObject> getAdoptionData(int pageNo, int numOfRows) {
		List<JsonObject> dataList = new ArrayList<>(); // List<JsonObject> 생성
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		   String sql = """
			        SELECT json_data
			        FROM abandoned_animal_info
			        ORDER BY created_at DESC
			        LIMIT ? OFFSET ?;
			    """;		
		   // String jsonData = "";
		
		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			int offset = (pageNo - 1) * numOfRows;
			
			pstmt.setInt(1, numOfRows);
			pstmt.setInt(2, offset);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
	                String jsonData = rs.getString("json_data");
	                JsonObject jsonObject = JsonParser.parseString(jsonData).getAsJsonObject();
	                dataList.add(jsonObject);
	            }
	            
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return dataList;

	}
	
}



