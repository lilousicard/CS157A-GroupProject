<%@ page import="java.sql.*"%>

<html>
  <body>

    <%

      if (session.getAttribute("movieID")==null || session.getAttribute("isAdmin")== null){
        %>
          <h1>ERROR, This form should not be access under such conditions</h1>
        <%
      } else {

        int movieID = (Integer) session.getAttribute("movieID");

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
            String language = rs.getString(8);
            String imagePath = rs.getString(9);
            int rating = rs.getInt(7);

            %>

            <form>
            <textarea rows = "3" cols = "15" name = "title">
            <%= title%>
            </textarea><br>

            <input type="text" id="genre" name="genre" value=<%= genre%> <br><br>
            <input type="text" id="year" name="year" value=<%= year%> <br></br>
            <textarea rows = "5" cols = "30" name = "description">
            <%= description%>
            </textarea><br>
            <input type="text" id="duration" name="duration" value=<%= duration%> <br><br>
            <input type="text" id="language" name="language" value=<%= language%> <br><br>
            <input type="text" id="imagePath" name="imagePath" value=<%= imagePath%> <br><br>

            <input type="submit" value="Submit" name = "submit">
            <input type="submit" value="Cancel" name = "cancel">
            <input type="submit" value="Delete Movie" name = "delete">

            </form>

            <%
            String update = request.getParameter("submit");
            String cancel = request.getParameter("cancel");
            String delete = request.getParameter("delete");
            PreparedStatement pstatement = null;

            if(cancel != null){
              response.sendRedirect("movies.jsp");
            } else if (update != null){

              if(request.getParameter("title")!=null && request.getParameter("genre")!=null && request.getParameter("year")!=null && request.getParameter("description")!=null && request.getParameter("duration")!=null && request.getParameter("language")!=null&& request.getParameter("imagePath")!=null){

                String queryString = "DELETE FROM movie WHERE movie_id = "+movieID;
                pstatement = con.prepareStatement(queryString);
                int updateQuery = pstatement.executeUpdate();


                title = request.getParameter("title");
                genre = request.getParameter("genre");
                year = Integer.parseInt(request.getParameter("year"));
                description = request.getParameter("description");
                duration = Integer.parseInt(request.getParameter("duration"));
                language = request.getParameter("language");
                imagePath = request.getParameter("imagePath");


                queryString = "INSERT INTO movie VALUE (?,?,?,?,?,?,?,?,?)";
                pstatement = con.prepareStatement(queryString);
        				pstatement.setInt(1, movieID);
        				pstatement.setString(2, title);
        				pstatement.setString(3, genre);
                pstatement.setInt(4, year);
                pstatement.setString(5, description);
                pstatement.setInt(6, duration);
                pstatement.setInt(7, rating);
                pstatement.setString(8, language);
                pstatement.setString(9, imagePath);
                updateQuery = pstatement.executeUpdate();
                response.sendRedirect("movies.jsp");
              } else {
                out.println("Error on the form");
              }
            } else if (delete != null){
              String queryString = "DELETE FROM movie WHERE movie_id = "+movieID;
              pstatement = con.prepareStatement(queryString);
              int updateQuery = pstatement.executeUpdate();

              queryString = "DELETE FROM review WHERE movie_id = "+movieID;
              pstatement = con.prepareStatement(queryString);
              updateQuery = pstatement.executeUpdate();

              queryString = "DELETE FROM favorite WHERE movie_id = "+movieID;
              pstatement = con.prepareStatement(queryString);
              updateQuery = pstatement.executeUpdate();

              queryString = "DELETE FROM directed WHERE movie_id = "+movieID;
              pstatement = con.prepareStatement(queryString);
              updateQuery = pstatement.executeUpdate();

              queryString = "DELETE FROM `star-in` WHERE movie_id = "+movieID;
              pstatement = con.prepareStatement(queryString);
              updateQuery = pstatement.executeUpdate();
              
              response.sendRedirect("home.jsp");
            }

          } catch(SQLException e) {
              out.println("SQLException caught: " + e.getMessage());
          }

      }
%>

  </body>
</html>
