package com.omkar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminedit")
public class AdminEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
       
	
	
	public void init() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/flyaway", "root", "12345");
			psmt= connection.prepareStatement( "Delete from flight_details where FlightNo =  ?");
		} catch (ClassNotFoundException | SQLException e) {
		
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		String param = request.getParameter("flightno");
		response.getWriter().println(param);
		
		try {
			psmt.setString(1, param);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
		}
		
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
