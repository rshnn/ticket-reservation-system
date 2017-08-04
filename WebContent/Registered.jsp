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
	<%
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/TicketReservationSystem";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Statement statement = connection.createStatement();
		String command = "SELECT * FROM Users WHERE username= '" + username + "' and password= '" + password + "' ";
		ResultSet result = statement.executeQuery(command);
		
			
		if (result.next()) {
			/* Get role and username.  Add to session */

			session.setAttribute("username", username);
			String role = result.getString("userType");
			session.setAttribute("userType", role);
			
			response.sendRedirect("Home.jsp");
		} else {
			out.println("Invalid information. <a href='LogIn.jsp'>Please try again</a>");
		}
		
		result.close();
		statement.close();
		connection.close();
	%>
</body>
</html>