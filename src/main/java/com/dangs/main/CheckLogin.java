package com.dangs.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.sw.UserDTO;


@WebServlet("/checkLogin")
public class CheckLogin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDTO u = (UserDTO) request.getSession().getAttribute("user");
        if (u == null) {
            response.getWriter().write("notLoggedIn");
        } else {
            response.getWriter().write("loggedIn");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
