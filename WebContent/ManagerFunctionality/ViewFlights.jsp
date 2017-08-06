<!-- RRP78 Roshan Patel -->

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


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Manager Home Page</h2>
<h4 align="right"> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>
<div align="right"><a href='../LogOut.jsp'>Log out</a></div>


<h3>Flight Information</h3>
<div align='right'><a href="../HomePages/ManagerHome.jsp">Back to Manager Home</a></div> <br>

<h4>List of all flights </h4>

<%

try{
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/TicketReservationSystem";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		Statement statement = connection.createStatement();
		
		/* Big ass query.  Joins tables and merges days_occurs into one column */
		String command = "select name, airlineID, flightNumber, group_concat(weekday) weekdays, dominter, "+
				"deptairport, deptDateTime, arrairport, arrivalDateTime, seatCount, fare "+
				"from Flight_operates "+
					"join Airlines using (airlineID) "+
				    "join Days_occurs using (airlineID, flightNumber)"+
				    "left outer join "+
						"(select airportID deptairport, deptDateTime, flightNumber, airlineID from Depart) d   "+
							"using (airlineID, flightNumber)"+
				    "left outer join "+
						"(select airportID arrairport, arrivalDateTime, flightNumber, airlineID from Arrive) a   "+
							"using (airlineID, flightNumber)"+
				"group by airlineID, flightNumber";
		ResultSet result = statement.executeQuery(command);

		
		//Make an HTML table to show the results in:
		out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("Airline Name");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("AirlineID");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Flight Number");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Operating Days");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Domestic/International");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Departing Airport");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Departing Time");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Arrival Airport");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Arrival Time");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Seat Count");
		out.print("</td>");
		
		
		//make a column
		out.print("<td>");
		out.print("Fare");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("airlineID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("flightNumber"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("weekdays"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("dominter"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("deptairport"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("deptDateTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("arrairport"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("arrivalDateTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("seatCount"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("fare"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		
		result.close();
		statement.close();
		connection.close();
		
} catch (Exception e){
	
}

%>

<br><br><br>
<a href="../HomePages/ManagerHome.jsp">Back to Manager Home</a>


</body>
</html>

