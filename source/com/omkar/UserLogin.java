package com.omkar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginUser")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
	private Connection connection;
       
	
	public void init() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
//			username, email, mobileno, password
			String query = "Select * from  userdetails where username = ? and password = ?";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	response.getWriter().println("<h3>Inside User login do get method</h3>");
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username  = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		
		try {
			psmt.setString(1, username);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				request.getRequestDispatcher("checkout.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("login.jsp").include(request, response);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Inside the userlogin.java exception block "+e);
		}
		
		
		
		response.getWriter().println("<h3>&emsp;&emsp;&emsp;Please enter Valid username and password</h3>");
	
	}

}
