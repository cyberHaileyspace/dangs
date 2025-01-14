package com.dangs.jh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.main.DBManager;

public class ProductModel {

	public static void showDetail(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		String product_id = request.getParameter("product_id");
		System.out.println(product_id);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product_detail where pd_product=" + "'" + product_id + "'";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			DetailDTO detail = null;
			ArrayList<String> details = new ArrayList<String>();

			while (rs.next()) {
				detail = new DetailDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				details.add(detail.toJSON());
			}

			System.out.println("xxxxxxxxx" + details);
			response.getWriter().print(details);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public static void showComment(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		String product_id = request.getParameter("product_id");
		System.out.println(product_id);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product_comment where pc_product=" + "'" + product_id + "'";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			CommentDTO comment = null;
			ArrayList<String> comments = new ArrayList<String>();

			while (rs.next()) {
				comment = new CommentDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4));
				comments.add(comment.toJSON());
			}

			System.out.println("+++++++++" + comments);
			response.getWriter().print(comments);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}
}
