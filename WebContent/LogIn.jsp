<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login to Ticket Reservation System</title>
</head>
<body>
	<br>
	<form method="post" action="Registered.jsp">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" maxlength="15" required></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" maxlength="20"
					required></td>
			</tr>
		</table>
		<br> <input type="submit" value="Log In">
	</form>
	<br>
	<a href="Register.jsp">New User? Register Here.</a>
</body>
</html>