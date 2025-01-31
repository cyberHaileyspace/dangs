package com.dangs.sw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginC")
public class LoginC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("content", "jsp/sw/fullLogin.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		swM.loginConfirm(request, response);
		swM.selectRecentPosts(request);
		request.setAttribute("content", "jsp/sw/main.jsp");
		swM.loginCheck(request);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		/*
		 * swM.loginCheck(request);
		 * 
		 * request.setAttribute("content", "jsp/sw/main.jsp");
		 * request.getRequestDispatcher("index.jsp").forward(request, response);
		 */
	}

}
