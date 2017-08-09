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
	String numPassengers 	= request.getParameter("reserveThisPassengers");
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
		
		out.println("Selected "+ numPassengers +" ticket(s) for "+dominter+ " flight " + flight +
					" leaving on " + weekday + "."	
				);
	
				
		%>
		<br><br> Please enter a date to travel.
		<form>
			<input type="date" name="travelDate">
			<input type="submit" value="Book it!">
		</form>
		
		
		<%
	
				
				
	}

	result_myflight.close();
	statement.close();
	connection.close();
%>





	<br><br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
			
</body>
</html>