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
box-shadow:3px 3px 3px;
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
h4
{
border-radius: 20px;
box-shadow:5px 5px 5px;
font-family: "Comic Sans MS", "Comic Sans", cursive;
}

I
{
background-color:  #d9d9d9;
border-radius: 20px;
font-size: 20px;

}
.container {
   margin-top:2%;
   margin-bottom:2%;
   height:96%;
   margin-left: 2%;
   margin-right:2%;
   width: 96%;
}

span{
font-family: "Comic Sans MS", "Comic Sans", cursive;
font-size: 25px;
}
.btn{
border-radius: 20px;
}

</style>	
</head>
<body>
<div class = container>

<h4 align="center">F<span>LIGHT</span>  D<span>ETAILS</span></h4>


<table class="left" >	

<tr><td><I>From</I>  : <%= request.getParameter("from") %></td> 
<td> <i>To</i> : <%= request.getParameter("to") %></td>
<td> <i>Travel Date</i> : <%= request.getParameter("date") %></td>
<td> <i>Total Adults</i> : <%= request.getParameter("adultseats") %></td>
<td> <i>Total Childrens</i> : <%= request.getParameter("childrenseats") %></td>
&emsp;&emsp;&emsp;&ensp;<td> <a class = "btn" href="welcome.jsp">Back</a></td>
</tr>




<tr style="border:1px double black;">
<th><b>Flight No</b></th>
<th><b>FlightName</b></th>
<th><b>Source</b></th>
<th><b>Destination</b></th>
<th><b>Departure</b></th>
<th><b>Arrival</b></th>
<th><b>Duration</b></th>
<th><b>AirportName</b></th>
<th><b>Fare</b></th>
<th><b></b></th>




</tr>

<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/flyaway", "root", "12345");
	
	HttpSession sessionwlcm = request.getSession();
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String nonstop = request.getParameter("nonstop");
	int adults = Integer.parseInt(request.getParameter("adultseats"));
	int children = Integer.parseInt(request.getParameter("childrenseats"));
	
	
	sessionwlcm.setAttribute("from", from);
	sessionwlcm.setAttribute("to", to);
	sessionwlcm.setAttribute("nonstop", nonstop);
	sessionwlcm.setAttribute("adults", adults);
	sessionwlcm.setAttribute("children", children);
	
	if (from!=null && to!=null && nonstop!=null){
		psmt = connection.prepareStatement( "Select * from flight_details where Source = ? and Destination = ? and TotalStops = 1");
	}else if (from!=null && to!=null){
		psmt = connection.prepareStatement( "Select * from flight_details where Source = ? and Destination = ?");
	}


	psmt.setString(1, from);
	psmt.setString(2, to);
	ResultSet resultset = psmt.executeQuery();
	
	
	while(resultset.next()){
%>
<tr class="blank_row">
<td colspan="0.5"></td>
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
<td ><% if (request.getParameter("class").equals("Economy")){
	out.println((adults * resultset.getInt("Economy")) + Math.round((children * (0.8 * resultset.getInt("Economy")))));
}else if(request.getParameter("class").equals("Business")){
	out.println((adults * resultset.getInt("Business")) + Math.round((children * (0.8 * resultset.getInt("Business")))));
}else{
	out.println((adults * resultset.getInt("First_Class")) + Math.round((children * (0.8 * resultset.getInt("First_Class")))));
}%></td>



<td><a class="btn" href="<%= request.getContextPath() %>/main?page=login&flightno=<%= resultset.getString("FlightNo")%>&
fare=<% if (request.getParameter("class").equals("Economy")){
	out.println((adults * resultset.getInt("Economy")) + Math.round((children * (0.8 * resultset.getInt("Economy")))));
}else if(request.getParameter("class").equals("Business")){
	out.println((adults * resultset.getInt("Business")) + Math.round((children * (0.8 * resultset.getInt("Business")))));
}else{
	out.println((adults * resultset.getInt("First_Class")) + Math.round((children * (0.8 * resultset.getInt("First_Class")))));
}%>">Book Now</a></td>

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