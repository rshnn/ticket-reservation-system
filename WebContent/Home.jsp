<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Ticket Reservation System</title>
</head>
<body>
	<!-- Login Fail case  -->
	<%
		/* Failed to log in.  Username returned was null or blank. */
		if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
	%>
	You are not logged in.
	<br>
	<a href="LogIn.jsp">Please Login Here</a>
	<%
		}
		else {
	%>
	
	<!-- Login Success case -->
	<h1 align="center">Welcome to Ticket Reservation System!</h1>
	<h4>
		You are currently logged in as
		<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</h4>
	<%
		
		Object role = session.getAttribute("userType");
	
		if(role.equals("Customer")){
			%> <a>Continue to Customer home page</a> <%
		
		}else if(role.equals("CustomerRep")){
			%> <a>Continue to Customer Representative home page</a> <%
			
		}else if(role.equals("Manager")){
			%> <a href='HomePages/ManagerHome.jsp'>Continue to Manager home page</a> <%
		}
	
	
	
		}
	%>
	<br><br>
	<a href='LogOut.jsp'>Log out</a>
</body>
</html>