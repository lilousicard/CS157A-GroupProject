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
    <form>
      <table>
        <thead>
          <th>Card Number</th>
          <th>Name</th>
          <th>CVV</th>
          <th>Expiration Date</th>
          <th>Zip Code</th>
        </thead>
        <tbody>
          <tr>
            <td id=“CardNumber” name="CardNumber"><input type=“text”/></td>
            <td id=“Name” name="Name"><input type=“text”/></td>
            <td id=“CVV” name="CVV"><input type=“number”/></td>
            <td id=“exp” name="ExpirationDate"><input type=“text”/></td>
            <td id=“zip” name="ZipCode"><input type=“number”/></td>


          </tr>
        </tbody>
      </table>
      <form method="post" action="home.jsp">
      <input type="submit" value="Register Card">
      </form>
    </div>
    <%
      if("POST".equalsIgnoreCase(request.getMethod())){

          String CardNumber = request.getParameter("CardNumber");
          String Name = request.getParameter("Name");
          String EXP = request.getParameter("exp");
          int CVV = Integer.parseInt(request.getParameter("CVV"));
          int zip = Integer.parseInt(request.getParameter("zip"));

          String connectionURL = "jdbc:mysql://localhost:3306/CS157A_Proj";
          Connection connection = null;
          PreparedStatement pstatement = null;
          int updateQuery = 0;

          if (CardNumber==null || Name==null || EXP==null|| CVV == 0|| zip == 0||CardNumber=="" || Name=="" || EXP=="")	{
            %>
              <br>
              <h3>Entries are incorrect, try again</h3>
          <%
          }else if(CardNumber!=null || Name!=null || EXP!=null|| CVV != 0|| zip != 0){
            if(CardNumber!="" || Name!="" || EXP!=""){
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(connectionURL,"appdb","password");
                    String queryString = "INSERT INTO payment  VALUES (?,?,?,?,?)";
                    pstatement = connection.prepareStatement(queryString);
                    pstatement.setInt(1, accountID);
                    pstatement.setString(2, Name);
                    pstatement.setString(3, CardNumber);
                    pstatement.setInt(4,CVV);
                    pstatement.setString(5,EXP);
                    pstatement.setInt(6,zip);
                    updateQuery = pstatement.executeUpdate();
                  if (updateQuery != 0){
                    %>
                      <br>
                    <h3>Data is inserted successfully in database.</h3>
                      <%
                      }
                }
                catch (Exception ex){
                      out.println("Unable to connect to database.");
                }
            }

                pstatement.close();
                connection.close();
            }
        }
      }
    %>
    </form>
  </body>
</html>
