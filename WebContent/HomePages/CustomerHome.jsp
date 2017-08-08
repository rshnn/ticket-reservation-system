<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Home</title>
</head>
<body>

	<h1 align="center">Ticket Reservation System</h1>
	<h2 align="center">Customer Home Page</h2>
	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</b> <br>
	<a href='../LogOut.jsp'>Log out</a>
	</div>
	
	
	
	<!-- Search for flights - rrp -->
	<h3>Search for a flight and make a reservation:</h3>
	<a href="../Reservations/SearchOneWay.jsp">Search all One-Way flights</a><br>



	
	<ul>
		<li><a href="../Reservations/Reservation.jsp">Reserve</a></li>
		<li><a href="../Reservations/Search.jsp">Search Flight</a></li>
		<li><a href="../Reservations/Cancellation.jsp">Cancel Reservation</a></li>
	</ul>
</body>
</html>