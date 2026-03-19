package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

public class JDBCUtil {
	private static final String DB_URL = "jdbc:sqlserver://localhost:1752;databaseName=ManagementPhoneWeb;integratedSecurity=true;";
    private static final String USER = "sa"; // Tên đăng nhập SQL Server
    private static final String PASSWORD = "duyvlm10"; // Mật khẩu SQL Server
	public static Connection getConnection() throws ClassNotFoundException  {
		Connection c = null;
		
		try {
			// Đăng ký MySQL Driver với DriverManager
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			// Các thông số
			String url = "jdbc:mySQL://localhost:3306/webphone?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8&connectionCollation=utf8mb4_unicode_ci";
			String username = "root";
			String password = "";
			
			// Tạo kết nối
			c = DriverManager.getConnection(url, username, password);
			
           

//            if (c != null) {
//                System.out.println("Kết nối thành công!");
//            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}
	public static void main(String[] args) throws ClassNotFoundException {
		System.out.println(getConnection());
	}
	
	public static void closeConnection(Connection c) {
		try {
			if(c!=null) {
				c.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void printInfo(Connection c) {
		try {
			if(c!=null) {
				DatabaseMetaData mtdt = c.getMetaData();
				System.out.println(mtdt.getDatabaseProductName());
				System.out.println(mtdt.getDatabaseProductVersion());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}