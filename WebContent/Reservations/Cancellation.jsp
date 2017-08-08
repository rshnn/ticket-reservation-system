<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel Your Reservation</title>
</head>
<body>

	<h1 align="center">Ticket Reservation System</h1>
	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</b> <br>
	<a href='../LogOut.jsp'>Log out</a>
	</div>
	

	<h2>Enter Your Reservation Number To Cancel</h2>
	<form method="post" action="Cancel.jsp">
		Reservation Number*:	
		<input type="number" name="ResNo" min="1" required><br><br>
		<input type="submit" value="Cancel Reservation">
	</form>

	<br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
			
</body>
</html>