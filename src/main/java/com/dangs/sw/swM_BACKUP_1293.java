package com.dangs.sw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD
import com.dangs.hy.DBManager;
=======
import com.dangs.yj.DBManager;
>>>>>>> d1ac82ac7bc1af7cc5e6e9d5300c809b7e1c2cc3




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
		String sql = "select * from user_db where l_id=?";
		String result = null;
		String hidden = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			String dbPw = null;
			if (rs.next()) {
				dbPw = rs.getString(3);
				if (dbPw.equals(pw)) {
					
					UserDTO user = new UserDTO();
					user.setId(id);
					user.setPw(dbPw); // (암호화 이슈 때문에)
					user.setName(rs.getString(4));
					HttpSession hs = request.getSession();
					hs.setAttribute("user", user);
					hs.setMaxInactiveInterval(10);
					hidden = "none";
					request.setAttribute("hidden", hidden);
				} else {
					result = "비밀번호를 확인하세요.";
					hidden = "block";
					request.setAttribute("result", result);
					request.setAttribute("hidden", hidden);
				}
			}else {
				result = "아이디를 확인하세요.";
				hidden = "block";
				request.setAttribute("result", result);
				request.setAttribute("hidden", hidden);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void loginValid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		hs.removeAttribute("user");		//		방법 2
//		hs.invalidate();						방법 3 (targeting 불가능)
		
		swM.loginCheck(request);

		
		
	}

}
