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

	String depart_airportID = request.getParameter("depart_airportID");
	String dest_airportID = request.getParameter("dest_airportID");
	
	
	/* The departing flight. */
	String departFlight = request.getParameter("departFlight");
	String departRouteID = request.getParameter("departRouteID");
	String departWeekday = request.getParameter("departWeekday");
	String departdeptTime = request.getParameter("departdeptTime");
		
	/* The return flight. */
	String returnFlight = request.getParameter("returnFlight");
	String returnRouteID = request.getParameter("returnRouteID");
	String returnWeekday = request.getParameter("returnWeekday");
	String returndeptTime = request.getParameter("returndeptTime");

	
	
	
	
	/* Query for the depart flight */	
	String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	
	Statement statement = connection.createStatement();
	
	String command = "select *  " +
			"from Flight_operates " +
			"join Days_occurs using (airlineID, flightNumber) " +
			"join Runs using (airlineID, flightNumber) " +
			"join Routes using (routeID) " +
			"join Arrive using (routeID) " + 
			"join Depart using (routeID) " +
			"where concat(airlineID, flightNumber)='"+ departFlight +"'" +
			"and routeID=" + departRouteID +" " + 
			"and weekday='" + departWeekday +"'";
	ResultSet result_deptflight = statement.executeQuery(command); 

	
	if(result_deptflight.next()){
		int deptfare = result_deptflight.getInt("fare");
		String dept_dominter = result_deptflight.getString("dominter");
		String dept_deptairportID = result_deptflight.getString("deptairportID");
		String dept_arrairportID = result_deptflight.getString("arrairportID");
		String dept_deptTime = result_deptflight.getString("deptTime");
		String dept_arrivalTime = result_deptflight.getString("arrivalTime");
		String dept_airlineID = result_deptflight.getString("airlineID");
		int dept_flightNumber = result_deptflight.getInt("flightNumber");
		
		out.println("<br><b>Departing flight: </b><br>");
		out.println("Selected "+ dept_dominter+ " flight " + departFlight + " departing on " + dept_deptTime + ", " + departWeekday 
				+ " from " + dept_deptairportID + 
				" and arriving at " + dept_arrairportID + " around " +dept_arrivalTime +
				" <br>Cost is $"+ deptfare + 
				" per ticket with a $50 booking fee.");
		
		

		
		/* Query for the return flight */
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String command_return = "select *  " +
				"from Flight_operates " +
				"join Days_occurs using (airlineID, flightNumber) " +
				"join Runs using (airlineID, flightNumber) " +
				"join Routes using (routeID) " +
				"join Arrive using (routeID) " + 
				"join Depart using (routeID) " +
				"where concat(airlineID, flightNumber)='"+ returnFlight +"'" +
				"and routeID=" + returnRouteID +" " + 
				"and weekday='" + returnWeekday +"'";
		ResultSet result_returnflight = statement.executeQuery(command_return); 

		
		
		if(result_returnflight.next()){
			int returnfare = result_deptflight.getInt("fare");
			String ret_dominter = result_returnflight.getString("dominter");
			String ret_deptairportID = result_returnflight.getString("deptairportID");
			String ret_arrairportID = result_returnflight.getString("arrairportID");
			String ret_deptTime = result_returnflight.getString("deptTime");
			String ret_arrivalTime = result_returnflight.getString("arrivalTime");
			String ret_airlineID = result_returnflight.getString("airlineID");
			int ret_flightNumber = result_returnflight.getInt("flightNumber");
			
			out.println("<br><br><b>Returning flight: </b><br>");
			out.println("Selected "+ ret_dominter+ " flight " + returnFlight + " departing on " + ret_deptTime + ", " + returnWeekday 
					+ " from " + ret_deptairportID + 
					" and arriving at " + ret_arrairportID + " around " + ret_arrivalTime +
					" <br>Cost is $"+ returnfare + 
					" per ticket with a $50 booking fee.");
			
			
		
		
		
		
		
		
		
				url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
				connection = null;
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
				statement = connection.createStatement();
			
				String command2 = "select *  " +
						"from Users where userType='CustomerRep'";
				ResultSet result_reps = statement.executeQuery(command2); 
		
		
		%>
		
		<br><br>
		<form method="post" action="ReserveRoundTrip_tell.jsp">
			Number of passengers: <input type="number" name="passengerCount"><br><br><br>


			
			<!-- dept flight -->
			<b>Departure Flight</b><br>
			Departure date: <input type="date" placeholder="yyyy-MM-dd" name="dept_travelDate"><br>

			<input name="dept_flight" value="<%=departFlight%>" hidden>
			<input name="dept_flightNumber" value="<%=dept_flightNumber%>" hidden>
			<input name="dept_airlineID" value="<%=dept_airlineID%>" hidden>			
			<input name="dept_routeID" value="<%=departRouteID%>" hidden>
			<input name="dept_weekday" value="<%=departWeekday%>" hidden>			
			<input name="dept_deptTime" value="<%=dept_deptTime%>" hidden>			
			<input name="dept_arrivalTime" value="<%=dept_arrivalTime%>" hidden>			
			<input name="dept_deptairportID" value="<%=dept_deptairportID%>" hidden>			
			<input name="dept_arrairportID" value="<%=dept_arrairportID%>" hidden>			
			<input name="dept_fare" value="<%=deptfare%>" hidden>			
	
			Select a seat type:
			<select name='dept_seatType'>
				<option value='Aisle'>Aisle </option>
				<option value='window'>Window</option>
			</select><br>
			
			Select a class:
			<select name='dept_seatclass'>
				<option value='Economy'>Economy </option>
				<option value='Business'>Business</option>
				<option value='First'>First</option>
			</select><br>
			
			Select a meal:
			<select name='dept_meal'>
				<option value='Chicken'>Chicken </option>
				<option value='Fish'>Fish</option>
				<option value='Steak'>Steak</option>
				<option value='Vegetarian'>Vegetarian</option>
				<option value='Ice cream sandwiches'>Ice cream sandwiches</option>
				<option value='Chocolate Cake'>Chocolate Cake</option>
			</select><br>
			
			
			<br><br>
			<!-- return flight -->
			<b>Return Flight</b><br>
			Return date: <input type="date" placeholder="yyyy-MM-dd" name="ret_travelDate"><br>

			<input name="ret_flight" value="<%=returnFlight%>" hidden>
			<input name="ret_flightNumber" value="<%=ret_flightNumber%>" hidden>
			<input name="ret_airlineID" value="<%=ret_airlineID%>" hidden>			
			<input name="ret_routeID" value="<%=returnRouteID%>" hidden>
			<input name="ret_weekday" value="<%=returnWeekday%>" hidden>			
			<input name="ret_deptTime" value="<%=ret_deptTime%>" hidden>			
			<input name="ret_arrivalTime" value="<%=ret_arrivalTime%>" hidden>			
			<input name="ret_deptairportID" value="<%=ret_deptairportID%>" hidden>			
			<input name="ret_arrairportID" value="<%=ret_arrairportID%>" hidden>			
			<input name="ret_fare" value="<%=returnfare%>" hidden>			
	
			Select a seat type:
			<select name='ret_seatType'>
				<option value='Aisle'>Aisle </option>
				<option value='window'>Window</option>
			</select><br>
			
			Select a class:
			<select name='ret_seatclass'>
				<option value='Economy'>Economy </option>
				<option value='Business'>Business</option>
				<option value='First'>First</option>
			</select><br>
			
			Select a meal:
			<select name='ret_meal'>
				<option value='Chicken'>Chicken </option>
				<option value='Fish'>Fish</option>
				<option value='Steak'>Steak</option>
				<option value='Vegetarian'>Vegetarian</option>
				<option value='Ice cream sandwiches'>Ice cream sandwiches</option>
				<option value='Chocolate Cake'>Chocolate Cake</option>
			</select><br><br><br>
			
			
			
			
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
		}
		result_deptflight.close();
		result_returnflight.close();

	
	}
		result_deptflight.close();
		statement.close();
		connection.close();
			
	
	
	%>
		


	<br><br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
			
</body>
</html>