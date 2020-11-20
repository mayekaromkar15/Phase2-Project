<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! PreparedStatement psmt; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookingDetails</title>
<link rel= 	"stylesheet" href = "style/main.css">
<style type="text/css">

table
{
text-align: left;
position: relative;
border-collapse: separate;
background-color: #f6f6f6;
padding: 5px;
width: 400px;
}
.container {
   margin-top:2%;
   margin-bottom:2%;
   height:96%;
   margin-left: 2%;
   margin-right:2%;
   width: 96%;
}
th
{
background-color: #1d8fe4;
border-radius: 0.5;
padding: 10px;

}

</style>
</head>
<body>

<div class = "container"> 
<%
try{
	
	String req = (String)request.getSession().getAttribute("flightno") ;
	String flights  = request.getParameter("flightno");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/flyaway", "root", "12345");
	
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String nonstop = request.getParameter("nonstop");
	
	psmt = connection.prepareStatement( "select * from flight_details where FlightNo = ?");
	psmt.setString(1, req);
	
	
	ResultSet resultset = psmt.executeQuery();
	while(resultset.next()){
	%>

		<h2 align="center"><br>Your booking is Confirmed</br></h2>
		 <table style="border:1px double black" align = "center">
		 	<tr>
		 		    <th><b>-- Flight No</b></th>
		 		    <td><%= resultset.getString("FlightNo")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>-- FlightName</b></th>
		 		    <td><%= resultset.getString("FlightName")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>-- Source</b></th>
		 		    <td><%= resultset.getString("Source")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>-- Destination</b></th>
		 		    <td><%= resultset.getString("Destination")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>-- Departure</b></th>
		 		    <td><%= resultset.getString("Departure")%></td>
		 	</tr>
		 	<tr>
		 		   <th><b>-- Arrival</b></th>
		 		    <td><%= resultset.getString("Arrival")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>-- Duration</b></th>
		 		    <td><%= resultset.getString("Duration")%></td>
		 	</tr>
		 	<tr>
		 		   <th><b>-- AirportName</b></th>
		 		   <td><%= resultset.getString("AirportName")%></td>
		 	</tr>
		 	<tr>
		 		   <th><b>-- Fare</b></th>
		 		   <td><%= resultset.getInt("Fare")%></td>
		 	</tr>
		 	<tr>
		 		   <th><b>-- SeatNo</b></th>
		 		   <td><%=resultset.getString("FlightNo")+ new Random().nextInt(55555) %></td>
		 	</tr>
		 	<tr>
		 		   <th><b>-- TransactionId</b></th>
		 		   <td><%= RandomStringUtils.randomAlphanumeric(15)%></td>
		 	</tr>

		 </table>
		
<%}
	
}
catch(Exception e){
	out.println("In wrong place "+e);
	
}
%>

</div>

</body>
</html>