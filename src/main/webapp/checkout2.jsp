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

    <title>Registration Form</title>
    
  </head>
  <body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
              
                <div class="regForm">
                    <h1><b>&emsp;&emsp;MAKE PAYMENT</b></h1>
                    <form action="" method="POST">
                        <div class="form-group">
                            <label>CARD NUMBER</label>
                            <input type="text" class="form-control" name="cardnumber" placeholder="Enter your Card number" required>
                        </div>       
                        <div class="form-group">
                            <label>NAME ON CARD</label>
                            <input type="email" class="form-control" name="nameoncard" placeholder="Enter Name Here" required>
                        </div>
                        <div class="form-group">
                            <label>EXPIRY DATE</label>
                            <select class="form-control" name="designation" required>
                                <option>--MONTH--</option>
								<%for (int i = 0; i <=12; i++){%>
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
                            <input type="password" class="form-control" name="cvv" required>
                        </div>
                        </div> 
                        <div class="form-group">
                            <label>MOBILE NUMBER</label>
                            <input type="text" class="form-control" name="mobileno" placeholder="Enter your Mobile number" required>
                        </div>
                        <button type="submit" class="btn btn-primary" name="register">CONFIRM</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>