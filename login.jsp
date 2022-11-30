<%@ page import="java.sql.*"%>
<html>
<head>

    <title>Flick It Up!</title>
    <link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">


<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: transparent;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
<%@include file="css/home.css"%>
</style>



</head>
<body style="background-color:#b14e59;">

<div class="topnav">
  <a  href="home.jsp">Home</a>
  <a href="favorite.jsp">Favorites</a>
  <a class="active" href="accountPage.jsp">Account</a>
</div>
<br>
    <form method="post">

    <h1>Login:</h1>

    <td>Username:</td>
    <td><input type="text" name="inputUserName"></td></br>
    <td>Password:</td>
    <td><input type="password" name="inputPassword"></td></br>

    <input type="submit" value="Sign In" name="signIn">

    </form>
  </body>
  <%
            String user = "appdb";
            String password = "password";
            try {
                java.sql.Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("SELECT * FROM `CS157A_Proj`.account");

                String sign = request.getParameter("signIn");
                if(sign != null && sign.equals("Sign In")){
                    String inputUser = request.getParameter("inputUserName");
                    String inputPass = request.getParameter("inputPassword");
                    rs.beforeFirst();
                    out.println("<br></br>");
                    boolean flag = true;
                    while(rs.next()){
                        if(inputUser.equals(rs.getString(2)) && inputPass.equals(rs.getString(3))){
                            session.setAttribute("accountID",rs.getInt(1));
                            response.sendRedirect("accountPage.jsp");
                            flag = false;
                            break;
                        }
                    }
                    if(flag){
                        out.println("Incorrect Username and Password");
                    }
                }
                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
  %>

</html>
