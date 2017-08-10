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
	<br>
<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Manager Home Page</h2>
<h4 align="right"> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</h4>
<div align="right"><a href='../LogOut.jsp'>Log out</a></div>


<h3>Sales and Revenue</h3>

<h4>Search for desired month's Sales Report</h4>

	<form method="post" action="ViewSalesReport.jsp">			
		
		<table>
			<tr>
				<td>Month (format MM)</td>
				<td><input type="date" name="month" maxlength="2" required></td>
			</tr>
			<tr>
				<td>Year (format YYYY)</td>
				<td><input type="date" name="year" maxlength="4"
					required></td>
			</tr>
		</table>
		
		
		
		<br> <input type="submit" value="Search">
	</form>
	<br><br><br>
	<a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a>

</body>
</html>