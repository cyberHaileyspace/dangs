package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProductC")
public class UpdateProductC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ShopModel.getProduct(request, response);
		
		request.setAttribute("content", "jsp/jh/updateProduct.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ShopModel.updateProduct(request, response);
		
		request.setAttribute("content", "jsp/jh/uPResult.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

}