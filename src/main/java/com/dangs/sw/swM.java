package com.dangs.sw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dangs.jh.DBManager;


public class swM {
	public static Connection con = null;
	
	public static void loginCheck(HttpServletRequest req) {
		UserDTO u = (UserDTO) req.getSession().getAttribute("user");
		if (u == null) {
			req.setAttribute("loginCheck", "jsp/sw/login.jsp");
		} else {
			req.setAttribute("loginCheck", "jsp/sw/loginOK.jsp");			
		}
	}
	
	public static void loginConfirm(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_db where l_id=?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			String result = "아이디가 틀렸습니다.";
			String dbPw = null;
			if (rs.next()) {
				dbPw = rs.getString(3);
				if (dbPw.equals(pw)) {
					result = "로그인 성공";
					UserDTO user = new UserDTO();
					user.setId(id);
					user.setPw(dbPw); // (암호화 이슈 때문에)
					user.setName(rs.getString(4));
					HttpSession hs = request.getSession();
					hs.setAttribute("user", user);
					hs.setMaxInactiveInterval(10);
				}else {
					result = "비밀번호가 틀렸습니다.";
				}
			}
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
	}

}
