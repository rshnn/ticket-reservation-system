<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Customer</title>
</head>
<body>

	<h1 align="center">Customer Management</h1>
	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
	</b> <br>
	<a href='../LogOut.jsp'>Log out</a>
	</div>
	
	<% 
	String url = "jdbc:mysql://mydbinstance.cvlvoepmucx7.us-east-2.rds.amazonaws.com:3306/trs";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, "rshn", "youknownothingJonSnow");
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		String firstName = request.getParameter("FirstName");
		String lastName = request.getParameter("LastName");
		String address = request.getParameter("Address");
		String city = request.getParameter("City");
		String state = request.getParameter("State");
		String zipCode = request.getParameter("ZipCode");
		String phone = request.getParameter("Phone");
		String CCNumber = request.getParameter("CCNumber");
		String email = request.getParameter("Email");
		
		Statement statement = connection.createStatement();
		String command = "UPDATE Users SET username = '"+username+"', password = '"+password+"', firstName = '"+firstName+"', lastName = '"+lastName+"', address = '"+address+"',city = '"+city+"',state = '"+state+"',zipCode = '"+zipCode+"',phone = '"+phone+"',CCNumber = '"+CCNumber+"',email = '"+email+"' Where username='"+username+"'";
		statement.executeUpdate(command);
		out.print("User has been edited");
		statement.close();
		connection.close();
	%>
	<br><a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a>
			
</body>
</html>