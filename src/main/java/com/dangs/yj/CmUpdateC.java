package com.dangs.yj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CmUpdateC")
public class CmUpdateC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CmDAO.getCm(request);
		
		
		
		request.setAttribute("content", "jsp/yj/cm_update.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	CmDAO.updateCm(request);
	response.sendRedirect("CmMainC");
	}

}
