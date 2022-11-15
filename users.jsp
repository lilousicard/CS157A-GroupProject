<%@ page import="java.sql.*"%>
<html>
  <body>
    <%
    int accountID = (Integer)session.getAttribute("accountID");
    //out.println(accountID);
    int userID = (Integer)session.getAttribute("userID");
    //out.println(userID);
    String user = "appdb";
    String password = "password";
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);


        StringBuilder builder = new StringBuilder();
        builder.append("SELECT * FROM `CS157A_Proj`.favorite NATURAL JOIN movie WHERE user_id =  ");
        builder.append(userID);
        builder.append(";");

        String query = builder.toString();

        ResultSet rs = stmt.executeQuery(query);

        while(rs.next()){
        	out.println(rs.getString(3)+ "<br/><br/>");
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
