package com.omkar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addnewadminuser")
public class AddNewAdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement psmt;
	
	public void init() {
		try {
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
			//username, password, email
			String query = "Insert into admindetails (username,  password, email )values (?,?,?)";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
		}
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		String adminusername = request.getParameter("adminusername");
		String adminemail = request.getParameter("adminemail");
		String adminpassword = request.getParameter("adminpassword");
		
		PrintWriter out = response.getWriter();
		
		
		try {
			psmt.setString(1, adminusername);
			psmt.setString(2, adminpassword);
			psmt.setString(3, adminemail);
			psmt.executeUpdate();
			
			out.println("<h4 align = center>");
			out.println("<b>");
			out.println("New Admin User is Successfully Created ");
			out.println("</b>");
			out.println("<h4>");
			
			request.getRequestDispatcher("AdminDivert.jsp").include(request, response);
		} catch (SQLException e) {
			out.println("<h4 align = center>");
			out.println("<b>");
			out.println("This Admin Username is already taken, Please try using other Username");
			out.println("</b>");
			out.println("<h4>");
			request.getRequestDispatcher("AdminRegisterUser.jsp").include(request, response);
		}
		
		
		
		

		
	
	}

}
