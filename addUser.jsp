<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Flick It UP</title>
  </head>
  <body>
    <%

      if (session.getAttribute("accountID")==null){
        %>
          <h1>ERROR, You do not seem to be login</h1>
        <%
      }else{
        int accountID = (Integer)session.getAttribute("accountID");
    %>
    <form method="post">
      <label for="addUser">Add a User</label>
      <td><input type="text" name="Name"></td></br>
      <select id="utype" name="utype">
        <option value= main>Main</option>
        <option value= sub>Sub</option>
        <option value= child>Child</option>
      </select>
      <input type="submit" value="create" name="create">
    </form>

    <%
    String sign = request.getParameter("create");

    if(sign != null){
      	String Username = request.getParameter("Name");
      	String Type = request.getParameter("utype");
      	String connectionURL = "jdbc:mysql://localhost:3306/CS157A_Proj";
      	Connection connection = null;
      	PreparedStatement pstatement = null;
      	int updateQuery = 0;
        			try{
          				Class.forName("com.mysql.jdbc.Driver");
          				connection = DriverManager.getConnection(connectionURL,"appdb","password");
          				String queryString = "INSERT INTO user (name,user_type,account_id) VALUES (?,?,?)";
          				pstatement = connection.prepareStatement(queryString);
          				pstatement.setString(1, Username);
          				pstatement.setString(2, Type);
                  pstatement.setInt(3,accountID);
          				updateQuery = pstatement.executeUpdate();
           				if (updateQuery != 0){
                    response.sendRedirect("accountPage.jsp");
            			}
        			}
        			catch (Exception ex){
          			    out.println("SQLException caught: " + ex.getMessage());
        			}
        			pstatement.close();
          		connection.close();
    			}
        }
    %>

  </body>
</html>
