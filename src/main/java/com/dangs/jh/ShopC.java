package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.sw.swM;

@WebServlet("/ShopC")
public class ShopC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		카테고리에서 요청받음
		ShopModel.showAllProduct(request, response);
		ShopModel.paging(1, request);
		
//		초기 쇼핑 페이지로 이동
		request.setAttribute("content", "jsp/jh/shop.jsp");
		swM.loginCheck(request);
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
