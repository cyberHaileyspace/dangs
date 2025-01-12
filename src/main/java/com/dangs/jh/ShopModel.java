package com.dangs.jh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;

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
}
