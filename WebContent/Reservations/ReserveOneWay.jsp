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
	String flight 			= request.getParameter("reserveThisFlight");
	String routeID 			= request.getParameter("reserveThisRouteID");
	String weekday 			= request.getParameter("reserveThisWeekday");
	
	
	/* Need to figure out totalFare (assuming bookingFee is always 50) */	
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
			"where concat(airlineID, flightNumber)='"+ flight +"'" +
			"and routeID=" + routeID +" " + 
			"and weekday='" + weekday +"'";
	ResultSet result_myflight = statement.executeQuery(command); 

	

	
	
	
	if(result_myflight.next()){
		int fare = result_myflight.getInt("fare");
		String dominter = result_myflight.getString("dominter");
		String deptairportID = result_myflight.getString("deptairportID");
		String arrairportID = result_myflight.getString("arrairportID");
		String deptTime = result_myflight.getString("deptTime");
		String arrivalTime = result_myflight.getString("arrivalTime");
		String airlineID = result_myflight.getString("airlineID");
		int flightNumber = result_myflight.getInt("flightNumber");
		
		out.println("Selected "+ dominter+ " flight " + flight + " departing on " +deptTime + ", " + weekday 
				+ " from " + deptairportID + 
				" and arriving at " + arrairportID + " around " +arrivalTime +
				" <br>Cost is $"+ fare + 
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
		<form method="post" action="ReserveOneWay_tell.jsp">
			Departure date: <input type="date" placeholder="yyyy-MM-dd" name="travelDate"><br>
			Number of passengers: <input type="number" name="passengerCount"><br>
			<input name="flight" value="<%=flight%>" hidden>
			<input name="flightNumber" value="<%=flightNumber%>" hidden>
			<input name="airlineID" value="<%=airlineID%>" hidden>			
			<input name="routeID" value="<%=routeID%>" hidden>
			<input name="weekday" value="<%=weekday%>" hidden>			
			<input name="deptTime" value="<%=deptTime%>" hidden>			
			<input name="arrivalTime" value="<%=arrivalTime%>" hidden>			
			<input name="deptairportID" value="<%=deptairportID%>" hidden>			
			<input name="arrairportID" value="<%=arrairportID%>" hidden>			
			<input name="fare" value="<%=fare%>" hidden>			
	
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

	}
		result_myflight.close();
		statement.close();
		connection.close();
			
	
	
	%>
		
		



	<br><br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
			
</body>
</html>