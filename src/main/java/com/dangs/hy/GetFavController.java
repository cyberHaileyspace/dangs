package com.dangs.hy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.sw.UserDTO;
import com.google.gson.JsonArray;

@WebServlet("/GetFavController")
public class GetFavController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션에서 사용자 정보 가져오기
        UserDTO user = (UserDTO) request.getSession().getAttribute("user");
        String userId = user.getId();
        System.out.println("로그인된 사용자 ID: " + userId);

        // DAO 호출
        JsonArray favorites = AdoptionDAO.getAdao().getUserFavorites(userId);

        // JSON 데이터 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(favorites.toString());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
