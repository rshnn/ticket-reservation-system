<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reservation</title>
</head>
<body>

	<h1 align="center">Ticket Reservation System</h1>
	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</b> <br>
	<a href='../LogOut.jsp'>Log out</a>
	</div>
	


	<h2>Input Reservation Information</h2>
	<form method="post" action="Reserve.jsp">
		Number of Passengers*:
		<br>
		<input type="number" name="passengers" min="1" required>
		<br> Depart On*:
		<br>
		<input type="date" name="ddate" required>
		<br> Return On:
		<br>
		<input type="date" name="rdate">
		<br>Departure*:
		<br>
		<input type="text" name="departure" maxlength="3" required>
		<br> Destination*:
		<br>
		<input type="text" name="destination" maxlength="3" required>
		<br> Ticket Types*
		<br>
		<select name = "ticket">
			<option value="O">One-Way</option>
			<option value="R">Round-Trip</option>
			<option value="M">Multiple Cities</option>
		</select>
		<br>
		<br>
		<input type="submit" value="Reserve">
	</form>
</body>
</html>