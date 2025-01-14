package com.dangs.jh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangs.main.DBManager;

public class ShopModel {

	private static ArrayList<ProductDTO> products;

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

			System.out.println(products);
			request.setAttribute("products", products);

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

		String sql = "select * from product where product_category = ( "
				+ "select product_category "
				+ "from product "
				+ "where product_id = ?"
				+ ") "
				+ "and product_id != ?";

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
		
		int total = products.size();  //총데이터수
		System.out.println(total);
		int count = 12; // 한페이지당보여줄개수
		System.out.println(count);
		
//		페이지 수
		int pageCount = (int) Math.ceil((double)total/ count);
		System.out.println(pageCount); // 페이지개수 (총 페이지 수)
		
//		시작, 끝
		int start = total - (count * (pageNum - 1));
		
		int end = (pageNum == pageCount) ? -1 : start - (count + 1);
		
		ArrayList<ProductDTO> items = new ArrayList<ProductDTO>();
		
		for (int i = start - 1; i > end; i--) {
			items.add(products.get(i));
		}
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("products", items);
	}
}
