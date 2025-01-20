package com.dangs.yj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CmPageC")
public class CmPageC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		CmDAO.selectAll(request);
		int p = Integer.parseInt(request.getParameter("p"));
		CmDAO.paging(p,request);
		
		request.setAttribute("content", "jsp/yj/cm_main.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
