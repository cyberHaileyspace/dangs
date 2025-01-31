package com.dangs.sw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FullLoginC")
public class FullLoginC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		swM.loginConfirm(request, response);

		swM.loginValid(request, response);

		request.setAttribute("content", "jsp/sw/main.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
