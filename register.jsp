<!DOCTYPE HTML>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<head>
		<title>Flick It Up!</title>
		<link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">
		<link href="css/hover.css" rel="stylesheet" media="all">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: transparent;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
<%@include file="css/home.css"%>
</style>



</head>
<body style="background-color:#b14e59;">

<div class="topnav">
  <a  href="home.jsp">Home</a>
  <a href="favorite.jsp">Favorites</a>
  <a class="active" href="accountPage.jsp">Account</a>
</div>
<br>
			<h1> Want to register</h1>
      <form>
			<table>
				<thead>
					<th>Username</th>
					<th>Password</th>
					<th>Email</th>
				</thead>
				<tbody>
					<tr>
						<td><input type = "text" name = "Username"></td>
						<td><input type = "password" name = "Password"></td>
						<td><input type = "text" name = "Email"></td>
					</tr>
				</tbody>
			</table>

	      		<form method="post" action="billing.jsp">
				<input type="submit" value="Sign Up" name="signUp">
	      		</form>
		</div>
<%
String sign = request.getParameter("signUp");

if(sign != null && sign.equals("Sign Up")){
  	String Username = request.getParameter("Username");
  	String Password = request.getParameter("Password");
  	String Email = request.getParameter("Email");
  	String connectionURL = "jdbc:mysql://localhost:3306/CS157A_Proj";
  	Connection connection = null;
  	PreparedStatement pstatement = null;
  	int updateQuery = 0;

  	if (Username==null || Password==null || Email==null||Username=="" || Password=="" || Email=="")	{
			%>
    		<br>
				<h3>Entries are incorrect, try again</h3>
  	<%
	   }else {
    			try{
      				Class.forName("com.mysql.jdbc.Driver");
      				connection = DriverManager.getConnection(connectionURL,"appdb","password");
      				String queryString = "INSERT INTO account (Username, Password,Email) VALUES (?,?,?)";
      				pstatement = connection.prepareStatement(queryString);
      				pstatement.setString(1, Username);
      				pstatement.setString(2, Password);
      				pstatement.setString(3, Email);
      				updateQuery = pstatement.executeUpdate();
     				if (updateQuery != 0){
     					String query = "SELECT * FROM `CS157A_Proj`.account WHERE username = \'"+ Username +"\';";
                		Statement stmt = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                		ResultSet rs = stmt.executeQuery(query);
                		rs.next();
     					session.setAttribute("accountID",rs.getInt(1));
                        response.sendRedirect("CardForm.jsp");
					    %>
		        		<br>
					    <h3>Data is inserted successfully in database.</h3>
     				    <%
      			    }
    			}
    			catch (Exception ex){
      			    out.println("SQLException caught: " + ex.getMessage());
    			}
    			pstatement.close();
      		    connection.close();
			}

      		
  	}
%>
</FORM>
</body>
</html>
