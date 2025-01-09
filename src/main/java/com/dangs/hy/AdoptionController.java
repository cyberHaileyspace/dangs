package com.dangs.hy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdoptionController")
public class AdoptionController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  // 요청 파라미터 "action" 값 확인
        String action = request.getParameter("action");
        String contentPage = "jsp/hy/shelterAdoptions.jsp"; // 기본값: 보호소 입양 공고 페이지

        // "action" 값에 따라 다른 페이지로 설정
        if ("myFavorites".equals(action)) {
        	contentPage = "jsp/hy/myFavoritesAdopt.jsp"; // 관심 공고 페이지
        } 
        	
        // contentPage 속성 설정 및 index.jsp로 포워드
        
        request.setAttribute("content", contentPage);
        
        // request.setAttribute("contentPage", contentPage);

        request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
        //RequestDispatcher dispatcher = request.getRequestDispatcher("noLoginIndex.jsp");
        //dispatcher.forward(request, response);
    
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
