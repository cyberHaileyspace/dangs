package com.dangs.sw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/myPageC")
public class MyPageC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		// 'user'라는 세션에서 객체 가져오기
		UserDTO user = (UserDTO) session.getAttribute("user"); 
		String userID = user.getId(); 
		System.out.println(userID);
		boolean hasPet = swM.isPetRegistered(userID);
		System.out.println("ok");
		if (hasPet) {
			swM.getMyPetInfo(request);
		}
		String doYouHavePet = hasPet ? "/jsp/sw/pet/okPet.jsp" : "/jsp/sw/pet/noPet.jsp";
		request.setAttribute("petCheck", doYouHavePet);
		
		request.setAttribute("content", "jsp/sw/myPage.jsp");
		request.getRequestDispatcher("noLoginIndex.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
