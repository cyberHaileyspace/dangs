package com.dangs.hy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/APITest")
public class APITest extends HttpServlet {
	
	public static void main(String[] args) {
		 
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// PaQw4uKw%2FBnvpzwGrwVLUU3OEpMspXDv0IKVJS84H5bGSaAjVx%2BJh5J9vBdQhtZTt%2F6XhgoGCXaZpq0baUFjsA%3D%3D
	// http://apis.data.go.kr/1543061/animalShelterSrvc
		AdoptionDAO.getInfoAPI();
		
		
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
