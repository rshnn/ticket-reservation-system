<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page
	import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
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

	String cust_username 	= String.valueOf(session.getAttribute("username"));
	int passengerCount		= Integer.parseInt(request.getParameter("passengerCount"));	
	String rep_username 	= request.getParameter("rep");

	/* Todays date */
	long millis=System.currentTimeMillis();
	java.sql.Date reservationDate= new java.sql.Date(millis); 
	
	

	/* departing flight info  */
	String dept_flight 			= request.getParameter("dept_flight");
	String dept_airlineID 		= request.getParameter("dept_airlineID");
	int dept_flightNumber		= Integer.parseInt(request.getParameter("dept_flightNumber"));
	String dept_routeID 			= request.getParameter("dept_routeID");
	String dept_weekday 			= request.getParameter("dept_weekday");
	int dept_fare 				= Integer.parseInt(request.getParameter("dept_fare"));
	String dept_travelDate 		= request.getParameter("dept_travelDate");
	String dept_deptTime			= request.getParameter("dept_deptTime");
	String dept_arrivalTime		= request.getParameter("dept_arrivalTime");
	String dept_deptairportID	= request.getParameter("dept_deptairportID");
	String dept_arrairportID		= request.getParameter("dept_arrairportID");
	String dept_seatType 		= request.getParameter("dept_seatType");
	String dept_seatclass 		= request.getParameter("dept_seatclass");
	String dept_meal 			= request.getParameter("dept_meal");
	String dept_deptDateTime 		= dept_travelDate + " " + dept_deptTime;
	String dept_arrivalDateTime 		= dept_travelDate + " " + dept_arrivalTime;
	int dept_totalFare 				= (dept_fare*passengerCount);
			
	
	/* returning flight info  */
	String ret_flight 			= request.getParameter("ret_flight");
	String ret_airlineID 		= request.getParameter("ret_airlineID");
	int ret_flightNumber		= Integer.parseInt(request.getParameter("ret_flightNumber"));
	String ret_routeID 			= request.getParameter("ret_routeID");
	String ret_weekday 			= request.getParameter("ret_weekday");
	int ret_fare 				= Integer.parseInt(request.getParameter("ret_fare"));
	String ret_travelDate 		= request.getParameter("ret_travelDate");
	String ret_deptTime			= request.getParameter("ret_deptTime");
	String ret_arrivalTime		= request.getParameter("ret_arrivalTime");
	String ret_deptairportID	= request.getParameter("ret_deptairportID");
	String ret_arrairportID		= request.getParameter("ret_arrairportID");
	String ret_seatType 		= request.getParameter("ret_seatType");
	String ret_seatclass 		= request.getParameter("ret_seatclass");
	String ret_meal 			= request.getParameter("ret_meal");
	String ret_deptDateTime 		= ret_travelDate + " " + ret_deptTime;
	String ret_arrivalDateTime 		= ret_travelDate + " " + ret_arrivalTime;
	int ret_totalFare 				= (ret_fare*passengerCount);
	
	int totalFare = dept_totalFare + ret_totalFare + 50;
	
	/* TODO add logic to bump up the date of arrival if overnight flight */
	/* Determine Advanced Purchase  */
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date TravelDate = dateFormat.parse(dept_travelDate);

	int advanceDays = (int) (TravelDate.getTime() - reservationDate.getTime()) / (1000 * 60 * 60 * 24);
	long tdate = TravelDate.getTime();
	long rdate = reservationDate.getTime();
	long seconds = (tdate - rdate) / 1000;
	long minutes = seconds / 60;
	long hours = minutes / 60;
	int days = (int) hours / 24;
	int amountSaved = 0;
	
	if (days > 0 && days <= 3) {
		totalFare = totalFare - 20;
		amountSaved = 20;
	} else if (days > 3 && days <= 7) {
		totalFare = totalFare - 25;
		amountSaved = 25;
	} else if (days > 7 && days <= 14) {
		totalFare = totalFare - 30;
		amountSaved = 30;
	} else if (days > 14 && days <= 21) {
		totalFare = totalFare - 35;
		amountSaved = 35;
	} else if (days > 21) {
		totalFare = totalFare - 40;
		amountSaved = 40;
	} 



	
	
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
					" 50, " + passengerCount+ ", 'Round-Trip', '"+ cust_username +"')";
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
		/* Departing flight ticket and purchase */
		/*************************************************************************************/
		/* Write into Tickets */
		/* Got everything we need stored in globals. 
		*/
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String command_tix_dept = "insert into Tickets (seatNo, seatType, meal, class, deptDateTime, arrivalDateTime, deptAirportID, arrAirportID, cust_username) values " + 
								"( 1, '"+dept_seatType+"', '"+dept_meal+"',  '"+dept_seatclass+"',  '"+dept_deptDateTime+"',  '"+dept_arrivalDateTime+"', " +
								" '"+dept_deptairportID+"',  '"+dept_arrairportID+"', '"+cust_username+"');";
		statement.executeUpdate(command_tix_dept); 
		connection.close();
		
		
		/* Get ticketID. (It will be the largest integer under cust_username)*/
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String query_ticketID_dept = "select max(ticketID) ticketID " + 
						"from Tickets " + 
						"where cust_username='"+ cust_username +"'";
		ResultSet result_ticketID_dept = statement.executeQuery(query_ticketID_dept); 
		
		int dept_ticketID = 0;
		if(result_ticketID_dept.next()){
			dept_ticketID = result_ticketID_dept.getInt("ticketID");
		}else{
			out.println("<br>Failed it add new reservation.  <a href='../HomePages/CustomerHome.jsp'>Try again.</a>");
		}

	
		/*************************************************************************************/
		/* Write into Purchases */
	
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String command_purch_dept = "insert into Purchases (ticketID, username, resNo, flightNumber, airlineID) values  " + 
								"( "+dept_ticketID+", '"+cust_username+"',  "+resNo+",  "+dept_flightNumber+",  '"+dept_airlineID+"');";
		statement.executeUpdate(command_purch_dept); 
		connection.close();
		
	
		out.println("<br>Succssfully purchased new departing ticket for passenger "+temp+"!" + 
				" <br>TicketID : " + dept_ticketID + 
				" for " + dept_airlineID + dept_flightNumber);
	
	
		
		
		/*************************************************************************************/
		/* Returning flight ticket and purchase */
		/*************************************************************************************/

		
		/* Write into Tickets */
		/* Got everything we need stored in globals. 
		*/
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String command_tix_ret = "insert into Tickets (seatNo, seatType, meal, class, deptDateTime, arrivalDateTime, deptAirportID, arrAirportID, cust_username) values " + 
								"( 1, '"+ret_seatType+"', '"+ret_meal+"',  '"+ret_seatclass+"',  '"+ret_deptDateTime+"',  '"+ret_arrivalDateTime+"', " +
								" '"+ret_deptairportID+"',  '"+ret_arrairportID+"', '"+cust_username+"');";
		statement.executeUpdate(command_tix_ret); 
		connection.close();
		
		
		/* Get ticketID. (It will be the largest integer under cust_username)*/
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String query_ticketID_ret = "select max(ticketID) ticketID " + 
						"from Tickets " + 
						"where cust_username='"+ cust_username +"'";
		ResultSet result_ticketID_ret = statement.executeQuery(query_ticketID_ret); 
		
		int ret_ticketID = 0;
		if(result_ticketID_ret.next()){
			ret_ticketID = result_ticketID_ret.getInt("ticketID");
		}else{
			out.println("<br>Failed it add new reservation.  <a href='../HomePages/CustomerHome.jsp'>Try again.</a>");
		}

	
		/*************************************************************************************/
		/* Write into Purchases */
	
		connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		statement = connection.createStatement();
		
		String command_purch_ret = "insert into Purchases (ticketID, username, resNo, flightNumber, airlineID) values  " + 
								"( "+ret_ticketID+", '"+cust_username+"',  "+resNo+",  "+ret_flightNumber+",  '"+ret_airlineID+"');";
		statement.executeUpdate(command_purch_ret); 
		connection.close();
		
	
		out.println("<br>Succssfully purchased new returning ticket for passenger "+temp+"!" + 
				" <br>TicketID : " + ret_ticketID + 
				" for "+ ret_airlineID + ret_flightNumber + "<br>" );
	


		
		statement.close();
		connection.close();
		
		
		temp--;
	}
	
	
	
	/* Calculate length of stay - HL  */
	dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date Dept_TravelDate = dateFormat.parse(dept_travelDate);
	Date Ret_TravelDate = dateFormat.parse(ret_travelDate);
	long Tdate = Dept_TravelDate.getTime();
		long Rdate = Ret_TravelDate.getTime();
		long Seconds = (Rdate - Tdate) / 1000;
		long Minutes = Seconds / 60;
		long Hours = Minutes / 60;
		int LengthDays = (int) Hours / 24;
	
	out.println("<br><br>You are departing on " +dept_travelDate+ " and returning on "+ret_travelDate+ ".");
	out.println("<br>Length of stay: " + LengthDays);
	
	
	out.println("<br><br>You reserved/purchased " + days + " days in advance.");
	out.println("You've earned an Advanced Purchase discount of $" + amountSaved);

	out.println("<br><br>Succssfully added new reservation!" + 
			" <br>Reservation Number : " + resNo + 
			" <br>Customer Rep : " + rep_username + 
			" <br>Total Cost : $"+ totalFare);



%>
		


	<br><br><a href="../HomePages/CustomerHome.jsp">Back to Customer Home</a>
			
</body>
</html>