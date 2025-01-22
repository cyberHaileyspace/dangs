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
	
		// 요청 파라미터 "action" 값 확인
		String action = request.getParameter("action"); 
		String contentPage = "jsp/hy/shelterAdoptions.jsp"; // 기본값
			
		
		if ("favoritesTab".equals(action)) { 
			
			contentPage = "jsp/hy/myFavoritesAdopt.jsp";
		}
			
		request.setAttribute("content", contentPage);
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
		
	}
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
