package com.omkar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
	private PrintWriter out;
	private Connection connection;
	
	

	
	public void init() {
		try {
			
			System.out.println("Inside the adminlogin init method");
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
			String query = "Select * from  admindetails where username = ? and password = ?";
			psmt = connection.prepareStatement(query);
			System.out.println("successfully connected to the database.");

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
	
	void processrequestresponse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		String adminusername  = request.getParameter("adminusername");
		String adminpassword = request.getParameter("adminpassword");
		
		
		
		
		try {
			psmt.setString(1, adminusername);
			psmt.setString(2, adminpassword);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				out = response.getWriter();
				out.println("");
				out.println("<h6 align=center>");
				out.println("<b>");
				out.println("Welcome to ADmin Login Panel ");
				out.println("</b>");
				out.println("</h6>");
				
				RequestDispatcher rd = request.getRequestDispatcher("AdminDivert.jsp");
				
				rd.include(request, response);
			}
			else {
				out.println("<h4 align = center><b>You are not an Admin</b></h4>");
				
				request.getRequestDispatcher("AdminLogin.jsp").include(request, response);;
				RequestDispatcher rd =  request.getRequestDispatcher("AdminLogin.jsp");
				rd.include(request, response);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Inside the Adminlogin.java exception block "+e);
		}
	}
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processrequestresponse(request, response);
	}

	
	public void destroy() {
		try {
			connection.close();
			psmt.close();
		} catch (SQLException e) {
			System.out.println("failed to close the connection");
		}
	}
}
