package com.dangs.sw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginC")
public class loginC extends HttpServlet {

<<<<<<< HEAD
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		swM.loginValid(request, response);
=======
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
>>>>>>> 83515571c6beabdf44fd5bce3bedb667238ecc5f
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		swM.loginConfirm(request, response);

		swM.loginCheck(request);

		request.setAttribute("content", "jsp/sw/main.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
