package com.dangs.jh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangs.main.DBManager;
import com.dangs.sw.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ShopModel {

	private static ArrayList<ProductDTO> products;
	private static ArrayList<OrderDTO> orders;
	private static ArrayList<MyPageDTO> mypages;

//	develop 필요
	public static void showAllProduct(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ProductDTO product = null;
			products = new ArrayList<ProductDTO>();

			while (rs.next()) {
				product = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9));
				products.add(product);
			}
			ArrayList<ProductDTO> fixed_products = new ArrayList<ProductDTO>();
			System.out.println(products);
			for (int i = 0; i < 4; i++) {
				fixed_products.add(products.get(i));

			}
			System.out.println(products);
			request.setAttribute("fixed_products", fixed_products);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void getProduct(HttpServletRequest request, HttpServletResponse response) {

		String pi = request.getParameter("product_id");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where product_id=" + pi;

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				request.setAttribute("product_id", rs.getString(1));
				request.setAttribute("product_seller", rs.getString(2));
				request.setAttribute("product_name", rs.getString(3));
				request.setAttribute("product_price", rs.getInt(4));
				request.setAttribute("product_stock", rs.getInt(5));
				request.setAttribute("product_category", rs.getString(6));
				request.setAttribute("product_img", rs.getString(7));
				request.setAttribute("product_date", rs.getDate(8));
				request.setAttribute("sub_category", rs.getString(9));
				request.setAttribute("product_point", rs.getInt(4) / 100);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void selectCategory(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		String category = request.getParameter("category");
//		System.out.println(category);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where product_category=" + "'" + category + "'";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ProductDTO product = null;
			ArrayList<String> products = new ArrayList<String>();

			while (rs.next()) {
				product = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9));
				products.add(product.toJSON());
			}

			System.out.println("!!!!!!!!!!!" + products);
			response.getWriter().print(products);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public static void selectSubCategory(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		String sub_category = request.getParameter("sub_category");
//		System.out.println(sub-category);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where sub_category=" + "'" + sub_category + "'";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ProductDTO product = null;
			ArrayList<String> products = new ArrayList<String>();

			while (rs.next()) {
				product = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9));
				products.add(product.toJSON());
			}

			System.out.println("~~~~~~~" + products);
			response.getWriter().print(products);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void showSameCategory(HttpServletRequest request, HttpServletResponse response) {
		String pi = request.getParameter("product_id");
		System.out.println("**************product_id = " + pi);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where product_category = ( " + "select product_category " + "from product "
				+ "where product_id = ?" + ") " + "and product_id != ?";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pi);
			pstmt.setString(2, pi);
			rs = pstmt.executeQuery();

			ProductDTO product = null;
			ArrayList<ProductDTO> same_products = new ArrayList<ProductDTO>();

			while (rs.next()) {
				product = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9));
				same_products.add(product);
			}

			System.out.println("@@@@@@@@" + same_products);
			request.setAttribute("same_products", same_products);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void paging(int pageNum, HttpServletRequest request) {
		request.setAttribute("curPageNum", pageNum);

		String orderpaging = (String)request.getAttribute("orderpaging");
		int count = 12; // 한페이지당보여줄개수
		
		int total = 0; // 총데이터수
		if(orderpaging != null) {
			total = mypages.size();
			count = 10;
		} else {
			total = products.size();
		}
			
		
		
		System.out.println("total = " + total);
		System.out.println(count);

//		페이지 수
		int pageCount = (int) Math.ceil((double) total / count);
		System.out.println(pageCount); // 페이지개수 (총 페이지 수)

//		시작, 끝
		int start = total - (count * (pageNum - 1));

		int end = (pageNum == pageCount) ? -1 : start - (count + 1);

		if(orderpaging != null) {
			ArrayList<MyPageDTO> items = new ArrayList<MyPageDTO>();
			
			if(mypages.size() != 0) {
				
			for (int i = start - 1; i > end; i--) {
				items.add(mypages.get(i));
			}
			request.setAttribute("orders", items);
			}else {
				request.setAttribute("ment", "주문 내역이 없어요~");
				System.out.println("멘트 생성 ? >>>>>>>>>>>>>");
			}
			
		}else {
			ArrayList<ProductDTO> items = new ArrayList<ProductDTO>();
			for (int i = start - 1; i > end; i--) {
				items.add(products.get(i));
			}
			request.setAttribute("products", items);
		}


		request.setAttribute("pageCount", pageCount);

	}

	public static void saveOrder(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user"); // Session에서 유저 정보 가져오기
		if (user == null) {
			System.out.println("User is not logged in.");
			return;
		}

		String order_user = user.getId();
		String order_product = request.getParameter("product_id");

		// Price 관련 로직
		int price = 0;
		String order_price_s = request.getParameter("total-price34");
		if (order_price_s != null) {
			String order_price = order_price_s.replace("원", "").trim(); // "5000"
			try {
				price = Integer.parseInt(order_price); // 숫자로 변환
			} catch (NumberFormatException e) {
				System.out.println("Invalid price format: " + order_price_s);
				return;
			}
		}

		String order_tel = request.getParameter("userTel");
		String order_address = request.getParameter("input-addr");
		String order_request = request.getParameter("input-request");
		String order_stock = request.getParameter("orderedStocks");
		String order_bank = request.getParameter("select-bank");
		String order_installments = request.getParameter("installments");

		// 디버그 출력
		System.out.println("Order Info:");
		System.out.println("User: " + order_user);
		System.out.println("Product: " + order_product);
		System.out.println("Price: " + price);
		System.out.println("Tel: " + order_tel);
		System.out.println("Address: " + order_address);
		System.out.println("Request: " + order_request);
		System.out.println("order_stock: " + order_stock);
		System.out.println("order_bank: " + order_bank);
		System.out.println("order_installments: " + order_installments);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "INSERT INTO orderDB (order_id, order_user, order_product, order_price, order_address, order_date, order_status, order_tel, order_request, order_stock, order_bank, order_installments) "
				+ "VALUES (orderDB_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?)";
		String selectPkSql = "SELECT orderDB_seq.currval AS order_id FROM dual"; // 마지막 PK 가져오기

		try {
			// DB 연결
			con = DBManager.connect();

			// INSERT 수행
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_user);
			pstmt.setString(2, order_product);
			pstmt.setInt(3, price);
			pstmt.setString(4, order_address);
			pstmt.setString(5, "결제완료");
			pstmt.setString(6, order_tel);
			pstmt.setString(7, order_request);
			pstmt.setString(8, order_stock);
			pstmt.setString(9, order_bank);
			pstmt.setString(10, order_installments);

			int rowsInserted = pstmt.executeUpdate();
			if (rowsInserted == 1) {
				System.out.println("***주문정보 등록성공***");

				// PK 값 가져오기
				pstmt.close();
				pstmt = con.prepareStatement(selectPkSql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					int orderId = rs.getInt("order_id");
					System.out.println("Generated Order ID: " + orderId);

					// Set Attribute로 JSP에 전달
					request.setAttribute("order_id", orderId);
				}
			} else {
				System.out.println("주문 정보 등록 실패.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 리소스 정리
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void showAllMyOrder(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user"); // Session에서 유저 정보 가져오기
		if (user == null) {
			System.out.println("User is not logged in.");
			return;
		}

		String order_user = user.getId();

		String order_id = request.getParameter("order_id");
		System.out.println("order_id = " + order_id); // ing..
		String sql = "";
		String page_check = request.getParameter("page-check");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.connect();
			sql = "select * from orderDB where order_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_id);
			rs = pstmt.executeQuery();

			OrderDTO order = null;
			orders = new ArrayList<OrderDTO>();

			while (rs.next()) {
				order = new OrderDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10),
						rs.getString(11), rs.getString(12));
				orders.add(order);
			}
			System.out.println("qqqqqqqq" + orders);
			request.setAttribute("orders", orders);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void getProductByOrderId(HttpServletRequest request, HttpServletResponse response) {

		String pi = request.getParameter("product_id");
		System.out.println("pi = " + pi);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where product_id = ?";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pi);
			rs = pstmt.executeQuery();

			ProductDTO product = null;
			products = new ArrayList<ProductDTO>();

			while (rs.next()) {
				product = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9));
				products.add(product);
			}
			System.out.println("products = " + products);

			request.setAttribute("products", products);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void orderStatusUpdate(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;

//order_status가 "주문취소"라면 업데이트 하지 않도록 수정함		
		String sql = "UPDATE orderDB " + "SET order_status = CASE "
				+ "    WHEN order_date < SYSDATE - 5 AND order_status != '주문취소' THEN '배송완료' "
				+ "    WHEN order_date < SYSDATE - 4 AND order_status != '주문취소' THEN '배송중' "
				+ "    WHEN order_date < SYSDATE - 3 AND order_status != '주문취소' THEN '배송시작' "
				+ "    WHEN order_date < SYSDATE - 1 AND order_status != '주문취소' THEN '상품 준비중' "
				+ "    ELSE order_status " + "END";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			int updatedRows = pstmt.executeUpdate();
			System.out.println("업데이트된 행 수: " + updatedRows);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void getAll(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user");
		if (user == null) {
			System.out.println("User is not logged in.");
			return;
		}

		String order_user = user.getId();
		System.out.println(order_user);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select o.*, p.product_img, p.product_name, u.user_id from orderDB o, USERDB u, product p"
				+ " where o.order_user = u.USER_ID and" + " o.order_product = p.product_id and"
				+ " o.order_user = ? order by o.order_date desc";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_user);
			rs = pstmt.executeQuery();

			MyPageDTO mypage = null;
			mypages = new ArrayList<MyPageDTO>(); // 각 주문의 product_id를 저장할 리스트

			while (rs.next()) {

				mypage = new MyPageDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15));

				mypages.add(mypage);
			}

			System.out.println("mypages: " + mypages);
			request.setAttribute("orders", mypages);
			request.setAttribute("orderpaging", "orderpaging");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public static void getAllByOrderId(HttpServletRequest request, HttpServletResponse response) {
		String order_id = request.getParameter("order_id");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select o.*, p.product_img, p.product_name, u.user_id from orderDB o, USERDB u, product p"
				+ " where o.order_user = u.USER_ID and" + " o.order_product = p.product_id and"
				+ " o.order_id = ? order by o.order_date desc";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_id);
			rs = pstmt.executeQuery();

			MyPageDTO mypage = null;
			List<MyPageDTO> mypages = new ArrayList<MyPageDTO>(); // 각 주문의 product_id를 저장할 리스트

			while (rs.next()) {

				mypage = new MyPageDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15));

				mypages.add(mypage);
			}

			System.out.println("mypages: " + mypages);

			request.setAttribute("orders", mypages);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void updateToCancel(HttpServletRequest request, HttpServletResponse response) {
		String order_id = request.getParameter("order_id");

		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE orderDB set order_status = '주문취소' where order_id = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_id);

			int updatedRows = pstmt.executeUpdate();
			System.out.println("업데이트된 행 수: " + updatedRows);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void saveCanceledOrder(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user"); // Session에서 유저 정보 가져오기
		if (user == null) {
			System.out.println("User is not logged in.");
			return;
		}

		String co_user = user.getId();
		String co_order = request.getParameter("order_id");
		String co_reason = request.getParameter("reason");
		String co_bank = request.getParameter("select-bank");
		String co_account = request.getParameter("refund-account");
		String co_accountName = request.getParameter("account-name");

		System.out.println(co_user);
		System.out.println(co_order);
		System.out.println(co_reason);
		System.out.println(co_bank);
		System.out.println(co_account);
		System.out.println(co_accountName);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "insert into canceled_order values (?, ?, ?, ?, ?, ?, sysdate, ?)";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, co_user);
			pstmt.setString(2, co_order);
			pstmt.setString(3, co_reason);
			pstmt.setString(4, co_bank);
			pstmt.setString(5, co_account);
			pstmt.setString(6, co_accountName);
			pstmt.setString(7, "주문취소");

			int updatedRows = pstmt.executeUpdate();
			System.out.println("업데이트된 행 수: " + updatedRows);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

	public static void getAllCnR(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user");
		if (user == null) {
			System.out.println("User is not logged in.");
			return;
		}

		String co_user = user.getId();
		System.out.println(co_user);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from canceled_order where co_user = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, co_user);
			rs = pstmt.executeQuery();

			CanceledDTO cancel = null;
			List<CanceledDTO> cancels = new ArrayList<CanceledDTO>(); // 각 주문의 product_id를 저장할 리스트

			while (rs.next()) {

				cancel = new CanceledDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8));

				cancels.add(cancel);
			}

			System.out.println("cancels: " + cancels);

			request.setAttribute("cancels", cancels);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void getAllByOrderIds(HttpServletRequest request, HttpServletResponse response) {
		List<CanceledDTO> cancels = (List<CanceledDTO>) request.getAttribute("cancels"); // cancels 리스트 가져오기
		if (cancels == null || cancels.isEmpty()) {
			System.out.println("Cancels 리스트가 비어있습니다.");
			return;
		}

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT o.*, p.product_img, p.product_name, u.user_id " + "FROM orderDB o, USERDB u, product p "
				+ "WHERE o.order_user = u.USER_ID " + "AND o.order_product = p.product_id " + "AND o.order_id = ? "
				+ "ORDER BY o.order_date DESC";

		try {
			con = DBManager.connect();

			List<MyPageDTO> mypages = new ArrayList<>(); // 결과를 저장할 리스트

			for (CanceledDTO cancel : cancels) { // cancels 리스트를 순회
				String order_id = cancel.getCo_order();

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, order_id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					MyPageDTO mypage = new MyPageDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),
							rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9),
							rs.getInt(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14),
							rs.getString(15));
					mypages.add(mypage);
				}

				pstmt.close(); // PreparedStatement 닫기
			}

			System.out.println("mypages: " + mypages);

			request.setAttribute("orders", mypages);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void cancelStatusUpdate(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;

//co_status가 "주문취소"라면 업데이트 하지 않도록 수정함		
		String sql = "UPDATE orderDB " + "SET order_status = CASE "
				+ "    WHEN order_date < SYSDATE - 5 THEN '환불완료' "
				+ "    WHEN order_date < SYSDATE - 4 THEN '환불 진행중' "
				+ "    WHEN order_date < SYSDATE - 3 THEN '취소완료' "
				+ "    WHEN order_date < SYSDATE - 1 THEN '검토중' "
				+ "    ELSE order_status " + "END";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			int updatedRows = pstmt.executeUpdate();
			System.out.println("canceled_order 업데이트된 행 수: " + updatedRows);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void insertProduct(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("img/productImages"); // 서버 상대 경로
		System.out.println("Upload Path: " + path);

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
		    // MultipartRequest 객체 생성
		    MultipartRequest mr = new MultipartRequest(
		        request, 
		        path, 
		        1024 * 1024 * 20, // 20MB 제한
		        "utf-8", 
		        new DefaultFileRenamePolicy() // 동일 파일명 처리 정책
		    );

		    
		    // Form 파라미터 가져오기
		    String product_name = mr.getParameter("product-name");
		    int product_price = Integer.parseInt(mr.getParameter("price"));
		    int product_stock = Integer.parseInt(mr.getParameter("quantity"));
		    String product_category = mr.getParameter("main-cate");
		    String sub_category = mr.getParameter("sub-cate");

		    // 세션에서 유저 정보 가져오기
		    HttpSession hs = request.getSession();
		    UserDTO user = (UserDTO) hs.getAttribute("user");
		    if (user == null) {
		        System.out.println("User is not logged in.");
		        return;
		    }
		    String product_seller = user.getId();

		    // 업로드된 파일 정보 가져오기
		    String uploadedFile = mr.getFilesystemName("main-img");
		    String product_img = (uploadedFile != null) ? uploadedFile : "default-product.png"; // 기본 이미지 처리

		    System.out.println("Uploaded Image: " + product_img);

		    // SQL 처리
		    String sql = "insert into product values (product_seq.nextval, ?, ?, ?, ?, ?, ?, SYSDATE, ?)";

		    con = DBManager.connect();
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, product_seller);
		    pstmt.setString(2, product_name);
		    pstmt.setInt(3, product_price);
		    pstmt.setInt(4, product_stock);
		    pstmt.setString(5, product_category);
		    pstmt.setString(6, "img/productImages/" + product_img);
		    pstmt.setString(7, sub_category);

		    // SQL 실행
		    if (pstmt.executeUpdate() == 1) {
		        System.out.println("***상품 등록 성공***");
		    } else {
		        System.out.println("상품 등록 실패.");
		    }
		    
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    DBManager.close(con, pstmt, null);
		}
	}

	public static void getMyProduct(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		UserDTO user = (UserDTO) hs.getAttribute("user");
		if (user == null) {
			System.out.println("User is not logged in.");
			return;
		}

		String product_seller = user.getId();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where product_seller = ?";

		try {
			if (con == null) {
				con = DBManager.connect();
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product_seller);
			rs = pstmt.executeQuery();

			ProductDTO product = null;
			products = new ArrayList<ProductDTO>();

			while (rs.next()) {
				product = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9));
				products.add(product);
			}
			
			System.out.println(products);
			
			request.setAttribute("products", products);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}

	public static void updateProduct(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("img/productImages"); // 서버 상대 경로
		System.out.println("Upload Path: " + path);
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// MultipartRequest 객체 생성
		    MultipartRequest mr = new MultipartRequest(
		        request, 
		        path, 
		        1024 * 1024 * 20, // 20MB 제한
		        "utf-8", 
		        new DefaultFileRenamePolicy() // 동일 파일명 처리 정책
		    );
			
		    String product_id = mr.getParameter("product_id");
		    String product_name = mr.getParameter("product-name");
		    int product_price = Integer.parseInt(mr.getParameter("price"));
		    int product_stock = Integer.parseInt(mr.getParameter("quantity"));
		    String product_category = mr.getParameter("main-cate");
		    String sub_category = mr.getParameter("sub-cate");
		    
		    String new_img = mr.getFilesystemName("main-img-new");
		    String old_img = mr.getParameter("main-img-old");
		    String file = new_img;
		    if (new_img == null) {
				file = old_img;
			}

			String sql = "update product set product_name = ?, product_price = ?, product_stock = ?, product_category = ?, product_img = ?, product_date = sysdate, sub_category = ? where product_id = ?";

			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product_name);
			pstmt.setInt(2, product_price);
			pstmt.setInt(3, product_stock);
			pstmt.setString(4, product_category);			
			pstmt.setString(5, file);
			pstmt.setString(6, sub_category);
			pstmt.setString(7, product_id);

			int updatedRows = pstmt.executeUpdate();
			System.out.println("업데이트된 행 수: " + updatedRows);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
		String product_id = request.getParameter("product_id");
		
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM product WHERE product_id = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product_id);

			int updatedRows = pstmt.executeUpdate();
			System.out.println("업데이트된 행 수: " + updatedRows);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void updateProductStock(HttpServletRequest request, HttpServletResponse response) {
		String product_id = request.getParameter("product_id");
		String ordered_stock = request.getParameter("orderedStocks");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "update product set product_stock = product_stock - ? where product_id = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordered_stock);
			pstmt.setString(2, product_id);

			int updatedRows = pstmt.executeUpdate();
			System.out.println("~!@업데이트된 행 수: " + updatedRows);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

}