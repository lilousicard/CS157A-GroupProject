<%@ page import="java.sql.*"%>

<html>
  <body>
    <li><a href="http://localhost:8080/project/home.jsp">Go To Home Page</a></li>
    <%
    if (session.getAttribute("isAdmin")== null){
      %>
        <h1>ERROR, This form should not be access under such conditions</h1>
      <%
    } else {

    String user = "appdb";
    String password = "password";
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String query = "SELECT * FROM `CS157A_Proj`.review ORDER BY movie_id, user_id;";
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()){
          out.println("User ID = "+rs.getInt(1)+" MovieID = "+rs.getInt(2) + " review = "+rs.getString(4));
          %>
            <br><br>
          <%
        }

        %>
        <form>
          <table>
            <thead>
              <th>User ID</th>
              <th>Movie ID</th>
            </thead>
            <tbody>
    					<tr>
                <td><input type="text" id="userId" name="userId"></td>
                <td><input type="text" id="movieId" name="movieId"> </td>
              </tr>
            </tbody>
          </table>
          <input type="submit" value="Delete review" name = "delete">
        </form>

    <%
          String delete = request.getParameter("delete");
          if (delete!=null && request.getParameter("userId")!=null && request.getParameter("movieId")!=null){
            PreparedStatement pstatement = null;
            int userID = Integer.parseInt(request.getParameter("userId"));
            int movieID = Integer.parseInt(request.getParameter("movieId"));

            query = "DELETE FROM review WHERE user_id = "+userID+" AND movie_id = "+movieID;
            pstatement = con.prepareStatement(query);
            int updateQuery = pstatement.executeUpdate();
            response.sendRedirect("adminReview.jsp");

          }



      }catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
      }
%>
</body>
</html>
