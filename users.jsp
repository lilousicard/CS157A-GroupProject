<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Flick It Up!</title>
    <link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">
    <link href="css/hover.css" rel="stylesheet" media="all">
    <link rel="stylesheet" type="text/css" href="/project/css/users.css">
  </head>
  <body>
    <div class="topnav">
 	 <a  href="home.jsp">Home</a>
      <a href="movies.jsp">Movies</a>
  	<a href="favorite.jsp">Favorites</a>
  	<a class="active" href="accountPage.jsp">Account</a>
    <div class="searchbar">
      <form action="search.jsp">
        <input type="text" placeholder="Search Title, People, Genres..." name="search">
        <button><i class="fa fa-search"></i></button>
      </form>
    </div>
</div>

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
