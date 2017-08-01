<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Ticket Reservation System</title>
</head>
<body>
	<%
		if ((session.getAttribute("Username") == null) || (session.getAttribute("Username") == "")) {
	%>
	You are not logged in.
	<br>
	<a href="LogIn.jsp">Please Login Here</a>
	<%
		}
		else {
	%>
	<h1>Welcome to Ticket Reservation System!</h1>
	<h3>
		You are currently logged in as
		<%=session.getAttribute("Username")%>
	</h3>
	<%
		}
	%>
	<a href='LogOut.jsp'>Log out</a>
</body>
</html>