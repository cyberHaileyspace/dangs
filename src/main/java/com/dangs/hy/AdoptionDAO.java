package com.dangs.hy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.main.DBManager;

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

	public void fetchAndSaveAllPages() {
		fetchAndSavePage1();
		fetchAndSavePage2();
		fetchAndSavePage3();
		fetchAndSavePage4();
	}

	public void fetchAndSavePage1() {
		getAnimalAPI(1);
	}

	public void fetchAndSavePage2() {
		getAnimalAPI(2);
	}

	public void fetchAndSavePage3() {
		getAnimalAPI(3);
	}

	public void fetchAndSavePage4() {
		getAnimalAPI(4);
	}

	// API를 DB에 저장
	public void getAnimalAPI(int pageNo) {

		PreparedStatement pstmt = null;

		try {

			// API 호출 URL 생성
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic");
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=PaQw4uKw%2FBnvpzwGrwVLUU3OEpMspXDv0IKVJS84H5bGSaAjVx%2BJh5J9vBdQhtZTt%2F6XhgoGCXaZpq0baUFjsA%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("upkind", "UTF-8") + "=" + URLEncoder.encode("417000", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("state", "UTF-8") + "=" + URLEncoder.encode("protect", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("neuter_yn", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
					+ URLEncoder.encode(String.valueOf(pageNo), "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("12", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			System.out.println("Response code: " + conn.getResponseCode());

			StringBuilder response = new StringBuilder();
			try (BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300 ? conn.getInputStream()
							: conn.getErrorStream()))) {
				String line;
				while ((line = reader.readLine()) != null) {
					response.append(line);
				}
			}

			// 데이터베이스에 JSON 데이터 저장
			String sql = "INSERT INTO json_data_table (id, json_content) VALUES (default, ?)";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, response.toString());
			pstmt.executeUpdate();

			System.out.println("Page " + pageNo + " data saved successfully.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public void handleJsonRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 페이지 번호 받기 (기본값: 1)
            int pageNo = Integer.parseInt(request.getParameter("pageNo"));

            // 데이터베이스에서 JSON 데이터 가져오기
            String jsonData = getJsonDataByPage(pageNo);

            if (jsonData != null) {
                // JSON 응답 전송
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonData);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"message\":\"Page not found.\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"message\":\"An error occurred.\"}");
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        }
    }

    private String getJsonDataByPage(int pageNo) {
        String jsonData = null;
        String sql = "SELECT json_content FROM json_data_table WHERE id = ?";

        try (Connection con = DBManager.connect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, pageNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    jsonData = rs.getString("json_content");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonData;
    }

	public void getAnimalDetail(String desertionNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select json_content from json_data_table";
		
		try {
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
		
		
	}
	
	
	
	
}
