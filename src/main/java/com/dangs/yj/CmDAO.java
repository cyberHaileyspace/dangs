package com.dangs.yj;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangs.main.DBManager;
import com.dangs.sw.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CmDAO {
	
	static ArrayList<CmDTO> cm_posts;

	public static void selectAll(HttpServletRequest request) {
		// db
		
		cm_posts = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cm_post order by cm_date";
		
		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
//			CmDTO cm_post = null;
//			cm_posts = new ArrayList<CmDTO>();
			
			while (rs.next()) {
				CmDTO cm_post = new CmDTO();
				cm_post.setCm_no(rs.getInt(1));
				cm_post.setCm_user_id(rs.getString(2));
				cm_post.setCm_title(rs.getString(3));
				cm_post.setCm_text(rs.getString(4));
				cm_post.setCm_cate(rs.getString(5));
				cm_post.setCm_size(rs.getString(6));
				cm_post.setCm_img(rs.getString(7));
				cm_post.setCm_like(rs.getInt(8));
				cm_post.setCm_view(rs.getInt(9));
				cm_post.setCm_date(rs.getDate(10));
				
				cm_posts.add(cm_post);
			}
			
			
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		request.setAttribute("cm_posts", cm_posts);
		
	}

	@SuppressWarnings("resource")
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
			getPost.setCm_img(rs.getString(7));
			getPost.setCm_like(rs.getInt(8));
			getPost.setCm_view(rs.getInt(9));
			getPost.setCm_date(rs.getDate(10));
			
			
			String sqlTwo = "select * from userDB where user_id = ?";
			pstmt = con.prepareStatement(sqlTwo);
			pstmt.setString(1, getPost.getCm_user_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				getPost.setUser_profile(rs.getString(4));
				request.setAttribute("getPost", getPost);
			}
			
			
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}

	public static void paging(int pageNum, HttpServletRequest request) {
		
		request.setAttribute("curPageNum", pageNum);
		
		int total = cm_posts.size(); //총데이터수
		int cnt = 4; //한페이지당보여줄개수
		
		// 페이지 수 == 마지막 페이지 번호
		int pageCount =(int) Math.ceil((double)total/ cnt); //총페이지수
		System.out.println(pageCount); //페이지 개수(총페이지수)
		request.setAttribute("pageCount", pageCount);
		
		//int pageNum = 1; //페이지번호
		
		//시작,끝
		int start = total - (cnt * (pageNum - 1));
		int end = (pageNum == pageCount) ? -1 : start - (cnt + 1);
		
		ArrayList<CmDTO> items = new ArrayList<CmDTO>();
		
		
		for (int i = start - 1; i > end; i--) {
			items.add(cm_posts.get(i));
		}
		
		request.setAttribute("cm_posts", items);
	}

	public static void searchCm(HttpServletRequest request, HttpServletResponse response) {
		
			// db or 값 (파라미터)
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
//			String val = request.getParameter("cmTitle");
//			String sql = "select * from cm_post where cm_title like'%' ||?||'%'";
		
			
			String title = request.getParameter("cmTitle");
			String menu = request.getParameter("menu");
			String size = request.getParameter("size");
			String sql = null;
			String val = null;
			System.out.println(title);
			System.out.println(menu);
			System.out.println(size);
			
			
			if(title != null) {
				sql = "select * from cm_post where cm_title like '%'||?||'%'";
				val = title;
				System.out.println("---------");
				System.out.println(val);
				System.out.println("---------");
				
			} else if(menu != null) {
				sql = "select * from cm_post where cm_cate like '%'||?||'%'";
				val = menu;
				System.out.println("---------");
				System.out.println(val);
				System.out.println("---------");	
				
			}else if(size!=null) {
				sql = "select * from cm_post where cm_size like '%'||?||'%'";
				val = size;
				System.out.println("---------");
				System.out.println(val);
				System.out.println("---------");	
			}
			
			
//			if(val == null) {
//				sql = "select * from cm_post where cm_cate like '%'||?||'%'";
//				val = request.getParameter("menu");
//				System.out.println("---------");
//				System.out.println(val);
//				System.out.println("---------");
//				
//			}
			
			try {
				con = DBManager.connect();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, val);
				
				rs = pstmt.executeQuery();
				
				//ArrayList<ReviewDTO> reviews = new ArrayList<ReviewDTO>(); json으로 교체
				ArrayList<String> cmPosts = new ArrayList<String>();
				CmDTO i = null;
				
				while (rs.next()) {
					i = new CmDTO();
					i.setCm_no(rs.getInt(1));
					i.setCm_user_id(rs.getString(2));
					i.setCm_title(rs.getString(3));
					i.setCm_text(rs.getString(4));
					i.setCm_cate(rs.getString(5));
					i.setCm_size(rs.getString(6));
					i.setCm_img(rs.getString(7));
					i.setCm_like(rs.getInt(8));
					i.setCm_view(rs.getInt(9));
					i.setCm_date(rs.getDate(10));
				cmPosts.add(i.toJSONbyMe());
					
				}
				
				System.out.println(cmPosts);
				System.out.println(cmPosts.size());
				
				// lib -> cos 파일업 / json simple /		지금은 Gson
				
//				response.getWriter().print("<body>");
				
				response.setContentType("application/json; charset=utf-8");
				response.getWriter().print(cmPosts);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(con, pstmt, rs);
			}
			
			
			
			
		
		
	}

	public static void addCm(HttpServletRequest request) throws UnsupportedEncodingException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getServletContext().getRealPath("img/post");
		System.out.println(path);
		MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());
		
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user");
		String userID = user.getId();
		
		String sql = 
		"INSERT INTO cm_post (cm_user_id, cm_title, cm_text, cm_cate, cm_size, cm_img) "
		+ "VALUES (?, ?, ?, ?, ?, ?)";
		
		
		//String title = request.getParameter("title");
		//String txt = request.getParameter("txt");
		String category = mr.getParameter("cm-category");
		String type = mr.getParameter("cm-dog");
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("ir1");
		String file = mr.getFilesystemName("file");
		
		String img = null;
		
		if (file == null) {
			img = "dog-nose.png";
		}else {
			img = file;
		}
		System.out.println(category);
		System.out.println(type);
		System.out.println(title);
		System.out.println(content);
		System.out.println(img);
		System.out.println("====================");

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userID);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, category);
			pstmt.setString(5, type);
			pstmt.setString(6, img);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, null);
		}
		
	}
		
	// 사진까지 교체 가능한 수정 기능. ↓
	public static void updateCm(HttpServletRequest request) {
			
		// 값 or db
					
		String path = request.getServletContext().getRealPath("img/post");
		System.out.println(path);
		
		Connection con = null;
		PreparedStatement pstmt = null;
					
		//업로드 기능
		try {
		MultipartRequest mr = new MultipartRequest(request, path, 1024* 1024 * 20, "utf-8",
		new DefaultFileRenamePolicy());
					
		String no = mr.getParameter("updateCmNo");
		System.out.println(no);
		String category = mr.getParameter("cm-category");
		String type = mr.getParameter("cm-dog");
			
		String title = mr.getParameter("title");
		String content = mr.getParameter("ir1");
		String file = mr.getFilesystemName("file");
						
		//서버상 올라간 파일명
		String newImg = mr.getFilesystemName("newImg");
		String oldImg = mr.getParameter("oldImg");
		content = content.replaceAll("\r\n", "<br>");
						
		System.out.println(no);
		System.out.println(title);
		System.out.println(content);
		System.out.println(category);
		System.out.println(type);
		System.out.println(newImg);
		System.out.println(oldImg);
		

		String sql = "update cm_post set cm_title=?, cm_text=?, cm_cate=?, cm_size=?, cm_img=? where cm_no=?";
						
		String img = oldImg;
						
		if (newImg != null) {
			img = newImg;
		}
		con = DBManager.connect();
		pstmt = con.prepareStatement(sql);
						
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, category);
		pstmt.setString(4, type);
		pstmt.setString(5, img);
		pstmt.setString(6, no);
						
		if (pstmt.executeUpdate() == 1) {
			System.out.println(" 등록 성공");
			if (newImg != null) {
			new File(path + "/" + oldImg).delete();
					
			}
		}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						DBManager.close(con, pstmt, null);
					}
			
			
		}

	public static void removeCm(HttpServletRequest request) {
		// 값 or db
		String no = request.getParameter("no");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete cm_post where cm_no=?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("삭제 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
		
	}

	public static void checkWriter(HttpServletRequest request) {

		String num = request.getParameter("no");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select * from cm_post where cm_no = ?";
		// 로그인 중인 유저의 정보(세션에 저장되어있음) 중에서 아이디만 가져오기
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user");
		String userID = null;
		// 만약 로그인을 안하고 눈팅중인 사람일 수 있으니
		if (user != null) {
			userID = user.getId();						
		}

		
		String css = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 작성자 정보 담기
				String writer = rs.getString(2);
				if (writer.equals(userID)) {
					css = "block"; // 버튼 보이게
					request.setAttribute("asd", css);
				} else {
					css = "none"; //버튼 안보이게
					request.setAttribute("asd", css);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
				
		
		
	}

	public static void searchCate(HttpServletRequest request, HttpServletResponse response) {

		// db or 값 (파라미터)
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from cm_post where cm_cate like'%' ||?||'%'";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("cate"));
			
			rs = pstmt.executeQuery();
			
			//ArrayList<ReviewDTO> reviews = new ArrayList<ReviewDTO>(); json으로 교체
			ArrayList<String> cmPosts = new ArrayList<String>();
			CmDTO i = null;
			
			while (rs.next()) {
				i = new CmDTO();
				i.setCm_no(rs.getInt(1));
				i.setCm_user_id(rs.getString(2));
				i.setCm_title(rs.getString(3));
				i.setCm_text(rs.getString(4));
				i.setCm_cate(rs.getString(5));
				i.setCm_size(rs.getString(6));
				i.setCm_img(rs.getString(7));
				i.setCm_like(rs.getInt(8));
				i.setCm_view(rs.getInt(9));
				i.setCm_date(rs.getDate(10));
			cmPosts.add(i.toJSONbyMe());
				
			}
			
			System.out.println(cmPosts);
			System.out.println(cmPosts.size());
			
			// lib -> cos 파일업 / json simple /		지금은 Gson
			
//			response.getWriter().print("<body>");
			
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(cmPosts);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
		
		
		
	}

	public static void addReply(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql =
	"INSERT INTO cm_reply (cmr_user_id, cmr_post_no, cmr_text)" 
	+ "VALUES (?, ?, ?)";
		
		String reply = request.getParameter("cmReply");
		String postNo = request.getParameter("no");
		
		
		try {
			
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("user");
		String userID = user.getId();

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userID);
			pstmt.setString(2, postNo);
			pstmt.setString(3, reply);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, null);
		}
		
	}

	public static void GetReply(HttpServletRequest request) {
		String no = request.getParameter("no");
		String sql = "select * from cm_reply where cmr_post_no = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReplyDTO> replies = new ArrayList<ReplyDTO>();
		ReplyDTO reply = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				reply = new ReplyDTO();
				reply.setCmr_user_id(rs.getString(3));
				reply.setCmr_text(rs.getString(4));
				reply.setCmr_date(rs.getDate(5));
				replies.add(reply);
				
				
				
				String sqlTwo = "select * from userDB where user_id = ?";
				pstmt = con.prepareStatement(sqlTwo);
				pstmt.setString(1, reply.getCmr_user_id());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					reply.setUser_profile(rs.getString(4));
					request.setAttribute("getRpPro", reply);
				}
				
				
				
			}
			request.setAttribute("cm_reply", replies);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
	}
		
		
	}
