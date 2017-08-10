<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Orders by Customer</title>
</head>
<body>


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Customer Rep Home Page</h2>
<h4 align="right"> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>
<div align="right"><a href='../LogOut.jsp'>Log out</a></div>


<h3>Revenue</h3>

<h4>Revenue for destination city: <%=request.getParameter("city")%></h4>
<%

try{
		String city = request.getParameter("city");
		int totalRev = 0;
		
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		Statement statement = connection.createStatement();
		String command = "select name, city, arrAirportID, group_concat(resNo) r, group_concat(tix) tixs, sum(tF) t, sum(bookingFee) rev  " +
				"from ( " +
						"select resNo, name, city, arrAirportID, group_concat(ticketID) tix, sum(totalFare) tF, bookingFee " +
						"from Purchases " +
						"join Tickets using (ticketID) " +
						"join Reservations using (resNo) " +
						"join Airports a on arrAirportID = a.airportID " +
						"where city='"+city+"' " +
						"group by resNo " +
						") A " +
						"group by arrairportID";
		
		ResultSet result = statement.executeQuery(command);

		//Make an HTML table to show the results in:
		out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("Airport Name");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("City");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("AirportID");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Reservation Numbers");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("TicketIDs");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Total Fares");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Revenue from Fees");
		out.print("</td>");

		
		out.print("</tr>");
		
		String airportID = "";
		String name = "";
		//parse out the results
		while (result.next()) {
			
			name = result.getString("name");
			airportID = result.getString("arrAirportID");

			
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("city"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("arrAirportID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("r"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("tixs"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("t"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("rev"));
			out.print("</td>");

			out.print("</tr>");
			
			totalRev = totalRev + result.getInt("rev");
		}
		out.print("</table>");
		
		out.println("<br><br>Generated $"+totalRev+" from " + name + ", " + airportID + " in " + city );
		result.close();

		statement.close();
		connection.close();
} catch (Exception e){
	
}

%>
<br><br>
<a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a>


</body>
</html>