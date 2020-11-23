<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Add New Flight</title>
  </head>
  <body>
    <div class="container">
        <div class="row">
            <div class="col-md-9 offset-md-1">
   <!-- FlightNo, Source, Destination, Fare, Departure, Arrival, Duration, AirportName, TotalStops, FlightName, Duration_in_hours, Duration_in_mins -->
                <div class="regForm">
                    <h1 style="text-align: center;"><b>BOOK FLIGHT</b></h1>
                    <form action="addnewflight" method="POST">
                      <div class="form-group">
                            <label>FLIGHT NO</label>
                            <input type="text" class="form-control" name="fltno" 
                            title="Must not contain Spaces"
                            placeholder="Add a flight no" pattern="[A-Z0-9]+" />
                        </div> 
                        
                        <div class="form-group">
                        	<label>SOURCE&emsp;&emsp;&emsp;&ensp;:&emsp;</label>
                            <%
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","12345");
							String qry = "select distinct(source) from flight_details;";
							Statement stmt = dbcon.createStatement();
							ResultSet  theresult = stmt.executeQuery(qry);
							%>
							<select name = "source">
							<option></option>
							<% while(theresult.next()){
							%>	
							<option><%= theresult.getString("Source") %></option>
							<%} %>
							</select>
							
							<label>&emsp;DESTINATION&emsp;&ensp;:&emsp;</label>
							<%
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection dbcon1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","12345");
							String qry1 = "select distinct(destination) from flight_details";
							Statement stmt1 = dbcon1.createStatement();
							ResultSet  theresult1 = stmt1.executeQuery(qry1);
							%>
							<select name = "destination" >
							<option></option>
							<% while(theresult1.next()){
							%>	
							<option><%= theresult1.getString("Destination") %></option>
							<%} %>
							</select>
                        </div>
                        
                        <div class="form-group">
                         <label>FLIGHT NAME&emsp;:&emsp;</label>
                            <%
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection dbcon2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","12345");
							String qry2 = "select distinct(flightname) from flight_details;";
							Statement stmt2 = dbcon.createStatement();
							ResultSet  theresult2 = stmt2.executeQuery(qry2);
							%>
							<select name = "fltname" >
							<option></option>
							<% while(theresult2.next()){
							%>	
							<option><%= theresult2.getString("flightname") %></option>
							<%} %>
							</select>
						<label>&emsp;&emsp;&emsp;&emsp;AIRPORT&emsp;:&emsp;</label>
							<%
							String source = request.getParameter("from");
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection dbcon3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","12345");
							String qry3 = "select distinct(AirportName) from flight_details";
							Statement stmt3 = dbcon1.createStatement();
							
							ResultSet  theresult3 = stmt3.executeQuery(qry3);
							
							%>
							<select name = "airport" >
							<option></option>
							<% while(theresult3.next()){
							%>	
							<option><%= theresult3.getString("AirportName") %></option>
							<%} %>
							</select>
                        </div> 
                        
                        <div class="form-group">
                            <label>FARE</label>
                            <input type="text" class="form-control" name="fare" 
                            title="Must not contain Spaces and minimum 4 digits and maximum 5 digits"
                            placeholder="Enter Ticket Price" pattern="[0-9]{4,5}" />
                        </div>
                        
                          <div class="form-group" >
                          <label>DEPARTURE AND ARRIVAL</label><p>
  						  <input type="time" class="form-control" name = "departure" style="width: 40%; float: left" placeholder="Departure Time"/>
   						  <input type="time" class="form-control" name = "arrival" style="width: 40%; float: right" placeholder="Arrival Time"/>
 						 </div> 
 						   
 						    <br/>
 						    
 						  <div class="form-group">
                            <label>TOTAL STOPS</label><br/>
                            <select class="form-control" name="totalstops"  style="width: 32%; float: left">
                                <option></option>
								<%for (int i = 1; i <=5; i++){%>
								<option><% out.println(i);%></option>
								<%
								}
								%>
                            </select>
                        </div><br>
                        <div class = "form-group">
                        <button type="submit" class="btn btn-primary" name="register" style="width: 100%; float: left">CONFIRM</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>