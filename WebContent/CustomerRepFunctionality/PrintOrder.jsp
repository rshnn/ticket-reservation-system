<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receipt</title>
</head>
<body>


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Customer Rep Home Page</h2>
<h4 align="right"> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>
<div align="right"><a href='../LogOut.jsp'>Log out</a></div>


<h3>Customer Management</h3>

<h4>Order Receipt</h4>
<%

try{
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		String resNo = request.getParameter("resNo");
		Statement statement = connection.createStatement();
		String command = "select distinct r.resNo,r.dateReserved,p.flightNumber,r.bookingFee, r.totalFare,r.passengers From Users u JOIN Reservations r ON r.cust_username=u.username Join Purchases p ON r.resNo = p.resNo Where r.resNo='"+resNo+"'";
		ResultSet result = statement.executeQuery(command);

		//Make an HTML table to show the results in:
		out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("Order Number");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Booking Date");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Flight Number");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Booking Fee");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Ticket Price");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("# of Passengers");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(result.getString("resNo"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("dateReserved"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("flightNumber"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("bookingFee"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("totalFare"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("passengers"));
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