package com.omkar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addnewflight")
public class AdminAddFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
	private Connection	connection;
	
       
	public void init() {
		try {
			
			System.out.println("Inside the userlogin init method");
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "12345");
			
			String query = "Insert into flight_details (FlightNo,Source,Destination,Fare,"
					+ "Departure,Arrival,Duration,AirportName,TotalStops,FlightName) "
					+ "values (?,?,?,?,?,?,timediff(?,?),?,?,?);";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of adminaddflight servlet init"+e);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("inside do post of addnewflight method");
	
		PrintWriter out = response.getWriter();
		String fltno = request.getParameter("fltno");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String fltname = request.getParameter("fltname");
		int fare = Integer.parseInt(request.getParameter("fare"));
		String airport = request.getParameter("airport");
		String departure = request.getParameter("departure");
		String arrival = request.getParameter("arrival");
		
		out.println(arrival);
		out.println(departure);
		int totalstops = Integer.parseInt(request.getParameter("totalstops"));

		try {
			psmt.setString(1, fltno);
			psmt.setString(2, source);
			psmt.setString(3, destination);
			psmt.setInt(4, fare);
			psmt.setString(5, departure);
			psmt.setString(6, arrival);
			psmt.setString(7,arrival );
			psmt.setString(8, departure);
			psmt.setString(9, airport);
			psmt.setInt(10, totalstops);
			psmt.setString(11, fltname);
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Inside error of do post of adminaddflight servlet "+e);
		}
		
		
		
		
	}

}
