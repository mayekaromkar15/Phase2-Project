package com.omkar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/UserLogout")
public class UserLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		out.println("<h4 align=center>");
		out.println("<b>");
		out.print("Welcome "+ request.getSession().getAttribute("username"));
		out.println("</b>");
		out.println("</h4>");
		
		request.getSession().invalidate();
		
		out.println("<h5 align=center>");
		out.println("<b>");
		out.print("You have successfully logged out. Login to Continue ");
		out.println("</b>");
		out.println("</h5>");
		
		request.getRequestDispatcher("login.jsp").include(request, response);
		
		
	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
		response.getWriter().print("Welcome "+ request.getSession().getAttribute("username"));
		
		
//	request.getSession().invalidate();
//	response.sendRedirect("index.jsp");
	
	
	}

}
