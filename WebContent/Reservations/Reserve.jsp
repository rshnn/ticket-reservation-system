<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register for Ticket Reservation System</title>
</head>
<body>

	<h1 align="center">Ticket Reservation System</h1>
	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</b> <br>
	<a href='../LogOut.jsp'>Log out</a>
	</div>

	<%
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/TicketReservationSystem";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");

		/* Getting new user information */
		String username = (String) session.getAttribute("username");
		int passengers = Integer.parseInt(request.getParameter("passengers"));
		String ddate = request.getParameter("ddate");
		String rdate = request.getParameter("rdate");
		String departport = request.getParameter("departure");
		String arriveport = request.getParameter("destination");
		String ticket = request.getParameter("ticket");
		Statement statement = connection.createStatement();
		String RESERVE = "INSERT INTO Customer_Reservations(username, passengers, departure_date, return_date, departure, destination, ticket_type) VALUES ('"
				+ username + "','" + passengers + "','" + ddate + "', '" + rdate + "', '" + departport + "', '"
				+ arriveport + "', '" + ticket + "')";
		statement.executeUpdate(RESERVE);
		out.println(
				"Reservation is successful! Unique reservation number will be sent to you later.  <a href='../LogOut.jsp'> Log Out here</a>");
		connection.close();
	%>
	
	
		<br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
	
</body>
</html>