package com.dangs.jh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.sw.swM;

@WebServlet("/InsertProductC")
public class InsertProductC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("content", "jsp/jh/insertProduct.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ShopModel.insertProduct(request, response);

		request.setAttribute("content", "jsp/jh/iPResult.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

}
