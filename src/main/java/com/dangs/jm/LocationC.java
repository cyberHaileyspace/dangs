package com.dangs.jm;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.sw.swM;

@WebServlet("/locationC")
public class LocationC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		LocationDAO.location(request);
		request.setAttribute("content", "jsp/jm/location.jsp");
//		request.setAttribute("loginCheck", "jsp/sw/login.jsp");
		swM.loginCheck(request);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
