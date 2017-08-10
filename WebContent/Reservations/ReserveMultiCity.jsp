<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Reservation</title>
</head>
<body>

	<h1 align="center">Ticket Reservation System</h1>
	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</b> <br>
	<a href='../LogOut.jsp'>Log out</a>
	</div>
	
<%-- 
	<br> Flight: <%=request.getParameter("reserveThisFlight")%>
	<br> Number passengers: <%=request.getParameter("reserveThisPassengers")%>
	<br> RouteID: <%=request.getParameter("reserveThisRouteID")%>
	<br> Weekday: <%=request.getParameter("reserveThisWeekday")%>
 --%>
<%

	String flightNumber = request.getParameter("flightNumber");
	String airlineID = request.getParameter("airlineID");
	String weekday = request.getParameter("weekday");
	int totalFare = 0;
	/* Query the DB for all routes on this specific flight. */
	
	
	String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	
	Statement statement = connection.createStatement();

	String command_route = "select name, airlineID, flightNumber, dominter, deptairportID,  " +
		"deptTime, arrairportID, arrivalTime, fare " +
		"from Runs " +
		"join Flight_operates using (airlineID, flightNumber) " +
		"join Days_occurs using (airlineID, flightNumber) " +
		"join Airlines using (airlineID) " +
		"join Routes using (routeID) " +
		"join Arrive using (routeID) " +
		"join Depart using (routeID) " +
		"where airlineID='"+airlineID+"' and flightNumber="+flightNumber+" and weekday='"+weekday+"'";
	ResultSet result_routes = statement.executeQuery(command_route); 

	
	
	url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
	connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	statement = connection.createStatement();

	String command2 = "select *  " +
			"from Users where userType='CustomerRep'";
	ResultSet result_reps = statement.executeQuery(command2); 
	

	
	
	
	while(result_routes.next()){
		
		String rt_airline = result_routes.getString("name");  
		String rt_airlineID = result_routes.getString("airlineID");
		String rt_flightNumber = result_routes.getString("flightNumber");
		String rt_dominter = result_routes.getString("dominter");
		String rt_deptairportID = result_routes.getString("deptairportID");
		String rt_deptTime = result_routes.getString("deptTime");
		String rt_arrairportID = result_routes.getString("arrairportID");
		String rt_arrivalTime = result_routes.getString("arrivalTime");
		int rt_fare = result_routes.getInt("fare");
		
		totalFare = totalFare + rt_fare;
		
		out.println("<br><b>Selected "+ rt_dominter+ " flight " + rt_airlineID + rt_flightNumber + " departing on " +rt_deptTime + ", " + weekday 
				+ " from " + rt_deptairportID + 
				" and arriving at " + rt_arrairportID + " around " +rt_arrivalTime +
				" <br>Cost is $"+ rt_fare + 
				" per ticket with a $50 booking fee.</b><br><br>");
		
	}
	%>
		
		<br><br>
		<form method="post" action="ReserveMultiCity_tell.jsp">
			Departure date: <input type="date" placeholder="yyyy-MM-dd" name="travelDate"><br>
			Number of passengers: <input type="number" name="passengerCount"><br>
			<input name="flightNumber" value="<%=flightNumber%>" hidden>
			<input name="airlineID" value="<%=airlineID%>" hidden>			
			<input name="weekday" value="<%=weekday%>" hidden>			
			<input name="totalFare" value="<%=totalFare%>" hidden>			

	
			Select a seat type:
			<select name='seatType'>
				<option value='Aisle'>Aisle </option>
				<option value='window'>Window</option>
			</select><br>
			
			Select a class:
			<select name='seatclass'>
				<option value='Economy'>Economy </option>
				<option value='Business'>Business</option>
				<option value='First'>First</option>
			</select><br>
			
			Select a meal:
			<select name='meal'>
				<option value='Chicken'>Chicken </option>
				<option value='Fish'>Fish</option>
				<option value='Steak'>Steak</option>
				<option value='Vegetarian'>Vegetarian</option>
				<option value='Ice cream sandwiches'>Ice cream sandwiches</option>
				<option value='Chocolate Cake'>Chocolate Cake</option>
			</select><br>
			
			Select a Customer Representative 
			<select name="rep">
				<%
				while(result_reps.next()){
					
					out.print("<option value='");
					out.print(result_reps.getString("username"));
					out.print("'> ");
					out.print(result_reps.getString("username"));
					out.print(" </option> ");					
				}
				
				%>
				
				
			</select> <br><br>
			
			
			<input type="submit" value="Book it!"> <br>
			Click only once and be patient please!
		</form>
		
	<% 

		
	
	
	result_reps.close();

	result_routes.close();
	statement.close();
	connection.close();
	connection.close();

	%>
		


	<br><br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
			
</body>
</html>