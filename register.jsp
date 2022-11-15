<!DOCTYPE HTML>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
	<head>
		<title>Flick It Up!</title>
		<link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png"
		<link rel=“stylesheet” type=“text/css” href=“/css/register.css”>
	</head>

	<body>
		<nav>
			<ul>
				<li><a class="active" href="login.jsp">Login</a><li>
				<li><a href="register.jsp">Sign Up</a><li>
			</ul>
		</nav>
		<div id = “signup”>
			<h1> Want to register early?</h1>
      <form>
			<table>
				<thead>
					<th>Username</th>
					<th>Password</th>
					<th>Email</th>
				</thead>
				<tbody>
					<tr>
						<td id=“Username” name="Username"><input type=“text”/></td>
						<td id=“Password” name="Password"><input type=“password”/></td>
						<td id=“Email” name="Email"><input type=“email”/></td>
					</tr>
				</tbody>
			</table>
	      
	      		<form method="post" action="register.jsp">
				<input type="submit" value="Sign Up">
	      		</form>
		</div>
<%
if("POST".equalsIgnoreCase(request.getMethod())
{
  	String Username = request.getParameter("Username");
  	String Password = request.getParameter("Password");
  	String Email = request.getParameter("Email");
  	String connectionURL = "jdbc:mysql://localhost:3306/CS157A-Team3";
  	Connection connection = null;
  	PreparedStatement pstatement = null;
  	int updateQuery = 0;

  	if (Username==null || Password==null || Email==null||Username=="" || Password=="" || Email=="")
  	{%>
    		<br>
		<h3>Entries are incorrect, try again</h3>

  	<%
	}

	else if(Username!=null && Password!=null && Email!=null)
	{
  		if(Username!="" && Password!="" && Email!="")
 		{
    			try 
			{
      				Class.forName("com.mysql.jdbc.Driver");
      				connection = DriverManager.getConnection(connectionURL,"appdb","password");
      				String queryString = "INSERT INTO Users (Username, Password,Email) VALUES (?,?,?)";
      				pstatement = connection.prepareStatement(queryString);
      				pstatement.setString(1, Username);
      				pstatement.setString(2, Password);
      				pstatement.setString(3, Email);
      				updateQuery = pstatement.executeUpdate();
				
     				if (updateQuery != 0) 
      				{%>
        			<br>
					<h3>Data is inserted successfully in database.</h3>

     				 <%
      				}
    			}
    		catch (Exception ex)
    		{
      			out.println("Unable to connect to database.");
    		}finally 
		{
     			 // close all the connections.
      			pstatement.close();
      			connection.close();
    		}
  		}
	}
}
%>
</FORM>
</body>
</html>
