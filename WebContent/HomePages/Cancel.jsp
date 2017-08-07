<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Canceling the Flight</title>
</head>
<body>

<h3>Canceling Reservation by Reservation Number.</h3>
	<%
	
	try{
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/TicketReservationSystem";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");


		int newResNo = Integer.parseInt(request.getParameter("ResNo"));
		
		Statement statement = connection.createStatement();
		String command = "SELECT * FROM Reservations join Purchases using(resNo) WHERE resNo = " + newResNo;
		ResultSet result = statement.executeQuery(command);
		
		if(!result.next()){
			out.println("Invalid Reservation Number. <a href='Cancellation.jsp'>Please try again</a>");
			result.close();
			statement.close();
			connection.close();
		}else{
			
			/* Move cursor back to the first item */
			result.beforeFirst();
						
			while (result.next()) {
				int ticket = result.getInt("ticketID");
				int resNo = result.getInt("resNo");
				
				String DeleteTickets = "DELETE FROM Tickets WHERE ticketID =" + ticket;
				String DeleteReservations = "DELETE FROM Reservations WHERE resNo =" + resNo;
	
				PreparedStatement delete1 = connection.prepareStatement(DeleteReservations);
				PreparedStatement delete2 = connection.prepareStatement(DeleteTickets);
	
				delete1.executeUpdate();
				delete2.executeUpdate();
	
				out.println("Ticket ID# " + ticket + " canceled. <br>");
				out.println();
				
			} 
			out.println("Reservation "+ newResNo + " cancelled. <br> <a href='Reservation.jsp'>Reserve a new flight.</a>");
			result.close();
			statement.close();
			connection.close();
		}
		
	}
	catch(Exception e){
		}
	%>
	
</body>
</html>