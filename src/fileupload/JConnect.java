package fileupload;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JConnect {

	Connection con;
	Statement stmt;
	PreparedStatement psmt;
	ResultSet rs;
	
	public JConnect() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");

			String url = "jdbc:mariadb://127.0.0.1:3307/project02_db";
			String id ="kosmo_user";  // 계정이름
			String pass = "1234";  // 계정비번
			
			con = DriverManager.getConnection(url,id,pass);
			
			System.out.println("MariaDB 연결성공");
			
		}catch (Exception e){
			System.out.println("MariaDB 연결시 예외발생");
			e.printStackTrace();
		}
		
	}	
		
	public JConnect(ServletContext application){
		try {
			
			String drv = application.getInitParameter("MariaJDBCDriver");
			String url = application.getInitParameter("MariaConnectURL");
			String id = application.getInitParameter("MariaUser");
			String pwd = application.getInitParameter("MariaPass");
			
			Class.forName(drv);
			
			con = DriverManager.getConnection(url,id,pwd);
			
			System.out.println("JDBC 연결성공");
			
		}catch (Exception e){
			System.out.println("JDBC 연결시 예외발생");
			e.printStackTrace();
		}
		
	}
	
	
	public void close() {
		try {
			
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
			
		}catch(Exception e) {
			System.out.println("JConnect 자원 반납시 예외발생");
		}
	}
		
	
	
}
	
	
	
	
	
