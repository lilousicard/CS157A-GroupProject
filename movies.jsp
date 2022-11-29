<%@ page import="java.sql.*"%>
<%@ page import="java.string.*"%>
<html>
<head>

<style>

</style>

<style><%@include file="css/home.css"%></style>


  <title>Flick It Up!</title>

</head>
  <body>
    <a href="home.jsp">Home</a>
    <%

      if (session.getAttribute("movieID")==null){
        %>
          <h1>ERROR, No movie was selected</h1>
        <%
      }else{

        if((session.getAttribute("isAdmin")).equals("admin")){
          %>
            <form method="post">
              <input type="submit" value="Edit page" name = "edit">
            </form>
          <%
          String input = request.getParameter("edit");
          if (input != null){
            response.sendRedirect("updateMovie.jsp");
          }

        }


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
            <img src= <%=imagePath%> alt="poster" style="width:400px;height:600px;"><br>
            <h4><b>Genre: </b><%= genre%></h4>
            <h4><b>Rating: </b><%=rating%></h4>
            <h4><b>Duration: </b><%=duration%></h4>
            <h4><b>Language: </b><%=language%></h4> <br>
		<h3><b>Description</b></h3>
            <%=description%><br>
		<br>
            <%


            query = "SELECT * FROM CS157A_Proj.review WHERE movie_id = "+movieID+";";
            rs = stmt.executeQuery(query);
            %><h3><b>Review</b></h3><%
            while(rs.next()){
              out.println("User ID = "+rs.getInt(1)+", rating = "+ rs.getInt(3)+ ", comment = "+rs.getString(4));
            %><br> <%
            }

            %><br><%
            query = "SELECT * FROM CS157A_Proj.awards WHERE movie_id = "+movieID+";";
            rs = stmt.executeQuery(query);
            %><h3><b>Awards</b></h3><%
		while(rs.next()){
              out.println(rs.getString(2)+" "+rs.getInt(4)+" by "+ rs.getString(3));
              %> <br><%
            }

            %><br><%
            query = "SELECT * FROM CS157A_Proj.directors Where director_id in (Select director_id From CS157A_Proj.directed WHERE movie_id = "+movieID+");";
            rs = stmt.executeQuery(query);
            %><h3><b>Directors</b></h3><%
            while(rs.next()){
              out.println(rs.getString(2));
              %><br><%
            }

            %><br><%
            query = "SELECT * FROM CS157A_Proj.actors Where actor_id in (Select actor_id From CS157A_Proj.`star-in` WHERE movie_id = "+movieID+");";
            rs = stmt.executeQuery(query);
            %><h3><b>Casts</b></h3><%
            while(rs.next()){
              out.println(rs.getString(2));
              %><br><%
            }



          }catch(SQLException e) {
              out.println("SQLException caught: " + e.getMessage());
          }
        }
    %>
    <br><br><br><br>
    <h2><a href="http://localhost:8080/project/home.jsp">Back To Home Page</a><h2><br>
  </body>
</html>
