<!DOCTYPE HTML>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<HTML>
<head>
<title>Flick It Up</title>
<style>
html{background-color: #1691E2}
</style>
</head>
<body>
<h1 align = center> Want to register early? </h1>
<FORM align = "center">
<TABLE style="background-color: #16C8E2" WIDTH="20%" align = center>
<TR>
<TH width="50%">Username</TH>
<TD width="50%"><INPUT TYPE="text" NAME="Username"></TD>
</tr>
<TR>
<TH width="50%">Password</TH>
<TD width="50%"><INPUT TYPE="text" NAME="Password"></TD>
</tr>
<TR>
<TH width="50%">Email</TH>
<TD width="50%"><INPUT TYPE="text" NAME="Email"></TD>
</tr>

<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
</tr>
</TABLE>
<%
String Username = request.getParameter("Username");
String Password = request.getParameter("Password");
String Email = request.getParameter("Email");
String connectionURL = "jdbc:mysql://localhost:3306/CS157A-Team3";
Connection connection = null;
PreparedStatement pstatement = null;
int updateQuery = 0;

if (Username==null || Password==null || Email==null||Username=="" || Password=="" || Email==""){%>
  <br>
  <TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1" align = center>
  <tr><th>Wrong Entries</th></tr>
  </table>

  <%
}

else if(Username!=null && Password!=null && Email!=null)
{
  if(Username!="" && Password!="" && Email!="")
  {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(connectionURL,"appdb","password");
      String queryString = "INSERT INTO Users (Username, Password,Email) VALUES (?,?,?)";
      pstatement = connection.prepareStatement(queryString);
      pstatement.setString(1, Username);
      pstatement.setString(2, Password);
      pstatement.setString(3, Email);
      updateQuery = pstatement.executeUpdate();
      if (updateQuery != 0) {%>
      <br>
      <TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1" align = center>
      <tr><th>Data is inserted successfully in database.</th></tr>
      </table>

      <%
      }
    }
    catch (Exception ex){
      out.println("Unable to connect to database.");
    }finally {
      // close all the connections.
      pstatement.close();
      connection.close();
    }
  }
}
%>
</FORM>
</body>
</html>
