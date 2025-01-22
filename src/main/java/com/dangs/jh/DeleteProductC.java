package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProductC")
public class DeleteProductC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ShopModel.deleteProduct(request, response);

//		최근 본 상품
		ShopModel.getRecentProduct(request, response);

		request.setAttribute("content", "MyProductC");
		request.setAttribute("content2", "jsp/jh/recentProduct.jsp");
		request.getRequestDispatcher("noLoginIndexJh.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
