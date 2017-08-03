<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register for Ticket Reservation System</title>
</head>
<body>
	<%
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/TicketReservationSystem";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		/* Getting new user information */
		String newusername 	= request.getParameter("newusername");
		String newpassword 	= request.getParameter("newpassword");
		String newfirstname = request.getParameter("newfirstname");
		String newlastname 	= request.getParameter("newlastname");
		String newphone 	= request.getParameter("newphone");
		String newaddress 	= request.getParameter("newaddress");
		String newcity 		= request.getParameter("newcity");
		String newstate 	= request.getParameter("newstate");
		String newzipcode 	= request.getParameter("newzipcode");
		String newssn 		= request.getParameter("newssn");
		String newhourlyRate= request.getParameter("newhourlyRate");
		
		
		/* Account creation date */
		long millis=System.currentTimeMillis();
		java.sql.Date newdate= new java.sql.Date(millis);

		
		
		
		Statement statement = connection.createStatement();
		String command = "SELECT * FROM Users WHERE username= '" + newusername + "'";
		ResultSet result = statement.executeQuery(command);
		if (result.next()) {
			out.println("Username already exists. <a href='Register.jsp'> Register with new username.</a>");
			connection.close();
		} else {
			String command2 = "INSERT INTO Users (userType, username, password, firstName, lastName, "+
							"phone, address, city, state, zipCode, ssn, hourlyRate, creationDate, startDate) VALUES ('Manager', '" + 
									newusername + "','" + newpassword + "','" + 
									newfirstname + "','" + newlastname + "','" + 
									newphone + "','" + newaddress + "','" + 
									newcity + "','" + newstate + "','" + 
									newzipcode + "','" + newssn + "', " +
									newhourlyRate + ",'" + newdate + "','" + newdate + "')";
			
			statement.executeUpdate(command2);
			out.println("Registration is successful!  <a href='../LogIn.jsp'> Log In Here</a>");
			connection.close();
		}
	%>
</body>
</html>