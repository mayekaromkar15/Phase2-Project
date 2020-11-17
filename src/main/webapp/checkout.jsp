<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>


<h2>Checkout</h2>



<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="booking_details.jsp">
      
          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            
            
            Name on Card :&emsp;<input type="text" id="cname" name="cardname" placeholder="John More Doe">&emsp;&emsp;
            Credit card number : <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444"><br/></br>
            Exp Month :&emsp;&emsp; <input type="text" id="expmonth" name="expmonth" placeholder="September">&emsp;&emsp;
            Exp Year :&emsp;&emsp;<input type="text" id="expyear" name="expyear" placeholder="2018"><br/></br>
            CVV : &emsp;&emsp;&emsp;&emsp;<input type="text" id="cvv" name="cvv" placeholder="352"><br/></br>
          <input type="checkbox" checked="checked" name="sameadr"> Insure my travel<br/></br>
        <input type="submit" value="Continue to checkout" class="btn">
        </div>

      </form>
    </div>
  </div>

</div>


</body>
</html>