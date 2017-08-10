<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Rep Home</title>
</head>
<body>


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Customer Rep Home Page</h2>

<div align="right"> <b> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</b> <br>
<a href='../LogOut.jsp'>Log out</a>
</div>

<h3>Flight Information</h3>
<div align='right'><a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a></div> <br>



<%

/* try{ */

		String flight = request.getParameter("flight");

		
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		Statement statement = connection.createStatement();
		
		/* Big ass query.  Joins tables and merges days_occurs into one column */
		String command = "select username, concat(airlineID, flightNumber) flight, firstName, lastName,  " +
				"resNo, ticketID, totalFare, dateReserved, CCNumber, email, phone " +
				"from Purchases join Users using (username) join Reservations using (resNo) " +
				"where concat(airlineID, flightNumber)='UA2221' " +
				"group by username ";
		ResultSet result = statement.executeQuery(command);

		
		
		if(!result.next()){
			out.println("Invalid flight given.  Be sure to use the syntax: UA2221. <a href='../HomePages/ManagerHome.jsp'>Please try again</a>");
			result.close();
			statement.close();
			connection.close();
		}else{
			
			%>
			<h4>List of customers on 
				<%=result.getString("flight")%>
			</h4>
			
			<%
			result.beforeFirst();
			
		
			
			
			//Make an HTML table to show the results in:
			out.print("<table border='1'>");
	
			//make a row
			out.print("<tr>");
			
			//make a column
			out.print("<td>");
			out.print("First Name");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Last Name");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("username");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Reservation Number");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("TicketID");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Total Fare");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Reservation Date");
			out.print("</td>");
	
			//make a column
			out.print("<td>");
			out.print("CCNumber");
			out.print("</td>");
			
	
			//make a column
			out.print("<td>");
			out.print("email");
			out.print("</td>");
			
			
			//make a column
			out.print("<td>");
			out.print("phone");
			out.print("</td>");
			
			out.print("</tr>");
			
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				
				out.print("<td>");
				out.print(result.getString("firstName"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("lastName"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("resNo"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("ticketID"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("totalFare"));
				out.print("</td>");
				out.print("<td>");			
				out.print(result.getString("dateReserved"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("CCNumber"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("email"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("phone"));
				out.print("</td>");			
				
				out.print("</tr>");
			}
			out.print("</table>");
			
			result.close();
			statement.close();
			connection.close();
		}
/* } catch (Exception e){
	
} */

%>

<br><br><br>
<a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a>


</body>
</html>

