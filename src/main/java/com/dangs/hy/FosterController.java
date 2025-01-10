package com.dangs.hy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FosterController")
public class FosterController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String contentPage = "jsp/hy/fosterAdoptions.jsp"; // 기본값 : 임시 보호 공고 페이지

		switch (action) {
		case "myFosterPosts":
			contentPage = "jsp/hy/myFosterPosts.jsp"; // 내가 작성한 공고
			break;
		case "myFavoritesFoster":
			contentPage = "jsp/hy/myFavoritesFoster.jsp"; // 내가 관심 표시한 공고
			break;
		}

		// contentPage 설정 후 index.jsp로 포워드
		request.setAttribute("content", contentPage);

		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
		;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
