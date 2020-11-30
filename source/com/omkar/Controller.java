package com.omkar;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/main")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement stmt;
	
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String parameter = request.getParameter("page");
		
		String paramater1 = request.getParameter("flightno");
		String parameter2 = request.getParameter("fare");
		HttpSession sessflight = request.getSession();
		sessflight.setAttribute("flightno", paramater1);
		sessflight.setAttribute("finalprice", parameter2);
		
		
		if (parameter.equals("login")) {
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}else if (parameter.equals("register")) {
			getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
		}
	
}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String parameter = request.getParameter("page");
		
		if (parameter.equals("register")) {
			getServletContext().getRequestDispatcher("register.jsp").forward(request, response);
		}
}
       

	
	

}
