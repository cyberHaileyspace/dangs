package com.dangs.hy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdoptionController")
public class AdoptionController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String contentPage;

		if ("favorites".equals(action)) {
		
			contentPage = "jsp/hy/myFavoritesAdopt.jsp"; // 관심 공고 페이지
	
		} else {
		
			contentPage = "jsp/hy/shelterAdoptions.jsp"; // 기본 보호소 공고 페이지
	
		}

		request.setAttribute("content", contentPage);
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
