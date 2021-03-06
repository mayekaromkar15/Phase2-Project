<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Make Payment</title>
     
  </head>
  <body>
  <h2 align = "center"><a class="btn" href="UserLogout">LOGOUT</a></h2>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
              
                <div class="regForm">
                	
                    <h1 align="center"><b>MAKE PAYMENT</b></h1>
                    <form action="bookingdetails.jsp" method="POST">
                        <div class="form-group">
                            <label>CARD NUMBER</label>
                            <input type="text" class="form-control" name="cardnumber" required
                            title="Must not contain Spaces or Alphabets and must be exactly 16 digits "
                            placeholder="Enter your 16 digit Card number" pattern="[1-9]{1}[0-9]{15}" />
           
                        </div>       
                        <div class="form-group">
                            <label>NAME ON CARD</label>
                            <input type="text" class="form-control" name="nameoncard" required
                            placeholder="Enter Name Here" pattern = "[A-Za-z\s]+"
                            title="Must not contain Digits">
                            
                        </div>
                        <div class="form-group">
                            <label>EXPIRY DATE</label>
                            <select class="form-control" name="designation" required>
                                <option>--MONTH--</option>
								<%for (int i = 1; i <=12; i++){%>
								<option><% out.println(i);%></option>
								<%
								}
								%>
                            </select>
                            <select class="form-control" name="designation" required>
                                <option>--YEAR--</option>
								<%for (int j = 2022; j <=2028; j++){%>
								<option><% out.println(j);%></option>
								<%
								}
								%>
                            </select>
                            <div class="form-group">
                            <label>CVV</label>
                            <input type="password" class="form-control" name="cvv" placeholder = "Enter 3 digit CVV"
                            pattern = "[0-9]{3}" title="Can contain only 3 digits" required>
                        </div>
                        </div> 
                        <button type="submit" class="btn btn-primary" name="register">CONFIRM</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>