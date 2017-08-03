<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register for Ticket Reservation System</title>
</head>
<body>
	<%
	
	 	/* Determine user type and forward... */
 		String userType 	= request.getParameter("userType");

		
		/* CUSTOMER  */
		
		if(userType.equals("Customer")){

		%>
		
		<form method="post" action="CustomerRegistration.jsp">
		
		<h2>Basic Customer Information</h2>		
		<p>Please provide following details.</p>
		
		<table>
			<tr>
				<td>Username*</td>
				<td><input type="text" name="newusername" maxlength="25"
					required></td>
			</tr>
			<tr>
				<td>Password*</td>
				<td><input type="password" name="newpassword" maxlength="25"
					required></td>
			</tr>
			<tr>
				<td>First Name*</td>
				<td><input type="text" name="newfirstname" maxlength="45"
					required></td>
			</tr>
			<tr>
				<td>Last Name*</td>
				<td><input type="text" name="newlastname" maxlength="45"
					required></td>
			</tr>




			<tr>
				<td>Phone Number*</td>
				<td><input type="text" name="newphone" maxlength="10"
					required></td>
			</tr>
						
			<tr>
				<td>Resident Street Address*</td>
				<td><input type="text" name="newaddress" maxlength="45"
					required></td>
			</tr>

			<tr>
				<td>Resident City*</td>
				<td><input type="text" name="newcity" maxlength="45"
					required></td>
			</tr>
			
			
			<tr>
				<td>Resident State (two character abbr.)*</td>
				<td><input type="text" name="newstate" maxlength="2"
					required></td>
			</tr>
			
			
			
			<tr>
				<td>Resident ZipCode (5 Digit)*</td>
				<td><input type="text" name="newzipcode" maxlength="5"
					required></td>
			</tr>
			
			<tr>
				<td>Email Address*</td>
				<td><input type="email" name="newemail" maxlength="45"
					required></td>
			</tr>

			<tr>
				<td>Credit Card Number*</td>
				<td><input type="text" name="newcc" maxlength="10"
					required></td>
			</tr>
			
					

			
			
		</table>
		<br> <input type="submit" value="Create Account">
		</form>
					
		<%			
			
		}else if(userType.equals("CustomerRep")){
		
		/* CUSTOMER REPRESENTATIVE */
			

			%>
			
			<form method="post" action="CustomerRepRegistration.jsp">
			
			<h2>Customer Representative Information</h2>
			<p>Please provide following details.</p>
			
			<table>
				<tr>
					<td>Username*</td>
					<td><input type="text" name="newusername" maxlength="25"
						required></td>
				</tr>
				<tr>
					<td>Password*</td>
					<td><input type="password" name="newpassword" maxlength="25"
						required></td>
				</tr>
				<tr>
					<td>First Name*</td>
					<td><input type="text" name="newfirstname" maxlength="45"
						required></td>
				</tr>
				<tr>
					<td>Last Name*</td>
					<td><input type="text" name="newlastname" maxlength="45"
						required></td>
				</tr>




				<tr>
					<td>Phone Number*</td>
					<td><input type="text" name="newphone" maxlength="10"
						required></td>
				</tr>
							
				<tr>
					<td>Resident Street Address*</td>
					<td><input type="text" name="newaddress" maxlength="45"
						required></td>
				</tr>

				<tr>
					<td>Resident City*</td>
					<td><input type="text" name="newcity" maxlength="45"
						required></td>
				</tr>
				
				
				<tr>
					<td>Resident State (two character abbr.)*</td>
					<td><input type="text" name="newstate" maxlength="2"
						required></td>
				</tr>
				
				
				
				<tr>
					<td>Resident ZipCode (5 Digit)*</td>
					<td><input type="text" name="newzipcode" maxlength="5"
						required></td>
				</tr>
				
				<tr>
					<td>Social Security Number*</td>
					<td><input type="text" name="newssn" maxlength="9"
						required></td>
				</tr>

				<tr>
					<td>Hourly Rate*</td>
					<td><input type="number" name="newhourlyRate" maxlength="10"
						required></td>
				</tr>
				
						

				
				
			</table>
			<br> <input type="submit" value="Create Account">
			</form>
						
			<%			
		
		
		
			
			
		}else if(userType.equals("Manager")){
		/* MANAGER */
			%>
			
			<form method="post" action="ManagerRegistration.jsp">
			
			
			<h2>Manager Information</h2>

			<p>Please provide following details.</p>

			<table>
				<tr>
					<td>Username*</td>
					<td><input type="text" name="newusername" maxlength="25"
						required></td>
				</tr>
				<tr>
					<td>Password*</td>
					<td><input type="password" name="newpassword" maxlength="25"
						required></td>
				</tr>
				<tr>
					<td>First Name*</td>
					<td><input type="text" name="newfirstname" maxlength="45"
						required></td>
				</tr>
				<tr>
					<td>Last Name*</td>
					<td><input type="text" name="newlastname" maxlength="45"
						required></td>
				</tr>




				<tr>
					<td>Phone Number*</td>
					<td><input type="text" name="newphone" maxlength="10"
						required></td>
				</tr>
							
				<tr>
					<td>Resident Street Address*</td>
					<td><input type="text" name="newaddress" maxlength="45"
						required></td>
				</tr>

				<tr>
					<td>Resident City*</td>
					<td><input type="text" name="newcity" maxlength="45"
						required></td>
				</tr>
				
				
				<tr>
					<td>Resident State (two character abbr.)*</td>
					<td><input type="text" name="newstate" maxlength="2"
						required></td>
				</tr>
				
				
				
				<tr>
					<td>Resident ZipCode (5 Digit)*</td>
					<td><input type="text" name="newzipcode" maxlength="5"
						required></td>
				</tr>
				
				<tr>
					<td>Social Security Number*</td>
					<td><input type="text" name="newssn" maxlength="9"
						required></td>
				</tr>

				<tr>
					<td>Hourly Rate*</td>
					<td><input type="number" name="newhourlyRate" maxlength="10"
						required></td>
				</tr>
				
						

				
				
			</table>
			<br> <input type="submit" value="Create Account">
			</form>
						
			<%			
		
			
			
		}

 %>
			
	<%
	//	<a href='LogIn.jsp'> Log In Here</a>");
	%>
</body>
</html>