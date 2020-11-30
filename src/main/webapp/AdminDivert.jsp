<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>Admin Home</title>
</head>

<style>
.container
{
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
}

h3{
background-color:#d9d9d9;
color:#000000;
box-shadow:5px 5px 5px;
border-radius: 25px;
font-family: "Comic Sans MS", "Comic Sans", cursive;
}


</style>

<body>

<div class = "container">
<h3 align = "center">Welcome to Admin Panel</h3>
<h4 align = "center">What would You like to do</h4>

<h2 align = "center"><a class="btn" href="AdminAddNewFlight.jsp">Add Flight</a></h2>
<h2 align = "center"><a class="btn" href="AdminViewFlights.jsp">View Flight</a></h2>
<h2 align = "center"><a class="btn" href="AdminPasswordChange.jsp">Change Password</a></h2>
<h2 align = "center"><a class="btn" href="AdminRegisterUser.jsp">Create Admin User</a></h2>
</div>

</body>
</html>