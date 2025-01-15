package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PurchaseC")
public class PurchaseC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
/*		1. 주문정보를 orderDB에 담는 메소드
 * 			   	  ↓
 * 		2. orderDB에서 order_id를 가져오는 메소드 (order_id를 주문번호로 활용)
 * 				  ↓
 * 		3. order_id를 attribute로 받아서 purchaseResult에 주문번호로 띄우기
*/
		
//		주문번호 만드는 로직 필요
		
		request.setAttribute("content", "jsp/jh/purchaseResult.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

}
