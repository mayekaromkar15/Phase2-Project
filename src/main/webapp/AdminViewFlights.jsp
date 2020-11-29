<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!
PreparedStatement psmt;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>Flights</title>
<style type="text/css">
b
{
backgroud-color:cyan;
box-shadow:5px 5px 5px;
width:420px;
}
table
{
text-align: center;
position: relative;
border-collapse: collapse;
background-color: #f6f6f6;
}
th
{
background-color: #1d8fe4;
border-radius: 0.5;
padding: 10px;

}
.container {
   margin-top:2%;
   margin-bottom:2%;
   height:96%;
   margin-left: 2%;
   margin-right:2%;
   width: 96%;
}

h4
{
background-color:#d9d9d9;
border-radius: 20px;
box-shadow:5px 5px 5px;
font-family: "Comic Sans MS", "Comic Sans", cursive;
}

</style>
</head>
<body>
<div class = container>

<h4 align="center">F<span>LIGHT</span>  D<span>ETAILS</span></h4>

<table class="striped" >
<tr style="border:1px double black;">
<th><b>Flight No</b></th>
<th><b>FlightName</b></th>
<th><b>Source</b></th>
<th><b>Destination</b></th>
<th><b>Departure</b></th>
<th><b>Arrival</b></th>
<th><b>Duration</b></th>
<th><b>AirportName</b></th>
<th><b>Economy</b></th>
<th><b>Business</b></th>
<th><b>First Class</b></th>
</tr>

<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/flyaway", "root", "12345");
	psmt = connection.prepareStatement( "Select * from flight_details");
	ResultSet resultset = psmt.executeQuery();
	while(resultset.next()){
%>
<tr class="blank_row">
<td colspan="0.2"></td>
</tr>
<tr style="border:1px dotted black">
<td ><%= resultset.getString("FlightNo")%></td>
<td ><%= resultset.getString("FlightName")%></td>
<td ><%= resultset.getString("Source")%></td>
<td ><%= resultset.getString("Destination")%></td>
<td ><%= resultset.getString("Departure")%></td>
<td ><%= resultset.getString("Arrival")%></td>
<td ><%= resultset.getString("Duration")%></td>
<td ><%= resultset.getString("AirportName")%></td>
<td ><%= resultset.getInt("Economy")%></td>
<td ><%= resultset.getInt("Business")%></td>
<td ><%= resultset.getInt("First_Class")%></td>
<td><a class="btn" href="<%= request.getContextPath() %>/admindelete?flightno=<%= resultset.getString("FlightNo")%>">Delete</a></td>

</tr>


<%
}
	
}
catch(Exception e){
	out.println("In wrong place "+e);
	
}

%>


</table>
</div>
</body>
</html>