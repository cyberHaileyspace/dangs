package com.dangs.hy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/AdoptAPI")
public class AdoptAPI extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        response.setContentType("application/json; charset=utf-8");

        try {
            // 요청 파라미터
            int pageNo = Integer.parseInt(request.getParameter("pageNo"));
            int numOfRows = Integer.parseInt(request.getParameter("numOfRows"));

            // API 호출 및 데이터 저장
            AdoptionDAO.getAdao().getAPI(pageNo, numOfRows);

            // 저장 완료 메시지
            response.getWriter().write("{\"message\":\"데이터 저장 완료\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"데이터 저장 중 오류 발생\"}");
        }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
