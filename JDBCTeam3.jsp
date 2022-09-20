<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Team 3</title>
    </head>
  <body>
    <h1>Initial Table Team 3</h1>
    
    <table border="1">
      <tr>
        <td>Title</td>
        <td>Year</td>
        <td>Length</td>
   </tr>
    <% 
        String db = "CS157A-Team3";
        String user;
        user = "appdb";
        String password = "password";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false", user, password);
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A-Team3", user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"MovieList\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM MovieList");
            while (rs.next()) {
                out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
