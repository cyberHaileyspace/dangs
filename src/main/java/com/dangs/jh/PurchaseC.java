package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PurchaseC")
public class PurchaseC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		결제 관련 로직
		String ordered_stock = request.getParameter("ordered_stock");
		String total_price = request.getParameter("total_price");
		String del_price = request.getParameter("del_price");
		request.setAttribute("ordered_stock", ordered_stock);
		request.setAttribute("total_price", total_price);
		request.setAttribute("del_price", del_price);

		ShopModel.getProduct(request, response);

		request.setAttribute("content", "jsp/jh/purchase.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pi = request.getParameter("product_id");
		
//		주문내역 페이지에서 주문수량 필요해서 추가
		String order_stock = request.getParameter("orderedStocks");
		request.setAttribute("order_stock", order_stock);
		
		/* 1. 주문정보를 orderDB에 담고 order_id를 추출해 보내는 메소드 */
		ShopModel.saveOrder(request, response);

//		주문한 갯수만큼 상품수량 빼는 로직
		ShopModel.updateProductStock(request, response);
		
		request.setAttribute("pi", pi);
		System.out.println("pi는~~~~~~~" + pi + "~~~~~~~");
//		request.setAttribute("select_bank", select_bank);
//		request.setAttribute("installments", installments);
		request.setAttribute("content", "jsp/jh/purchaseResult.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

}
