<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search One-Way Flights</title>
</head>
<body>

	<h1 align="center">Ticket Reservation System</h1>
	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</b> <br>
	<a href='../LogOut.jsp'>Log out</a>
	</div>
	
	<h2>One-Way flights listing</h2>
	
<%


try{
	String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	
	Statement statement = connection.createStatement();
	
	String command = "select name, concat(airlineID, flightNumber) flight, weekday, dominter,  " +
			"deptairportID, deptTime, arrairportID, arrivalTime, seatCount, fare, routeID  " +
			"from Flight_operates " +
		    "join Airlines using (airlineID) " +
		    "join Days_occurs using (airlineID, flightNumber) " +
		    "join Runs using (airlineID, flightNumber) " +
		    "join Routes using (routeID) " +
		    "join Depart using (routeID) " +
		    "join Arrive using (routeID)";
	ResultSet result = statement.executeQuery(command); 

	//Make an HTML table to show the results in:
	out.print("<table border='1'>");

	//make a row
	out.print("<tr>");
	
	//Column for button
	out.print("<td>");
	out.print("Reserve");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Airline Name");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Flight");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Operating Day");
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
	out.print("Fare");
	out.print("</td>");
	
	out.print("</tr>");
	
	
	//parse out the results
	while (result.next()) {
		
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		%>
		<form method='post' action='ReserveOneWay.jsp'>
			<input name="reserveThisFlight" value="<%=result.getString("flight")%>" hidden>
			<input name="reserveThisRouteID" value="<%=result.getString("routeID")%>" hidden>
			<input name="reserveThisWeekday" value="<%=result.getString("weekday")%>" hidden>			
			<input type="submit" value="Book">
		</form>
		<%
		
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("name"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("flight"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("weekday"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("dominter"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("deptairportID"));
		out.print("</td>");
		out.print("<td>");			
		out.print(result.getString("deptTime"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("arrairportID"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("arrivalTime"));
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


	
	
	
	
	
	
	

	<br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
	
</body>
</html>