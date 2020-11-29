package com.omkar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
	private PrintWriter out;
       
	
	public void init() {
		try {
			
			System.out.println("Inside the userlogin init method");
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
			String query = "Select * from  userdetails where username = ? and password = ?";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
	
	void processrequestresponse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		String username  = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		
		try {
			psmt.setString(1, username);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {

				request.getServletContext().setAttribute("username", username);
				request.getSession().setAttribute("username", username);
				out = response.getWriter();
				
				out.println("<h3 align=center>");
				out.println("<br>");
				out.println("<br>");
				request.getSession().setAttribute("fullname",  rs.getString("fname")+" " +rs.getString("lname"));
				out.println("Welcome "+ rs.getString("fname")+" " +rs.getString("lname") );
				out.println("</br>");
				out.println("</h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("MakePayment.jsp");
				
				rd.include(request, response);
				System.out.println("Creted http session");
			}
			else {
				out.println("<h4 align = center>Please Enter Valid Username and Password</h4>");
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
//		response.setContentType("html/text");
//		response.getWriter().println("<h6></h6>");
		
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
