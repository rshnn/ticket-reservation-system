<!-- RRP78 Roshan Patel -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Home</title>
</head>
<body>


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Manager Home Page</h2>

<div align="right"> <b> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</b> <br>
<a href='../LogOut.jsp'>Log out</a>
</div>


<!-- testing cancel.jsp -->
TODO REMOVE THIS:<br>
Testing Cancel.jsp.
<form method="post" action="Cancel.jsp">
	ResNo: <input type="text" name="ResNo">
	<input type="submit" value="Submit"><br>
TODO REMOVE THIS
</form>


<!------------------------>
<!-- EMPLOYEE MANAGEMENT-->
<!------------------------>
<h3>Employee Management</h3>

 <!-- View all employees -->
<a href="../ManagerFunctionality/ViewEmployees.jsp">View all employees</a>


<br><br>
<!-- Add employee -->
<b>Add a new employee:</b>
<div>
	<form method="post" action="../Registration/NewUserType.jsp">
		<input type="radio" name=userType value="Manager">Manager <br>
		<input type="radio" name=userType value="CustomerRep">Customer Representative <br>
	<input type="submit" value="Confirm user role">
	</form>
</div>

<br>
Remove employee
<br>
Edit employee info

<br><br><br>



<!------------------------>
<!-- CUSTOMER MANAGEMENT -->
<!------------------------>
<h3>Customer Management</h3>
View all customers.
<br>
Add customer
<br>
Remove customer
<br>
Edit customer info

<br><br><br>




<!------------------------>
<!-- FLIGHT INFORMATION -->
<!------------------------>
<h3>Flight Information</h3>

<!-- View all flights -->
<a href="../ManagerFunctionality/ViewFlights.jsp">View all flights</a>

<br><br>
<!-- View all flight reservations by customer or flightNumber-->
<div>
	<b>Find Flight Reservation by: </b>
	<form method="post" action="../ManagerFunctionality/ViewFlightsCustomer.jsp">
		Customer's Name (First Last)<input type="text" name=fullname>
	<input type="submit" value="Search">
	</form>
	
	<form method="post" action="../ManagerFunctionality/ViewFlightsFlightNumber.jsp">
		Flight Number <input type="text" name=flightNumber>
	<input type="submit" value="Search">
	</form>
</div>


<!-- View all flights touching an airport -->
<br>
<div>
	<b>Find all flights at the following airport: </b>
	<form method="post" action="../ManagerFunctionality/ViewFlightsAirport.jsp">
		AirportID (3 character code)<input type="text" name=airportID>
	<input type="submit" value="Search">
	</form>
</div>



<br>
<!-- Show all customers on given flight -->
<div>
	<b>Show all customers who have reserved seats on: </b>
	<form method="post" action="../ManagerFunctionality/ViewCustomersOnFlight.jsp">
		AirlineID and FlightNumber (Ex: UA2221)<input type="text" name=flight>
	<input type="submit" value="Search">
	</form>
</div>



<br><br><br>


<!------------------------>
<!--SALES AND REVENUE  --->
<!------------------------>
<h3>Sales and Revenue</h3>
Revenue summary of: <br>
	(a) a particular flight <br>
	(b) destination city <br>
	(c) particular customer <br>
<br>
Obtain sales report for month.
<br>



</body>
</html>