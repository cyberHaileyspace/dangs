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
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangs.main.DBManager;
import com.dangs.sw.UserDTO;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
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

		try (Connection con = DBManager.connect(); PreparedStatement pstmt = con.prepareStatement(sql)) {

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

	public String getAnimalDetail(String desertionNo) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select json_content from json_data_table";

		try {

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String jsonContent = rs.getString("json_content");

				JsonObject jsonObject = JsonParser.parseString(jsonContent).getAsJsonObject();
				JsonArray items = jsonObject.getAsJsonObject("response").getAsJsonObject("body")
						.getAsJsonObject("items").getAsJsonArray("item");

				for (JsonElement item : items) {
					JsonObject obj = item.getAsJsonObject();
					if (obj.get("desertionNo").getAsString().equals(desertionNo)) {
						return obj.toString();
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return null;

	}

	 @SuppressWarnings("resource") 
	 public void getDetailTwo(String desertionNo, HttpServletRequest request, HttpServletResponse response) {
		 
		 response.setContentType("application/json;charset=utf-8"); 
		 HttpSession hs = request.getSession(); 
		 UserDTO user = (UserDTO) hs.getAttribute("user");
		 String userId = user.getId(); 
		 System.out.println(desertionNo + "/" + userId);
	 
		 PreparedStatement pstmt = null; 
		 ResultSet rs = null; 
		 
		 String checkSql = "SELECT COUNT(*) FROM adoption_likes WHERE desertionNo = ? AND user_id = ?";
		 String insertSql = "INSERT INTO adoption_likes (desertionNo, user_id) VALUES (?, ?)";
		 
		 try { 
			 
			 con = DBManager.connect();
			 pstmt = con.prepareStatement(checkSql); 
			 pstmt.setString(1, desertionNo);
			 pstmt.setString(2, userId); 
			 rs = pstmt.executeQuery();
 
			 JsonObject jo = new JsonObject();
			 
			 if (rs.next() && rs.getInt(1) > 0) { 
				 
				 jo.addProperty("status", "fail");
				 jo.addProperty("message", "이미 관심 등록된 게시물입니다.");
				 response.getWriter().write(jo.toString()); 
				 return; } 
			 
			 pstmt = con.prepareStatement(insertSql); 
			 pstmt.setString(1, desertionNo);
			 pstmt.setString(2, userId);
	  
			 if (pstmt.executeUpdate()>0) { 
				jo.addProperty("status", "success");
			 	jo.addProperty("message", "관심 등록이 완료되었습니다."); 
			 } else {
			 	jo.addProperty("status", "fail"); 
			 	jo.addProperty("message", "관심 등록에 실패하였습니다."); 
			 } 
			 response.getWriter().write(jo.toString()); 
		} catch(Exception e) { 
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	 } finally {
		 DBManager.close(con, pstmt, rs); 
		 
	 } 
		 
	 }
	 

}
