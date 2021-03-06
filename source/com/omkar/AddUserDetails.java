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

import com.mysql.cj.Session;


@WebServlet("/adduser")
public class AddUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement psmt;
	
	
	
	
	public void init() {
		try {
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
//			username, email, mobileno, password, fname, lname
			String query = "Insert into userdetails (username, email, mobileno, password,fname, lname )values (?,?,?,?,?,?)";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
		}
		
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String username = request.getParameter("username");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("name", username);
		
		
		String email = request.getParameter("email");
		String mobileno = request.getParameter("mobileno");
		String password = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		PrintWriter out = response.getWriter();
		
		
		try {
			psmt.setString(1, username);
			psmt.setString(2, email);
			psmt.setString(3, mobileno);
			psmt.setString(4, password);
			psmt.setString(5, fname);
			psmt.setString(6, lname);
			psmt.executeUpdate();
			
			out.println("<h4 align = center>");
			out.println("<b>");
			out.println("You can Login With the Registered Details Here :");
			out.println("</b>");
			out.println("<h4>");
			
			request.getRequestDispatcher("login.jsp").include(request, response);
		} catch (SQLException e) {
			out.println("<h4 align = center>");
			out.println("<b>");
			out.println("This Username is already taken, Please try using other Username");
			out.println("</b>");
			out.println("<h4>");
			request.getRequestDispatcher("register.jsp").include(request, response);
		}
		
		
		
		

		
	}

}
