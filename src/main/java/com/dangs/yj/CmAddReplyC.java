package com.dangs.yj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CmAddReplyC")
public class CmAddReplyC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		CmDAO.addReply(request, response);
		
		
		response.sendRedirect("CmPostC?no="+request.getParameter("no"));
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * CmDAO.addReply(request, response); response.sendRedirect("CmPostC");
		 */
	
	}

}
