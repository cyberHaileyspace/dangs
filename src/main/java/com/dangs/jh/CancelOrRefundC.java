package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CancelOrRefundC")
public class CancelOrRefundC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		페이지 경로 관련  //ok
		String title_now = request.getParameter("title-now");
		String ppPage = request.getParameter("prevPage");
		request.setAttribute("prev_page", title_now);
		request.setAttribute("prev_prev_page", ppPage);

//		주문내역 가져오는 메소드
		ShopModel.getAllByOrderId(request, response);
		
		
		
		request.setAttribute("content", "jsp/jh/cancelOrRefund.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("order_id", request.getParameter("order_id"));

//		order_status를 "주문취소"로 업데이트하는 로직
		ShopModel.updateToCancel(request, response);
		
//		canceled_order에 저장하는 메소드
		ShopModel.saveCanceledOrder(request, response);
		
		
		request.setAttribute("content", "jsp/jh/corResult.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);

	}

}
