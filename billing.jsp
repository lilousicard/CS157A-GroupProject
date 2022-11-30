<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<head>

    <title>Flick It Up!</title>
    <link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">
    <link rel="stylesheet" type="text/css" href="css/billing.css"

</head>
<body style="background-color:#b14e59;">

<div class="topnav">
  <a  href="home.jsp">Home</a>
  <a href="favorite.jsp">Favorites</a>
  <a class="active" href="accountPage.jsp">Account</a>
</div>
<br>
 
  <%if (session.getAttribute("accountID")==null){%>
  <h1>Error, Please try again Later</h1>

  <% }else{
    String user = "appdb";
    String password = "password";
    try{
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

    int accountID = (Integer)session.getAttribute("accountID");
    StringBuilder builder = new StringBuilder();
    builder.append("SELECT * FROM `CS157A_Proj`.payment WHERE account_id =  ");
    builder.append(accountID);
    builder.append(";");

    String query = builder.toString();

    ResultSet rs = stmt.executeQuery(query);

    while(rs.next()){
      out.println("Name: "+rs.getString(2)+ "<br/><br/>");
      out.println("Card Number: "+rs.getString(3)+ "<br/><br/>");
      out.println("Expiration Date: "+rs.getString(5)+ "<br/><br/>");
    }

    rs.close();
    stmt.close();
    con.close();
  }catch(SQLException e) {
      out.println("SQLException caught: " + e.getMessage());
  }
  %>
  <a href="http://localhost:8080/project/CardForm.jsp">Change Billing information</a><br>
  <a href="http://localhost:8080/project/deleteForm.jsp">Delete Your Account</a><br>

  <%

  }

  %>






</body>
