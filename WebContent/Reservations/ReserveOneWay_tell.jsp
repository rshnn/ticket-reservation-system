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
	
<%

	/* Todays date */
	long millis=System.currentTimeMillis();
	java.sql.Date reservationDate= new java.sql.Date(millis); 

	String cust_username 	= String.valueOf(session.getAttribute("username"));
	String flight 			= request.getParameter("flight");
	String airlineID 		= request.getParameter("airlineID");
	int flightNumber		= Integer.parseInt(request.getParameter("flightNumber"));

	String routeID 			= request.getParameter("routeID");
	String weekday 			= request.getParameter("weekday");
	int passengerCount		= Integer.parseInt(request.getParameter("passengerCount"));
	int fare 				= Integer.parseInt(request.getParameter("fare"));
	String travelDate 		= request.getParameter("travelDate");
	String deptTime			= request.getParameter("deptTime");
	String arrivalTime		= request.getParameter("arrivalTime");
	String deptairportID	= request.getParameter("deptairportID");
	String arrairportID		= request.getParameter("arrairportID");
	
	String rep_username 	= request.getParameter("rep");
	String seatType 		= request.getParameter("seatType");
	String seatclass 		= request.getParameter("seatclass");
	String meal 			= request.getParameter("meal");

	/* TODO add logic to bump up the date of arrival if overnight flight */
	String deptDateTime = travelDate + " " + deptTime;
	String arrivalDateTime = travelDate + " " + arrivalTime;
	int totalFare = (fare*passengerCount) + 50;
			
	/*************************************************************************************/
	/* Write into Reservations. */
	/* 
		insert into Reservations (dateReserved, totalFare, bookingFee, passengers, type)
		values (travelDate, totalFare, 50, passengerCount, 'One-Way' );
	*/
	
	String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	Statement statement = connection.createStatement();
	
	String command_res = "insert into Reservations (dateReserved, totalFare, bookingFee, passengers, type, cust_username) " +
					" values ('"+reservationDate + "', " + totalFare + ", " + 
					" 50, " + passengerCount+ ", 'One-Way', '"+ cust_username +"')";
	statement.executeUpdate(command_res); 
	connection.close();
	
	
	/* Get resNo. (It will be the largest integer under cust_username)*/
	connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	statement = connection.createStatement();
	
	String query_resNo = "select max(ResNo) resNo " + 
					"from Reservations " + 
					"where cust_username='"+ cust_username +"'";
	ResultSet result_resNo = statement.executeQuery(query_resNo); 
	
	int resNo = 0;
	if(result_resNo.next()){
		resNo = result_resNo.getInt("resNo");
	}else{
		out.println("<br>Failed it add new reservation.  <a href='../HomePages/CustomerHome.jsp'>Try again.</a>");
	}
	result_resNo.close();
	statement.close();
	connection.close();
	
	/*************************************************************************************/
	/* Write into Records */
	/* 
		insert into Records(resNo, username) values (resNo, rep_username)
	*/
	connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
	statement = connection.createStatement();
	
	String command_rec = "insert into Records (resNo, username) values " + 
							"( "+resNo+", '"+rep_username+"');";
	statement.executeUpdate(command_rec); 
	connection.close();
	
	int temp = passengerCount;
	
	while(temp > 0){
		/*************************************************************************************/
		/* Write into Tickets */
		/* Got everything we need stored in globals. 
		*/
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String command_tix = "insert into Tickets (seatNo, seatType, meal, class, deptDateTime, arrivalDateTime, deptAirportID, arrAirportID, cust_username) values " + 
								"( 1, '"+seatType+"', '"+meal+"',  '"+seatclass+"',  '"+deptDateTime+"',  '"+arrivalDateTime+"', " +
								" '"+deptairportID+"',  '"+arrairportID+"', '"+cust_username+"');";
		statement.executeUpdate(command_tix); 
		connection.close();
		
		
		/* Get ticketID. (It will be the largest integer under cust_username)*/
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String query_ticketID = "select max(ticketID) ticketID " + 
						"from Tickets " + 
						"where cust_username='"+ cust_username +"'";
		ResultSet result_ticketID = statement.executeQuery(query_ticketID); 
		
		int ticketID = 0;
		if(result_ticketID.next()){
			ticketID = result_ticketID.getInt("ticketID");
		}else{
			out.println("<br>Failed it add new reservation.  <a href='../HomePages/CustomerHome.jsp'>Try again.</a>");
		}
		result_resNo.close();
		statement.close();
		connection.close();
	
	
		
		/*************************************************************************************/
		/* Write into Purchases */
	
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String command_purch = "insert into Purchases (ticketID, username, resNo, flightNumber, airlineID) values  " + 
								"( "+ticketID+", '"+cust_username+"',  "+resNo+",  "+flightNumber+",  '"+airlineID+"');";
		statement.executeUpdate(command_purch); 
		connection.close();
		
	
		out.println("<br>Succssfully purchased new ticket for passenger "+temp+"!" + 
				" <br>TicketID : " + ticketID +
				" for " + airlineID + flightNumber + "<br><br>");
	
		temp--;
	}

	out.println("<br><br>Succssfully added new reservation!" + 
			" <br>Reservation Number : " + resNo + 
			" <br>Customer Rep : " + rep_username + 
			" <br>Total Cost : "+ totalFare);



%>
		


	<br><br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
			
</body>
</html>