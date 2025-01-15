package com.dangs.sw;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangs.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.jdbc.proxy.annotation.Pre;

public class swM {
	public static Connection con = null;

	public static void loginCheck(HttpServletRequest request) {
		UserDTO u = (UserDTO) request.getSession().getAttribute("user");
		if (u == null) {
			request.setAttribute("loginCheck", "jsp/sw/login.jsp");
		} else {
			request.setAttribute("loginCheck", "jsp/sw/loginOK.jsp");
		}
	}

	public static void loginConfirm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from userDB where user_id=?";
		String result = null;
		String hidden = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			String dbPw = null;
			if (rs.next()) {
				dbPw = rs.getString(2);
				if (dbPw.equals(pw)) {
					UserDTO user = new UserDTO();
					user.setId(id);
					// user.setPw(dbPw);
					user.setName(rs.getString(3));
					user.setPhoto(rs.getString(4));
					user.setAge(rs.getString(5));
					user.setAddress(rs.getString(6));
					user.setTel(rs.getString(7));
					user.setNickname(rs.getString(8));
					user.setPoint(rs.getInt(9));
					user.setEmail(rs.getString(10));
					HttpSession hs = request.getSession();
					hs.setAttribute("user", user);
					hs.setMaxInactiveInterval(1000);
					hidden = "none";
					request.setAttribute("hidden", hidden);
				} else {
					result = "비밀번호를 확인하세요.";
					hidden = "block";
					request.setAttribute("result", result);
					request.setAttribute("hidden", hidden);
				}
			} else {
				result = "아이디를 확인하세요.";
				hidden = "block";
				request.setAttribute("result", result);
				request.setAttribute("hidden", hidden);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void loginValid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDTO u = (UserDTO) request.getSession().getAttribute("user");
		if (u == null) {
			request.setAttribute("content", "jsp/sw/fullLogin.jsp");
			request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
		}

	}

	public static void logout(HttpServletRequest request) {
		// 로그아웃 일 시키기

		// 만들어진 유저 세션을 없애기
		HttpSession hs = request.getSession();
//		hs.setAttribute("user", null);			방법 1
		hs.removeAttribute("user"); // 방법 2
//		hs.invalidate();						방법 3 (targeting 불가능)

		swM.loginCheck(request);

	}

	public static void register(HttpServletRequest request) {
		String id = request.getParameter("username");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");

		PreparedStatement pstmt = null;
		String sql = "insert into userDB values(?,?,?,'dog-nose.png',?,?,?,null,0,?)";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, age);
			pstmt.setString(5, address);
			pstmt.setString(6, tel);
			pstmt.setString(7, email);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("업데이트 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void updateUserInfo(HttpServletRequest request) {

		PreparedStatement pstmt = null;
		String path = request.getServletContext().getRealPath("img/userProfile");
		System.out.println("Upload Path: " + path);
		try {
			
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
					new DefaultFileRenamePolicy());
			
			String name = mr.getParameter("updateName");
			String nickname = mr.getParameter("updateNickname");
			String age = mr.getParameter("updateAge");
			String email = mr.getParameter("updateEmail");
			String tel = mr.getParameter("updateTel");
			String address = mr.getParameter("updateAddress");
			
			HttpSession hs = request.getSession();
			UserDTO user = (UserDTO) hs.getAttribute("user");
			String newPhoto = mr.getFilesystemName("newPhoto");
			System.out.println("New Photo: " + newPhoto);  // 로그 확인
			String oldPhoto = user.getPhoto();
			String userID = user.getId();
			
			String img = oldPhoto;
			if (newPhoto != null) {
				img = newPhoto;
			}
			// 확인 용
			System.out.println(userID);
			System.out.println(newPhoto);
			System.out.println(oldPhoto);
			
			String sql = "update userDB set user_name=?,user_nickname=?,user_age=?,user_email=?,user_tel=?,user_address=?,user_photo=? where user_id=?";
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, nickname);
			pstmt.setString(3, age);
			pstmt.setString(4, email);
			pstmt.setString(5, tel);
			pstmt.setString(6, address);
			pstmt.setString(7, img);
			pstmt.setString(8, userID);
			
			if (pstmt.executeUpdate()==1) {
				System.out.println("수정 성공 !!! 레전드 사건 발생 !!!!");
				if (newPhoto != null) {
					File f = new File(path + "/" + oldPhoto);
					f.delete();
				}
			}
			


			// 수정된 값들로 UserDTO 객체 업데이트
			user.setName(name);
			user.setNickname(nickname);
			user.setAge(age);
			user.setEmail(email);
			user.setTel(tel);
			user.setAddress(address);
			user.setPhoto(img);  // 사진 경로 업데이트

			// 수정된 객체를 다시 세션에 저장
			hs.setAttribute("user", user);
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

}
