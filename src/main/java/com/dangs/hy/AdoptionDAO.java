package com.dangs.hy;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class AdoptionDAO {

		public static void getInfoAPI() {
			try {
	            // API URL 설정
	            String apiURL = "http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo?numOfRows=100&";
	            
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
	            while ((line = br.readLine()) != null) {
	                response.append(line);
	            }
	            br.close();
	            System.out.println("Response: " + response.toString());

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
}
