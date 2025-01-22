package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.sw.swM;

@WebServlet("/ShopPageC")
public class ShopPageC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int p = Integer.parseInt(request.getParameter("p"));
		ShopModel.showAllProduct(request, response);
		ShopModel.paging(p, request);

//		최근 본 상품
		ShopModel.getRecentProduct(request, response);

		swM.loginCheck(request);
		request.setAttribute("content", "jsp/jh/shop.jsp");
		request.setAttribute("content2", "jsp/jh/recentProduct.jsp");
		request.getRequestDispatcher("noLoginIndexJh.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
