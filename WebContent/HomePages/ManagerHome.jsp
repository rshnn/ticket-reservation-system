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
<h4 align="right"> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>
<div align="right"><a href='../LogOut.jsp'>Log out</a></div>


<h3>Employee Management</h3>

 <!-- View all employees -->
<a href="../ManagerFunctionality/ViewEmployees.jsp">View all employees.</a>


<br><br>
<!-- Add employee -->
<!-- <a href="../ManagerFunctionality/AddEmployeeForm.jsp"> Add a new employee</a>-->
<a>Add a new employee:</a>
<div>
	<form method="post" action="../Registration/NewUserType.jsp">
		<input type="radio" name=userType value="Manager">Manager <br>
		<input type="radio" name=userType value="CustomerRep">Customer Representative </input><br>
	<input type="submit" value="Confirm user role.">
</div>

<br>
Remove employee
<br>
Edit employee info

<br><br><br>

<h3>Customer Management</h3>
View all customers.
<br>
Add customer
<br>
Remove customer
<br>
Edit customer info

<br><br><br>

<h3>Flight Information</h3>
View all flights
<br>
View all flight reservations by customer or flightNumber
<br>
Flights from a given airport
<br>
Show all customers on given flight




<br><br><br>

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