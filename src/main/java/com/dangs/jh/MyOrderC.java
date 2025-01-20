package com.dangs.jh;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyOrderC")
public class MyOrderC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		페이지 경로 관련
		String prev_page = request.getParameter("prev-page-name");
		request.setAttribute("prev_page", prev_page);
				
//		주문내역에 들어갈 때 마다 주문상태를 자동으로 업데이트
		ShopModel.orderStatusUpdate(request, response);

//		주문내역 가져오는 메소드
		ShopModel.getAllByOrderId(request, response);
		
		request.setAttribute("content", "jsp/jh/myOrder.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
