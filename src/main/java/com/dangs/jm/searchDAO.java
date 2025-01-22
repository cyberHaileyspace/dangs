package com.dangs.jm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.dangs.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class searchDAO {

	public static void selectAllSearch(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String location = request.getParameter("locationInput");
		String sql = "select * from locationPostDB where location_post_address LIKE '%' || ? || '%'";
		// DTO는 항상 DB 보고 따라쓰기
		LocationDTO locationDTO = null;
		ArrayList<LocationDTO> results = new ArrayList<LocationDTO>();
		try {
			con = DBManager.connect();
			System.out.println("연결 성공 !");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, location);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// locationDTO = new LocationDTO();
				// locationDTO.setAddress(address);
				// System.out.println(locationDTO);
				locationDTO = new LocationDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6));
				results.add(locationDTO);
			}
			System.out.println(results);
			request.setAttribute("ddd", results);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void insertSearch(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String user_id = request.getParameter("user_id");
			String title = request.getParameter("title");
			String address = request.getParameter("address");
			String content = request.getParameter("content");
			System.out.println(user_id);
			System.out.println(title);
			System.out.println(address);
			System.out.println(content);
			String sql = "INSERT INTO locationPostDB (location_post_user_id, location_post_title, location_post_address, location_post_content) VALUES (?, ?, ?, ?)";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, title);
			pstmt.setString(3, address);
			pstmt.setString(4, content);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공 !");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(null, pstmt, null);
		}
	}

}
