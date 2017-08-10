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
		
		Statement statement = connection.createStatement();
		String command = "SELECT * FROM Users WHERE username='"+username+"'";
		ResultSet result = statement.executeQuery(command);
		
		
		
		if (result.next()) {
			String password = result.getString("password");
			String firstName = result.getString("firstName");
			String lastName = result.getString("lastName");
			String address = result.getString("address");
			String city = result.getString("city");
			String state = result.getString("state");
			String zipCode = result.getString("zipCode");
			String phone = result.getString("phone");
			String CCNumber = result.getString("CCNumber");
			String email = result.getString("email");
		%>
			<form method="post" action="EditCustomerHandler.jsp">			
			
			<table>
				<tr>
					<td>Username</td>
					<td><input type="text" name="Username" value=<%=username%> maxlength="25"
					required></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="Password" maxlength="25"
					required></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><input type="text" name="FirstName" value=<%=firstName%> maxlength="45"
					required></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="LastName" value=<%=lastName%> maxlength="45"
					required></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><input type="text" name="Address" value=<%=address%> maxlength="45"
					required></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="City" value=<%=city%> maxlength="45"
					required></td>
				</tr>
				<tr>
					<td>State</td>
					<td><input type="text" name="State" value=<%=state%> maxlength="2"
					required></td>
				</tr>
				<tr>
					<td>zipCode</td>
					<td><input type="text" name="ZipCode" value=<%=zipCode%> maxlength="5"
					required></td>
				</tr>
				<tr>
					<td>Phone</td>
					<td><input type="text" name="Phone" value=<%=phone%> maxlength="10"
					required></td>
				</tr>
				<tr>
					<td>Credit Card #</td>
					<td><input type="number" name="CCNumber" value=<%=CCNumber%> maxlength="10"
					required></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="Email" value=<%=email%> maxlength="45"
					required></td>
				</tr>
					
						
				</tr>
			</table>
				<br> <input type="submit" value="Edit">
			</form>
			<br><br><br>
		<%
			
		} else {
			out.println("Username doesn't exist.");
		}
		
		result.close();
		statement.close();
		connection.close();
	%>
	<br><a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a>
			
</body>
</html>