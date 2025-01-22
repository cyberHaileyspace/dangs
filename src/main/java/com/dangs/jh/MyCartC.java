package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyCartC")
public class MyCartC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		my_bookmark에서 get
		
		request.setAttribute("content", "jsp/jh/myCart.jsp");
		request.setAttribute("content2", "jsp/jh/recentProduct.jsp");
		request.getRequestDispatcher("noLoginIndexJh.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
