<%@ page import="java.sql.*"%>
<%@ page import="java.string.*"%>
<html>
  <body>
    <%
      //session.setAttribute("movieID",3);
      if (session.getAttribute("movieID")==null){
        %>
          <h1>ERROR, No movie was selected</h1>
        <%
      }else{
        int movieID = (Integer)session.getAttribute("movieID");
        String user = "appdb";
        String password = "password";
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "SELECT * FROM `CS157A_Proj`.movie WHERE movie_id = "+movieID+";";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            String title = rs.getString(2);
            String genre = rs.getString(3);
            int year = rs.getInt(4);
            String description = rs.getString(5);
            int duration = rs.getInt(6);
            double rating = rs.getInt(7);
            String language = rs.getString(8);
            String imagePath = "http://localhost:8080/project/image/"+rs.getString(9);
            %>
            <h1><%= title %></h1>
            <h2><%= year%></h2>
            <img src= <%=imagePath%> alt="poster"><br>
            <h2><%= genre%></h2><br>
            <h3><%=rating%><h3><br>
            <h3><%=duration%><h3><br>
            <h3><%=language%><h3><br>
            <%=description%><br>

            <%


            query = "SELECT * FROM CS157A_Proj.review WHERE movie_id = "+movieID+";";
            rs = stmt.executeQuery(query);
            while(rs.next()){
              out.println("User ID = "+rs.getInt(1)+" rating = "+ rs.getInt(3)+ " comment = "+rs.getString(4));
              %>
              <br>
              <%
            }

          }catch(SQLException e) {
              out.println("SQLException caught: " + e.getMessage());
          }
        }
    %>
    <br>
    <a href="http://localhost:8080/project/home.jsp">Go To Home Page</a><br>
  </body>
</html>
