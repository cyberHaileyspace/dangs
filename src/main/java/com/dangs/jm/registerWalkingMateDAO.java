package com.dangs.jm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import com.dangs.main.DBManager;

public class registerWalkingMateDAO {

	public static void selectAllLocation(HttpServletRequest request) {
		// 파라미터 'location' 값을 가져옴
		String address = request.getParameter("location");

		// 예: "서울 중구 을지로2가 209"에서 "중구" 나 "을지로" 만 추출
		String[] parts = address.split(" "); // 공백을 기준으로 나눔

		// 예시로 "중구" 또는 "을지로"만 추출하려면, parts 배열에서 두 번째나 세 번째 항목을 선택하면 됨
		String locationKeyword = null;

		// 예시: "중구" 또는 "을지로"가 포함된 부분 찾기
		for (String part : parts) {
			if (part.equals("중구") || part.equals("을지로")) {
				locationKeyword = part; // 해당 값 저장
				break; // 한 번 찾으면 더 이상 검색하지 않음
			}
		}

		// 결과 확인용 로그
		if (locationKeyword != null) {
			System.out.println("찾은 위치 : " + locationKeyword);
		} else {
			System.out.println("위치를 찾을 수 없음");
		}

		// 만약 위치를 찾았다면, DB에서 해당 지역에 맞는 데이터 검색

		/* if (locationKeyword != null) { */ Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from userDB where user_address like '%'||?||'%'";
		// LIKE를 사용하여 부분 일치 검색

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "을지로"); // locationKeyword를 포함하는 주소를 찾기 위한 쿼리
			rs = pstmt.executeQuery();

			ArrayList<userDTO> users = new ArrayList<userDTO>();

			while (rs.next()) {
				String name = rs.getString(3);
				String add = rs.getString(6);
				userDTO user = new userDTO(name, add);
				users.add(user);
			}

			request.setAttribute("users", users);
			System.out.println(users);
		} catch (Exception e) {
			e.printStackTrace(); // 실제 운영 환경에서는 로깅을 사용하는 것이 좋습니다.
		} finally {
			DBManager.close(con, pstmt, rs); // 자원 반환
		}
		/* } */
	}
}
