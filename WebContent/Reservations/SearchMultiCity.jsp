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
	
	<h2>Multi-City flight listings</h2>
	
<%


try{
	String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	
	Statement statement = connection.createStatement();
	
	String command = "select * " +
			"from Flight_operates " +
			"join Days_occurs using(airlineID, flightNumber)";
	ResultSet result = statement.executeQuery(command); 

	
	while(result.next()){
		
		
		
		int flightNumber = result.getInt("flightNumber");
		String airlineID = result.getString("airlineID");
		String weekday = result.getString("weekday");
		
		out.print("<br><b>Flight " + airlineID + flightNumber + " departing on " + weekday+ ". </b>");
		
		%>
		<form method="post" action="ReserveMultiCity.jsp">
			<input name='flightNumber' value="<%=flightNumber%>" hidden>
			<input name='airlineID' value="<%=airlineID%>" hidden>
			<input name='weekday' value="<%=weekday%>" hidden>
			<input type='submit' value="Book this series">
		</form>
		<%
		
		/* Query details of each route on this flight */
		Connection connection2 = null;

		Class.forName("com.mysql.jdbc.Driver");
		connection2 = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");

		Statement statement2 = connection2.createStatement();

		String command_route = "select name, concat(airlineID, flightNumber) flight, dominter, deptairportID,  " +
				"deptTime, arrairportID, arrivalTime, fare " +
				"from Runs " +
				"join Flight_operates using (airlineID, flightNumber) " +
				"join Days_occurs using (airlineID, flightNumber) " +
				"join Airlines using (airlineID) " +
				"join Routes using (routeID) " +
				"join Arrive using (routeID) " +
				"join Depart using (routeID) " +
				"where airlineID='"+airlineID+"' and flightNumber="+flightNumber+" and weekday='"+weekday+"'";
		ResultSet result_route = statement2.executeQuery(command_route); 
		

		
		out.print("<table border='1'>");
		//make a row
		out.print("<tr>");
		
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
		
		while(result_route.next()){
			
			//make a row
			out.print("<tr>");
			//make a column
			
			out.print("<td>");
			out.print(result_route.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result_route.getString("flight"));
			out.print("</td>");
			out.print("<td>");
			out.print(result_route.getString("dominter"));
			out.print("</td>");
			out.print("<td>");
			out.print(result_route.getString("deptairportID"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result_route.getString("deptTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result_route.getString("arrairportID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result_route.getString("arrivalTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result_route.getString("fare"));		
			out.print("</td>");

			out.print("</tr>");
			
			
		}
		
		out.print("</table><br>");
		
		connection2.close();

	}	

	result.close();
	statement.close();
	connection.close();

	
} catch (Exception e){

}




%>



	<br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
	
</body>
</html>