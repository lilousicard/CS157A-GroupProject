<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>

  <title>Flick It Up!</title>

</head>

<div class="topnav">
  <a href="home.jsp">Home</a>
  <a class="active" href="favorite.jsp">Favorites</a>
  <a href="http://localhost:8080/project/accountPage.jsp">Account</a>
</div>
<br>

  <%
  if (session.getAttribute("accountID")==null || session.getAttribute("userID")==null){%>
  <h2>Please check if you are a valid user and try again later!</h2>

  <% }else{
    int accountID = (Integer)session.getAttribute("accountID");
    int userID = (Integer)session.getAttribute("userID");
    String user = "appdb";
    String password = "password";
    try{
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);


    String query = ("SELECT * FROM CS157A_Proj.user Where user_id = "+userID+";");
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
    String name = rs.getString(2);
    %><h1><%= name%><b>'s Favorite Movies</b></h1><%
    

    query = ("SELECT * FROM CS157A_Proj.movie Where movie_id in (Select movie_id From CS157A_Proj.favorite WHERE user_id = "+userID+");");
    rs = stmt.executeQuery(query);
    while(rs.next()){
	  String imagePath = "http://localhost:8080/project/image/"+rs.getString(9);
	  %><img src= <%=imagePath%> alt="poster" style="width:200px;height:300px;"><br><%
        out.println(rs.getString(2)+ "<br/><br/>");
    }


    rs.close();
    stmt.close();
    con.close();
  }catch(SQLException e) {
      out.println("SQLException caught: " + e.getMessage());
  }

  }

  %>
</body>
