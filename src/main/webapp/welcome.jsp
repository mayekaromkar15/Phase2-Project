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

    <title>Welcome</title> 
  <style>
.container
{
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
}
span{
background-color:    #fbf87d  ;
}
span1{
background-color:     #ffedd2     ;
}

</style>  
  </head>
  <body style="background-color:#80aaff;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 offset-md-1">
                <div class="regForm">
                	<h1></h1>
                	
                	<h6 align = "right"><a class="btn" href="AdminLogin.jsp"><span1>Admin Login</span1></a></h6>	               
                	  <h1 style="text-align: center;"><b><span>BOOK FLIGHT</span></b></h1>
                    <form action="flights.jsp" method="POST">
                        <div class="form-group" align = "center">
                        <label>FROM&emsp;:&emsp;</label>
                            <%
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","12345");
							String qry = "select distinct(source) from flight_details;";
							Statement stmt = dbcon.createStatement();
							ResultSet  theresult = stmt.executeQuery(qry);
							%>
							<select name = "from" required>
							<option></option>
							<% while(theresult.next()){
							%>	
							<option><%= theresult.getString("Source") %></option>
							<%} %>
							</select>
						<label>&emsp;TO&emsp;:&emsp;</label>
							<%
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection dbcon1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","12345");
							String qry1 = "select distinct(destination) from flight_details";
							Statement stmt1 = dbcon1.createStatement();
							ResultSet  theresult1 = stmt1.executeQuery(qry1);
							%>
							<select name = "to" required>
							<option></option>
							<% while(theresult1.next()){
							%>	
							<option><%= theresult1.getString("Destination") %></option>
							<%} %>
							</select>
                        </div>                              
                        <div class="form-group">
                            <label>DATE</label>
                            <input type="date" class="form-control" name="date" placeholder="Your Travel Date"
                             required min=<%= LocalDate.now().plusDays(1)%>>
                        </div>
                        
                        <div class="form-group">
                            <label>TOTAL SEATS</label><br/>
                            <input type="text" value = "ADULTS  &darr;" disabled>
                            <select class="form-control" name="adultseats" required>
								<%for (int i = 1; i <=5; i++){%>
								<option><% out.println(i);%></option>
								<%
								}
								%>
                            </select>
                            <input type="text" value = "CHILDREN  &darr;" disabled>
                            <select class="form-control" name="childrenseats" required>
								<%for (int i = 0; i <=5; i++){%>
								<option><% out.println(i);%></option>
								<%
								}
								%>
                            </select>
                        </div> 
                         <div class="form-check">
                         <label>CLASS</label><br/>
                             <select class="form-control" name="class" required>
                             <option>Economy</option>
                             <option>Business</option>
                             <option>First Class</option>
                             </select>
                         </div>
                        
                        
                        <div class="form-check">
                             <input class="form-check-input" type="checkbox" name="nonstop" value="Non Stop Flight Only">
                             <label class="form-check-label">Show only Non-Stop Flights</label>
                         </div>
                        <button type="submit" class="btn btn-primary" name="register">CONFIRM</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>