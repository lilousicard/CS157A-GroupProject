<%@ page import="java.sql.*"%>
<%@ page import="java.string.*"%>
<html>
  <body>
    <a href="http://localhost:8080/project/home.jsp">Home Page</a><br>
    <%

      if (session.getAttribute("accountID")==null){
        %>
          <h1>ERROR, You do not seem to be login</h1>
        <%
      }else{
        int accountID = (Integer)session.getAttribute("accountID");
    %>
    <div>
      <form>
        <table>
          <thead>
            <th>Password</th>
          </thead>
          <tbody>
            <tr>
              <td><input type = "password" name = "password"></td>
            </tr>
          </tbody>
        </table>
        <input type="submit" value="Delete Account" name="delete">
      </form>
    </div>
      <%
      String user = "appdb";
      String password = "password";
      try {
          java.sql.Connection con;
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
          Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
          String query = "SELECT * FROM `CS157A_Proj`.account WHERE account_id = "+accountID;
          ResultSet rs = stmt.executeQuery(query);
          rs.next();
          String sign = request.getParameter("delete");
          if(sign != null ){
            query = "DELETE FROM `CS157A_Proj`.account WHERE account_id = "+accountID;
            String userPassword = request.getParameter("password");
            if(userPassword!=null && userPassword.equals(rs.getString(3))) {
              stmt.executeUpdate(query);
              query = "DELETE FROM `CS157A_Proj`.user WHERE account_id = "+accountID;
              stmt.executeUpdate(query);
              query = "DELETE FROM `CS157A_Proj`.payment WHERE account_id = "+accountID;
              stmt.executeUpdate(query);
              session.removeAttribute("accountID");
              session.removeAttribute("userID");
              response.sendRedirect("home.jsp");
            } else{
              out.print("Wrong Password Entered");
            }

          }
        }catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    }
      %>

    </body>
  </html>
