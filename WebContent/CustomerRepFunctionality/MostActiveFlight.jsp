<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Most Active Flights</title>
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
<div align='right'><a href="../HomePages/CustomerRepHome.jsp">Back to CustomerRep Home</a></div> <br>

<h4>Most Active Flight(s) </h4>

<%

try{
		String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		
		Statement statement = connection.createStatement();
		
		String command = "select flightNumber, airlineID, count(*) totalTix " +
				"from Purchases " +
				"group by flightNumber, airlineID " +
				"having totalTix= " +
				"(select max(totalTix) from " +
				"(select flightNumber, airlineID, count(*) totalTix " +
				"from Purchases " +
				"group by flightNUmber, airlineID) A)";
		ResultSet result = statement.executeQuery(command); 

		
		
		//parse out the results
		while (result.next()) {
			
			String flightNumber = result.getString("flightNumber");
			String airlineID = result.getString("airlineID");
			String totalTix = result.getString("totalTix");
					
			out.println("The flight with the most reserved tickets is:<br>" + airlineID + " " + flightNumber + " with "+totalTix + " reserved seats.<br><br>");

		}
		
		result.close();
		statement.close();
		connection.close();
		
} catch (Exception e){
	
}

%>

<br><br><br>
<a href="../HomePages/CustomerRepHome.jsp">Back to CustomerRep Home</a>


</body>
</html>

