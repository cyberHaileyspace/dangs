package com.dangs.yj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.dangs.main.DBManager;

public class CmDAO {

	public static void selectAll(HttpServletRequest request) {
		// db
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cm_post";
		
		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			CmDTO cm_post = null;
			ArrayList<CmDTO> cm_posts = new ArrayList<CmDTO>();
			while (rs.next()) {
				cm_post = new CmDTO();
				cm_post.setCm_no(rs.getInt(1));
				cm_post.setCm_user_id(rs.getString(2));
				cm_post.setCm_title(rs.getString(3));
				cm_post.setCm_text(rs.getString(4));
				cm_post.setCm_cate(rs.getString(5));
				cm_post.setCm_size(rs.getString(6));
				cm_post.setCm_like(rs.getInt(7));
				cm_post.setCm_view(rs.getInt(8));
				cm_post.setCm_date(rs.getDate(9));
				
				cm_posts.add(cm_post);
			}
			request.setAttribute("cm_posts", cm_posts);
			
			
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
	}

	public static void getCm(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cm_post where cm_no=?";
		String num = request.getParameter("no");
		
		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery(); 
			
		if (rs.next()) {
			
			CmDTO getPost = new CmDTO();
			
			getPost.setCm_no(rs.getInt(1));
			getPost.setCm_user_id(rs.getString(2));
			getPost.setCm_title(rs.getString(3));
			getPost.setCm_text(rs.getString(4));
			getPost.setCm_cate(rs.getString(5));
			getPost.setCm_size(rs.getString(6));
			getPost.setCm_like(rs.getInt(7));
			getPost.setCm_view(rs.getInt(8));
			getPost.setCm_date(rs.getDate(9));
			
			request.setAttribute("getPost", getPost);
			
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}

}
