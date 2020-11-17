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
import javax.servlet.http.HttpSession;

@WebServlet("/loginUser")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
	private Connection connection;
	private PrintWriter out;
       
	
	public void init() {
		try {
			System.out.println("Inside the userlogin init method");
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
//			username, email, mobileno, password
			String query = "Select * from  userdetails where username = ? and password = ?";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
	
	void processrequestresponse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String username  = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		
		try {
			psmt.setString(1, username);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("Inside the userlogin dopost method and about to create the httpsession");
				request.getSession().setAttribute("username", username);
				out = response.getWriter();
				out.println("Welcome "+ username);
				
//				
				RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
				
				rd.include(request, response);
//				response.setContentType("html/text");
				System.out.println("Creted http session");
			}
			else {
				response.getWriter().println("<h3>&emsp;&emsp;&emsp;Please enter Valid username and password</h3>");
				request.getRequestDispatcher("login.jsp").include(request, response);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Inside the userlogin.java exception block "+e);
		}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	response.getWriter().println("<h3>Inside User login do get method</h3>");
	
	processrequestresponse(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("<h3>Inside User login do Post method----</h3>");
		
		processrequestresponse(request, response);
		
	}

	
}
