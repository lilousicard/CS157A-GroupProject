<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<body>

  <h3> Favorite Movies</h3>


  <%if (session.getAttribute("accountID")==null || session.getAttribute("userID")==null){%>
  <h1>Error, Please try again Later</h1>

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



    String query = ("SELECT * FROM CS157A_Proj.movie Where movie_id in (Select movie_id From CS157A_Proj.favorite WHERE user_id = "+userID+");");
    ResultSet rs = stmt.executeQuery(query);
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




<a href="http://localhost:8080/project/home.jsp">Back to Home Page</a><br>

</body>
