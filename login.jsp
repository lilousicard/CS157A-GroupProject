<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Flick It UP</title>
    </head>
  <body>
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
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A-Team3?autoReconnect=true&useSSL=false",user, password);
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("SELECT * FROM `CS157A-Team3`.account");

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
