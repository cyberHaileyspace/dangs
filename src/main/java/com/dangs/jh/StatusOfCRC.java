package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StatusOfCRC")
public class StatusOfCRC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prev_page = "마이페이지";
		request.setAttribute("prev_page", prev_page);
		
//		날짜에 따라 진행상태 달라지는 메소드

//		주문취소내역 가져오는 메소드		
		ShopModel.getAllCnR(request, response);
		
//		주문취소내역에서 order_id값 가져와서 order정보를 orders에 담기
		ShopModel.getAllByOrderIds(request, response);
		
		request.setAttribute("content", "jsp/jh/myCanceledOrder.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
