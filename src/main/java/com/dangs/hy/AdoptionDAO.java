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
import java.util.ArrayList;
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
	public void getPostDetail(String desertionNo, HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("application/json;charset=utf-8");
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user");
		String userId = user.getId();
		System.out.println(desertionNo + "/" + userId);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String checkSql = "SELECT COUNT(*) FROM adoption_likes WHERE desertionNo = ? AND user_id = ?";

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
				return;

			}

			String insertSql = "INSERT INTO adoption_likes (desertionNo, user_id) VALUES (?, ?)";

			pstmt = con.prepareStatement(insertSql);
			pstmt.setString(1, desertionNo);
			pstmt.setString(2, userId);

			if (pstmt.executeUpdate() > 0) {
				jo.addProperty("status", "success");
				jo.addProperty("message", "관심 등록이 완료되었습니다.");
			} else {
				jo.addProperty("status", "fail");
				jo.addProperty("message", "관심 등록에 실패하였습니다.");
			}
			response.getWriter().write(jo.toString());
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		} finally {
			DBManager.close(con, pstmt, rs);

		}

	}


	public static void likeCheck(HttpServletRequest request, HttpServletResponse response) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO user = (UserDTO) request.getSession().getAttribute("user");
		String adoptLikesVal = request.getParameter("adoptLikesVal");
		String chk = request.getParameter("chk"); // -1 : detail load / 1 : 하트가 눌려진 상태 / 0 : 빈 하트 상태

		System.out.println(adoptLikesVal);
		System.out.println(user.getId());
		System.out.println(chk);
		
		int val = -1;
		String sql = "select count(*) from adoption_likes where user_id = ? and desertionno = ?"; // 1이면 있는거 0이면 insert해야되는거.
		if(chk.equals("1")) {
			sql = "delete adoption_likes where user_id=? and desertionno = ?";
			val = 0;
		}else if (chk.equals("0")) {
			sql = "insert into adoption_likes(user_id, desertionno, created_at) values (?,?,sysdate)";
		    val = 1;
		}
		
		try {
			response.setContentType("application/json;charset=utf-8");
			con = DBManager.connect();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getId());
			ps.setString(2, adoptLikesVal);
			
			if (chk.equals("-1")) {
				rs = ps.executeQuery();
				rs.next(); // 1,0
				int check = rs.getInt(1);
				System.out.println(check);
				response.getWriter().print(check);
			}else {
				ps.executeUpdate();
				response.getWriter().print(val);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, null, null);
		}
		
		
	}

	public void getUserFavorites(String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT" +
			    "    l.desertionno," +
			    "    jt.desertion_no," +
			    "    jt.filename," +
			    "    jt.happen_dt," +
			    "    jt.happen_place," +
			    "    jt.kind_cd," +
			    "    jt.color_cd," +
			    "    jt.age," +
			    "    jt.weight," +
			    "    jt.notice_no," +
			    "    jt.notice_sdt," +
			    "    jt.notice_edt," +
			    "    jt.process_state," +
			    "    jt.sex_cd," +
			    "    jt.neuter_yn," +
			    "    jt.special_mark," +
			    "    jt.care_nm," +
			    "    jt.care_tel," +
			    "    jt.care_addr," +
			    "    jt.org_nm," +
			    "    jt.charge_nm," +
			    "    jt.officetel" +
			    "    jt.popfile" +
			    " FROM" +
			    "    adoption_likes l" +
			    " JOIN (" +
			    "    SELECT" +
			    "        jt.desertion_no," +
			    "        jt.filename," +
			    "        jt.happen_dt," +
			    "        jt.happen_place," +
			    "        jt.kind_cd," +
			    "        jt.color_cd," +
			    "        jt.age," +
			    "        jt.weight," +
			    "        jt.notice_no," +
			    "        jt.notice_sdt," +
			    "        jt.notice_edt," +
			    "        jt.process_state," +
			    "        jt.sex_cd," +
			    "        jt.neuter_yn," +
			    "        jt.special_mark," +
			    "        jt.care_nm," +
			    "        jt.care_tel," +
			    "        jt.care_addr," +
			    "        jt.org_nm," +
			    "        jt.charge_nm," +
			    "        jt.officetel," +
			    "        jt.popfile" +
			    "    FROM" +
			    "        json_data_table d," +
			    "        JSON_TABLE(" +
			    "            d.json_content," +
			    "            '$.response.body.items.item[*]'" +
			    "            COLUMNS (" +
			    "                desertion_no VARCHAR2(4000) PATH '$.desertionNo'," +
			    "                filename VARCHAR2(4000) PATH '$.filename'," +
			    "                happen_dt VARCHAR2(10) PATH '$.happenDt'," +
			    "                happen_place VARCHAR2(4000) PATH '$.happenPlace'," +
			    "                kind_cd VARCHAR2(4000) PATH '$.kindCd'," +
			    "                color_cd VARCHAR2(4000) PATH '$.colorCd'," +
			    "                age VARCHAR2(10) PATH '$.age'," +
			    "                weight VARCHAR2(10) PATH '$.weight'," +
			    "                notice_no VARCHAR2(4000) PATH '$.noticeNo'," +
			    "                notice_sdt VARCHAR2(10) PATH '$.noticeSdt'," +
			    "                notice_edt VARCHAR2(10) PATH '$.noticeEdt'," +
			    "                process_state VARCHAR2(4000) PATH '$.processState'," +
			    "                sex_cd VARCHAR2(1) PATH '$.sexCd'," +
			    "                neuter_yn VARCHAR2(1) PATH '$.neuterYn'," +
			    "                special_mark VARCHAR2(4000) PATH '$.specialMark'," +
			    "                care_nm VARCHAR2(4000) PATH '$.careNm'," +
			    "                care_tel VARCHAR2(20) PATH '$.careTel'," +
			    "                care_addr VARCHAR2(4000) PATH '$.careAddr'," +
			    "                org_nm VARCHAR2(4000) PATH '$.orgNm'," +
			    "                charge_nm VARCHAR2(4000) PATH '$.chargeNm'," +
			    "                officetel VARCHAR2(20) PATH '$.officetel'," +
			    "                popfile VARCHAR2(4000) PATH '$.popfile'" +
			    "            )" +
			    "        ) jt" +
			    " ) jt" +
			    " ON" +
			    "    l.desertionno = jt.desertion_no" +
			    " WHERE" +
			    "    l.user_id = ?;";
		
		JsonArray resultArray = new JsonArray();

		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("desertionNo", rs.getString("desertionno"));
				jsonObj.addProperty("kindCd", rs.getString("kind_cd"));
				jsonObj.addProperty("age", rs.getString("age"));
				jsonObj.addProperty("happenPlace", rs.getString("happen_place"));
				jsonObj.addProperty("sexCd", rs.getString("sex_cd"));
				jsonObj.addProperty("neuterYn", rs.getString("neuter_yn"));
				jsonObj.addProperty("popfile", rs.getString("popfile"));
				resultArray.add(jsonObj);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	
	

		

	}
	
}
