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
          <th>expiration Date</th>
          <th>Zip Code</th>
        </thead>
        <tbody>
          <tr>
            <td><input type = "text" name = "CardNumber"></td>
            <td><input type = "text" name = "Name"></td>
            <td><input type = "text" name = "CVV"></td>
            <td><input type = "text" name = "expDate"></td>
            <td><input type = "text" name = "ZipCode"></td>
          </tr>
        </tbody>

      </table>

       <input type="submit" value="Register Card" name="addCard">
      </form>
    </div>
    <%
      String sign = request.getParameter("addCard");
      if(sign != null){
          %>
              <br>
              <h3> pressed the button </h3>
          <%
          String CardNumber = request.getParameter("CardNumber");
          String Name = request.getParameter("Name");
          String expDate = request.getParameter("expdate");
          String test1 = request.getParameter("CVV");
          String test2 = request.getParameter("ZipCode");
          int number = 0;
          int zip = 0;
          if (test1!=null && test2!=null){
            number = Integer.parseInt(test1);
            zip = Integer.parseInt(test2);
          }

          String connectionURL = "jdbc:mysql://localhost:3306/CS157A_Proj";
          Connection connection = null;
          PreparedStatement pstatement = null;
          int updateQuery = 0;

          if (CardNumber==null || Name==null || expDate==null|| number == 0|| zip == 0||CardNumber=="" || Name=="" || expDate=="")	{
            %>
              <br>
              <h3>Entries are incorrect, try again </h3>
          <%
          }else {
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(connectionURL,"appdb","password");
                    String queryOne = "DELETE FROM payment WHERE account_id = "+accountID+";";
                    pstatement = connection.prepareStatement(queryOne);
                    updateQuery = pstatement.executeUpdate();
                    String queryString = "INSERT INTO payment  VALUES (?,?,?,?,?,?)";
                    pstatement = connection.prepareStatement(queryString);
                    pstatement.setInt(1, accountID);
                    pstatement.setString(2, Name);
                    pstatement.setString(3, CardNumber);
                    pstatement.setInt(4,number);
                    pstatement.setString(5,expDate);
                    pstatement.setInt(6,zip);
                    updateQuery = pstatement.executeUpdate();
                  if (updateQuery != 0){
                    %>
                      <br>
                    <h3>Data is inserted successfully in database.</h3>
                      <%
                  } else {
                     %>
                      <br>
                    <h3>Data is not inserted in database.</h3>
                      <%
                  }
                }
                catch (Exception ex){
                      out.println("SQLException caught: " + ex.getMessage());
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
