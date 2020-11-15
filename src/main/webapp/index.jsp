<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<meta charset="ISO-8859-1">
<title>Main</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col m9 offset-m1">
				<div class="card">
					<div class="card-content">
						<h2 style="margin-top: 10px;" class="center-align">Your
							booking details here</h2>

						<div class="form">
							<form action="flights.jsp" method="post">
								FROM
								<td><input type="text" name="from" placeholder="From"></td>
								TO<input type="text" name="to" placeholder="To">
								
								
								
								Departure<input type="date" name="date" min="2000-01-02"
									placeholder="your journey date"> TotalSeat<input
									type="text" name="totalseat" placeholder="Number of Seat">
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