package com.omkar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminPasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
       
	public void init() {
		try {
			
			System.out.println("Inside the userlogin init method");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
			String query = "Update admindetails set password = ? where username = ?";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
		}
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String adminusername = request.getParameter("adminusername");
		String adminnewpassword = request.getParameter("changedpassword");
		
		try {
			psmt.setNString(1, adminnewpassword);	
			psmt.setNString(2, adminusername);
			
			psmt.executeUpdate();
			response.getWriter().println("<h5 align = center>");
			response.getWriter().println("<b>");
			response.getWriter().println("Password successfully changed");
			response.getWriter().println("</b>");
			response.getWriter().println("</h5>");
			getServletContext().getRequestDispatcher("/AdminDivert.jsp").include(request, response);
			
		} catch (SQLException e) {
		}
		
		
		
	}

}
