<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>Flick It Up!</title>
		<link rel=“stylesheet” type=“text/css” href=“/css/register.css”>
	</head>
  <body>
  <%
   int accountID = (Integer)session.getAttribute("accountID");
   out.println(accountID);

   StringBuilder builder = new StringBuilder();

   builder.append("SELECT * FROM `CS157A-Team3`.account WHERE account_id = ");
   builder.append(accountID);
   builder.append(";");
   String query = builder.toString();
   String user = "appdb";
   String password = "password";
   try {
       java.sql.Connection con;
       Class.forName("com.mysql.jdbc.Driver");
       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A-Team3?autoReconnect=true&useSSL=false",user, password);
       Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
       ResultSet rs = stmt.executeQuery(query);
       rs.next();
       out.print(rs.getString(4));
     }catch(SQLException e) {
         out.println("SQLException caught: " + e.getMessage());
     }
  %>
  </body>
</html>
