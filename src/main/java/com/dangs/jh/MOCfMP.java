package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MOCfMP")
public class MOCfMP extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String prev_page = "마이페이지";
		request.setAttribute("prev_page", prev_page);

//		주문내역에 들어갈 때 마다 주문상태를 자동으로 업데이트
		ShopModel.orderStatusUpdate(request, response);

//		주문내역 가져오는 메소드		
		ShopModel.getAll(request, response);
		ShopModel.paging(1, request);

//		최근 본 상품
		ShopModel.getRecentProduct(request, response);
		
		
		request.setAttribute("content", "jsp/jh/myOrder.jsp");
		request.setAttribute("content2", "jsp/jh/recentProduct.jsp");
		request.getRequestDispatcher("noLoginIndexJh.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
