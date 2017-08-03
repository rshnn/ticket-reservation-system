<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register for Ticket Reservation System</title>
</head>
<body>
	<h1>User Registration</h1>
	<p>Select your user type.</p>	
	<form method="post" action="NewUserType.jsp">

			<input type="radio" name=userType value="Customer">Customer <br>
			<input type="radio" name=userType value="Manager">Manager <br>
			<input type="radio" name=userType value="CustomerRep">Customer Representative </input>
		
	
		<br><br> <input type="submit" value="Continue..">
	</form>
</body>
</html>