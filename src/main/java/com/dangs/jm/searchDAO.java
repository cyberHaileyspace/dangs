package com.dangs.jm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import com.dangs.main.DBManager;

public class searchDAO {

	public static void selectAllSearch(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String location = request.getParameter("locationInput");
		String sql = "select * from locationPostDB where location_post_address like '%' || ? || '%'";
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
				locationDTO = new LocationDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDate(6));
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

	public static void selectWritingSearch(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_id = request.getParameter("id");
		String sql = "select * from locationPostDB where location_post_user_id = ?";
		ArrayList<LocationDTO> results = new ArrayList<>();
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				LocationDTO locationDTO = new LocationDTO(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getDate(6));
				results.add(locationDTO);
			}
			request.setAttribute("ddd", results);
			System.out.println("ddd");
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
			String sql = "insert into locationPostDB (location_post_user_id, location_post_title, location_post_address, location_post_content) values (?, ?, ?, ?)";
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

	public static void deleteSearch(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "delete locationPostDB where location_post_id = ?";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("삭제 성공 !");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(null, pstmt, null);
		}
	}

	public static void getSearch(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from locationPostDB where location_post_id = ?";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				LocationDTO writing = new LocationDTO();
				writing.setId(rs.getString(1));
				writing.setUser_id(rs.getString(2));
				writing.setTitle(rs.getString(3));
				writing.setContent(rs.getString(5));
				/*
				 * String story02 = rs.getString(5).replaceAll("<br>", "\r\n");
				 * request.setAttribute("story02", story02); movie.setM_story(rs.getString(5));
				 */
				request.setAttribute("ddd", writing);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(null, pstmt, rs);
		}
	}

	public static void modiWriting(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = request.getParameter("id");
			System.out.println(id);
			System.out.println(title);
			System.out.println(content);
			String sql = "update locationPostDB set location_post_title = ?, location_post_content = ? where location_post_id = ?";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("수정 성공 !");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(null, pstmt, null);
		}
	}

}

// 업로드 기능
/* String story = request.getParameter("story"); */
// 서버상 올라간 파일명
/* story = story.replaceAll("\r\n", "<br>"); */
/* System.out.println(story); */