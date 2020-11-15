<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>You will see the flights details here</title>
</head>
<body>
<div class="container">
<table class="centered">
<tr class="blank_row">
    <td colspan="3"></td>
</tr>
<tr bgcolor = "#97edcf" style="border:5px double black;">
<td><b>Flight No</b></td>
<td><b>Source</b></td>
<td><b>Destination</b></td>
<td><b>Fare</b></td>
<td><b>Book Now</b></td>
</tr>

<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/flyaway", "root", "12345");
	PreparedStatement psmt = connection.prepareStatement( "Select * from flight_details where Source = ? and Destination = ?");
	
	String from = request.getParameter("from");
	String to = request.getParameter("to");
		

	psmt.setString(1, from);
	psmt.setString(2, to);
	
	ResultSet resultset = psmt.executeQuery();
	while(resultset.next()){
%>
<tr class="blank_row">
<td colspan="0.5"></td>
</tr>

<tr style="border:1px dotted black">
<td ><%= resultset.getInt("FlightNo")%></td>
<td ><%= resultset.getString("Source")%></td>
<td ><%= resultset.getString("Destination")%></td>
<td ><%= resultset.getString("Fare")%></td>

<!-- <td ><button class="btn waves-effect waves-light"> <a href= "<b>Book Now</b></a>
  </button></td>-->

 <td><a class="btn" href="<%= request.getContextPath()%>/main?page=login">Book Now</a></td>
</tr>


<%
}
	
}
catch(Exception e){
	out.println("In wwrong place "+e);
	
}

%>


</table>
</div>
</body>
</html>