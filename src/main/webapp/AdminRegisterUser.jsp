<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<title>Register</title>
</head>
<body>
	<h3>
		<b></b>
	</h3>
	<div class="container">
		<div class="row">
			<div class="col m9 offset-m1">
				<div class="card">
					<div class="card-content">
						<h2 style="margin-top: 10px;" class="center-align"><b>Create New Admin User</b></h2>

						<div class="form">
							<form action="addnewadminuser" method="post">
								USERNAME
								<input type="text" name="adminusername" placeholder="username" 
								pattern = "[A-Za-z0-9]+" title= "Must not contain spaces" required>
								PASSWORD
								<input type="password" name="adminpassword" placeholder="password" 
								title = "Must be Alpha-numeric"	 pattern = "[\w]+"  required>
								EMAIL
								<input	type="email" name="adminemail" placeholder="Please enter a valid email address" required = "required">
								<button type="submit" class="btn">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>