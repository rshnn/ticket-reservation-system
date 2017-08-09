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
	
	<h2>
		Round-Trip flight listings from 
		<%=request.getParameter("depart_airportID")%> to 
		<%=request.getParameter("dest_airportID")%>
	</h2>
	
<%


try{
		
	
	String depart_airportID = request.getParameter("depart_airportID");
	String dest_airportID = request.getParameter("dest_airportID");
	
	
	/* The departing flight. */
	String departFlight = request.getParameter("departFlight");
	String departRouteID = request.getParameter("departRouteID");
	String departWeekday = request.getParameter("departWeekday");
	String departdeptTime = request.getParameter("departdeptTime");

	out.println("Selected " + departFlight + " leaving on " + departdeptTime + ", " + departWeekday + ".");
	
	
	
	/* Now finding return flight */
	String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	
	Statement statement = connection.createStatement();
	
	String command_return = "select name, concat(airlineID, flightNumber) flight, weekday, dominter, " +
			"deptairportID, deptTime, arrairportID, arrivalTime, seatCount, fare, routeID " +
			"from Routes join Depart using (routeID) " +
			"join Arrive using (routeID) " +
			"join Runs using (routeID) " +
			"join Flight_operates using (airlineID, flightNumber) " +
			"join Days_occurs using (airlineID, flightNumber) " +
			"join Airlines using (airlineID) " +
			"where deptairportID='"+dest_airportID+"' " +
			"and arrairportID='"+ depart_airportID +"'";
	ResultSet result_return = statement.executeQuery(command_return); 

	//Make an HTML table to show the results in:

	out.println("<br><br><b>Select a return flight from "+dest_airportID+" to "+depart_airportID+" :</b><br>");
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
	while (result_return.next()) {
		
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		%>
		<form method='post' action='ReserveRoundTrip.jsp'>
			<input name="departFlight" value="<%=departFlight%>" hidden>
			<input name="departRouteID" value="<%=departRouteID%>" hidden>
			<input name="departWeekday" value="<%=departWeekday%>" hidden>
			<input name="departdeptTime" value="<%=departdeptTime%>" hidden>


			<input name="returnFlight" value="<%=result_return.getString("flight")%>" hidden>
			<input name="returnRouteID" value="<%=result_return.getString("routeID")%>" hidden>
			<input name="returnWeekday" value="<%=result_return.getString("weekday")%>" hidden>
			<input name="returndeptTime" value="<%=result_return.getString("deptTime")%>" hidden>
			
			
			<input name="depart_airportID" value="<%=depart_airportID%>" hidden>
			<input name="dest_airportID" value="<%=dest_airportID%>" hidden>

						
			<input type="submit" value="Select">
		</form>
		<%
		
		out.print("</td>");
		
		out.print("<td>");
		out.print(result_return.getString("name"));
		out.print("</td>");
		out.print("<td>");
		out.print(result_return.getString("flight"));
		out.print("</td>");
		out.print("<td>");
		out.print(result_return.getString("weekday"));
		out.print("</td>");
		out.print("<td>");
		out.print(result_return.getString("dominter"));
		out.print("</td>");
		out.print("<td>");
		out.print(result_return.getString("deptairportID"));
		out.print("</td>");
		out.print("<td>");			
		out.print(result_return.getString("deptTime"));
		out.print("</td>");
		out.print("<td>");
		out.print(result_return.getString("arrairportID"));
		out.print("</td>");
		out.print("<td>");
		out.print(result_return.getString("arrivalTime"));
		out.print("</td>");
		out.print("<td>");
		out.print(result_return.getString("fare"));		
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	
	result_return.close();
	statement.close();
	connection.close();
	
} catch (Exception e){

}



%>


		

	<br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
	
</body>
</html>