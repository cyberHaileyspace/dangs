package com.dangs.hy;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/AjaxController")
public class AjaxController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		  response.setContentType("application/json; charset=utf-8");

	        try {
	            // 요청 파라미터
	            int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	            int numOfRows = Integer.parseInt(request.getParameter("numOfRows"));

	            // 데이터 조회
	            List<JsonObject> adoptionData = AdoptionDAO.getAdao().getAdoptionData(pageNo, numOfRows);

	            // JSON 변환 및 응답
	            Gson gson = new Gson();
	            String jsonResponse = gson.toJson(adoptionData);
	            response.getWriter().write(jsonResponse);

	        } catch (NumberFormatException e) {
	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            response.getWriter().write("{\"error\":\"잘못된 요청 파라미터 형식\"}");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("{\"error\":\"데이터 조회 중 오류 발생\"}");
	        }
	    }
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
