<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Reservation System: Login or Register</title>
</head>
<body>

<%
session.setAttribute("username", null);
session.setAttribute("userType", null);

%>

	<h1>Ticket Reservation System</h1>
	<h4>Group 4</h4>
	<ul>
		<li><a href="LogIn.jsp">Log In</a></li>
		<li><a href="Registration/Register.jsp">Register</a></li>
	</ul>
	
	
	
</body>
</html>