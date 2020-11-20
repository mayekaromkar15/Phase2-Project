<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JDBC connect</title>
</head>
<body>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","12345");
out.println("Sucessly connected to db");
String qry = "select * from flight_details";
Statement stmt = dbcon.createStatement();
ResultSet  theresult = stmt.executeQuery(qry);
%>
<select>
<option>Please selec tthe name </option>
<% while(theresult.next()){
%>	
<option><%= theresult.getString("Source") %></option>
<%} %>
</select>


</body>
</html>