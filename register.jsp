<!DOCTYPE HTML>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
	<head>
		<title>Flick It Up!</title>
		<link rel=“stylesheet” type=“text/css” href=“/css/register.css”>
	</head>

	<body>
		<nav>
			<ul>
				<li><a class="active" href="home.jsp">Login</a><li>
				<li><a href="register.jsp">Sign Up</a><li>
			</ul>
		</nav>
		<div id = “login”>
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
						<td id=“Username”><input type=“text”/></td>
						<td id=“Password”><input type=“password”/></td>
						<td id=“Email”><input type=“email”/></td>
					</tr>
				</tbody>
			</table>
		</div>
<%
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
    <TABLE>
      <tr><th>Wrong Entries</th></tr>
    </table>

  <%
}

else if(Username!=null && Password!=null && Email!=null)
{
  if(Username!="" && Password!="" && Email!="")
  {
    try {
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
        <table>
          <tr><th>Data is inserted successfully in database.</th></tr>
        </table>

      <%
      }
    }
    catch (Exception ex){
      out.println("Unable to connect to database.");
    }finally {
      // close all the connections.
      pstatement.close();
      connection.close();
    }
  }
}
%>
</FORM>
</body>
</html>
