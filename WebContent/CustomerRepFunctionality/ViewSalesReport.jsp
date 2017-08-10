<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report</title>
</head>
<body>


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Customer Rep Home Page</h2>
<h4 align="right"> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>
<div align="right"><a href='../LogOut.jsp'>Log out</a></div>


<h3>Sales and Revenue</h3>

<h4>Sales Report for <%=request.getParameter("month") %>/<%=request.getParameter("year") %></h4>
<%

try{
		String month = request.getParameter("month");
		String year = request.getParameter("year");
	
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		Statement statement = connection.createStatement();
		String command = "SELECT dateReserved, passengers, totalFare, bookingFee, type	FROM Reservations WHERE MONTH(dateReserved) = "+month+"	AND YEAR(dateReserved) = "+year+"";
		ResultSet result = statement.executeQuery(command);

		
		//Make an HTML table to show the results in:
		out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("Date Reserved");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("# of Passengers");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Booking Fee");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Fare paid by Passenger");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Ticket Type");
		out.print("</td>");
				
		out.print("</tr>");
		
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td align=center>");
			out.print(result.getString("dateReserved"));
			out.print("</td>");
			out.print("<td align=center>");
			out.print(result.getString("passengers"));
			out.print("</td>");
			out.print("<td align=center>");
			out.print(result.getString("totalFare"));
			out.print("</td>");
			out.print("<td align=center>");
			out.print(result.getString("bookingFee"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("type"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		
		result.close();
		statement.close();
		connection.close();
} catch (Exception e){
	
}

%>

<br><br><br>
<a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a>


</body>
</html>