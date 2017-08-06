<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Home</title>
</head>
<body>


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Manager Home Page</h2>
<h4 align="right"> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>
<div align="right"><a href='../LogOut.jsp'>Log out</a></div>


<h3>Employee Management</h3>

<h4>List of all employees (including hourly rates)</h4>
<%

try{
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/TicketReservationSystem";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		Statement statement = connection.createStatement();
		String command = "SELECT * FROM Users WHERE userType='CustomerRep' or userType='Manager'";
		ResultSet result = statement.executeQuery(command);

		
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
		out.print("User Type");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("SSN");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Hourly Rate");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Start Date");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Phone Number");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Address");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("City");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("State");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("ZipCode");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
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
			out.print(result.getString("userType"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ssn"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("hourlyRate"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("startDate"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("phone"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("address"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("city"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("state"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ZipCode"));
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
<a href="../HomePages/ManagerHome.jsp">Back to Manager Home</a>


</body>
</html>