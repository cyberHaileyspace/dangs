package com.dangs.sw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.jstl.sql.Result;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class DBManager {

	private static BasicDataSource dataSource;

	static {
		dataSource = new BasicDataSource();
		dataSource.setUrl("jdbc:oracle:thin:@WRVHG7114P7VNW5C_medium?TNS_ADMIN=C:/hsw10/Wallet_WRVHG7114P7VNW5C");
		dataSource.setUsername("DANGS");
		dataSource.setPassword("Soldesk802!!");
		dataSource.setMinIdle(10);	// 최소 유휴 커넥션
		dataSource.setMaxIdle(20);	// 최대 유휴 커넥션
		dataSource.setMaxOpenPreparedStatements(100); // 풀에서 열린 최대 준비된 sql문 개수

	}

	public static Connection connect() throws SQLException{
		return dataSource.getConnection();
		
	}
	
	
//	public static Connection connect() throws SQLException{
//		// 연결
//		String url = "jdbc:oracle:thin:@GEPOKSG3DGXK0N4A_medium?TNS_ADMIN=C:/hsw10/Wallet_GEPOKSG3DGXK0N4A";
//		
//		return DriverManager.getConnection(url, "SW", "Soldesk802!!");
//		
//
//	
//	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			pstmt.close();
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
