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

<h3>Manager Home Page</h3>
<h4> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>

Employee managing stuff: 
<br>
View all customers.
<br>
View all employees.
<br>
View all flights
<br>
View all flight reservations by customer or flightNumber
<br>
Add employee
<br>
Edit employee info
<br>
Obtain sales report for month.


</body>
</html>