<%@ page import="java.sql.*"%>


<html>
  <head>
    <title>Flick It Up!</title>
    <link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">
    <link href="css/hover.css" rel="stylesheet" media="all">
    <link rel="stylesheet" type="text/css" href="/project/css/search.css">
  </head>
  <body>
    <div class="topnav">
 	 <a  href="home.jsp">Home</a>
      <a href="movies.jsp">Movies</a>
  	<a href="favorite.jsp">Favorites</a>
    <a class="active" href="search.jsp">Search</a>
  	<a href="accountPage.jsp">Account</a>
    </div>

 <br>

 <form method="post" action="search.jsp" name="search">
  <input type="text" placeholder="Search Title" name="content">
  <input type="submit" value="Search" name="search">
 </form>

 <%
  String sign = request.getParameter("search");
  String user = "appdb";
  String password = "password";
  PreparedStatement pstatement = null;
  int updateQuery = 0;

  if(sign != null && session.getAttribute("userID") != null)
  {
      try
      {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

        String searching = request.getParameter("content");

        String query = "SELECT * FROM `movies`.movie WHERE title = "+searching+";";
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next())
        {
          String imagePath = "http://localhost:8080/project/image/"+rs.getString(9);
          %>
          <img src= <%=imagePath%> alt="poster" style="width:200px;height:300px;"><br>
          <%
            out.println(rs.getString(2)+ "<br/><br/>");
        }
      } catch(SQLException e) {
          out.println(e);
    }
  }
 %>

    
    <footer class="bottomnav">
		  <a href="http://localhost:8080/project/billing.jsp">Billing Info</a>
		  <a href="http://localhost:8080/project/addUser.jsp">AddUser</a>
      <a href="deleteForm.jsp">Delete Account</a>
	</footer>
    
  </body>
</html>
