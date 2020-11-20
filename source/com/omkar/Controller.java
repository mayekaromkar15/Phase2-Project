package com.omkar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/main")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	PreparedStatement stmt;
	
	
	
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Inside do get");
		String parameter = request.getParameter("page");
		String paramater1 = request.getParameter("flightno");
		HttpSession sessflight = request.getSession();
		sessflight.setAttribute("flightno", paramater1);
		
		
		if (parameter.equals("login")) {
			System.out.println("checking register parameter");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}else if (parameter.equals("register")) {
			getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
		}
	
}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Inside do post");
		String parameter = request.getParameter("page");
		
		if (parameter.equals("register")) {
			System.out.println("checking register parameter");
			getServletContext().getRequestDispatcher("register.jsp").forward(request, response);
		}
}
       

	
	

}
