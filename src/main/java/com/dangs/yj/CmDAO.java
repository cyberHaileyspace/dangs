package com.dangs.yj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.main.DBManager;

public class CmDAO {
	
//	static ArrayList<CmDTO> cm_posts = null;

	public static void selectAll(HttpServletRequest request) {
		// db
		
		ArrayList<CmDTO> cm_posts = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cm_post";
		
		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			//CmDTO cm_post = null;
			//cm_posts = new ArrayList<CmDTO>();
			
			while (rs.next()) {
				CmDTO cm_post = new CmDTO();
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
			
			
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		request.setAttribute("cm_posts", cm_posts);
		
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

	public static void paging(int pageNum, HttpServletRequest request) {
		
		ArrayList<CmDTO> cm_posts = (ArrayList<CmDTO>) request.getAttribute("cm_posts");
	   
		
		// 현재 페이지 번호 설정
	    request.setAttribute("curPageNum", pageNum);

	    // 총 데이터 수와 한 페이지당 보여줄 개수
	    int total = cm_posts.size(); // 총 데이터 수
	    int cnt = 4; // 한 페이지당 보여줄 개수

	    // 총 페이지 수 계산
	    int pageCount = (int) Math.ceil((double) total / cnt); // 총 페이지 수
	    request.setAttribute("pageCount", pageCount);

	    // 시작과 끝 계산
	    int start = total - (cnt * (pageNum - 1)); // 시작 인덱스
	    int end = Math.max(start - cnt, 0);        // 끝 인덱스 (최소값 0 보장)

	    // 현재 페이지에 해당하는 데이터 가져오기
	    ArrayList<CmDTO> items = new ArrayList<>();
	    for (int j = start - 1; j >= end && j >= 0; j--) {
	        items.add(cm_posts.get(j));
	    }

	    // 결과를 request에 설정
	    request.setAttribute("cm_posts", items);
	}

	public static void searchCm(HttpServletRequest request, HttpServletResponse response) {
		
		
	}


}
