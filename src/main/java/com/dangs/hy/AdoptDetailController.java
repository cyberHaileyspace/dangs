package com.dangs.hy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdoptDetailController")
public class AdoptDetailController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String desertionNo = request.getParameter("desertionNo");
		
		String animalDetail = AdoptionDAO.getAdao().getAnimalDetail(desertionNo);
		
		request.setAttribute("adoptLikes", desertionNo);
		request.setAttribute("animalDetail", animalDetail);
		
		request.setAttribute("content", "jsp/hy/adoptDetail.jsp");
		
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
