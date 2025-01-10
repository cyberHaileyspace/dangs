package com.dangs.sw;

import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@WebServlet("/ToggleWishlistServlet")
public class ToggleWishlistServlet extends HttpServlet {
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false);
	    if (session == null || session.getAttribute("user") == null) {
	      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	      return;
	    }

	    String jsonBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
	    JsonParser parser = new JsonParser(); // JsonParser 객체 생성
	    JsonObject jsonObject = parser.parse(jsonBody).getAsJsonObject(); // parse 메서드 사용
	    String productId = jsonObject.get("productId").getAsString();

	    // 데이터베이스에서 찜 상태를 토글하는 로직 추가
	    boolean isWishlisted = toggleWishlistInDatabase(productId);

	    response.setContentType("application/json");
	    response.getWriter().write("{\"success\": true, \"isWishlisted\": " + isWishlisted + "}");
	  }

	  private boolean toggleWishlistInDatabase(String productId) {
	    // DB에서 찜 상태를 토글하는 코드 작성
	    // 예시로, 토글 후의 상태를 반환하는 더미 코드
	    return true; 
	  }
	}