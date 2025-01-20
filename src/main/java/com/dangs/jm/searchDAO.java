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
		String sql = "SELECT * FROM userDB WHERE user_address LIKE '%' || ? || '%'";
		SearchDTO sDTO = null;
		ArrayList<SearchDTO> results = new ArrayList<SearchDTO>();
		try {
			con = DBManager.connect();
			System.out.println("연결 성공!");
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String address = rs.getString(6);
				sDTO = new SearchDTO();
				sDTO.setUser_address(address);
				results.add(sDTO);
			}
			request.setAttribute("ddd", results);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

}
