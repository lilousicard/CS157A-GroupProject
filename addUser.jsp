<%@ page import="java.sql.*"%>
<head>

    <title>Flick It Up!</title>
    <link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">
    <link rel="stylesheet" type="text/css" href="/project/css/addUser.css">
	<link href="css/hover.css" rel="stylesheet" media="all">

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<div class="topnav">
  <a  href="home.jsp">Home</a>
  <a href="movies.jsp">Movies</a>
  <a href="favorite.jsp">Favorites</a>
  <a class="active" href="accountPage.jsp">Account</a>
</div>
	
<div class="searchbar">
      <form action="search.jsp">
        <input type="text" placeholder="Search Title, People, Genres..." name="search">
        <button><i class="fa fa-search"></i></button>
      </form>
    </div>
	
<br>
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

		<footer class="bottomnav">
			<a href="http://localhost:8080/project/billing.jsp">Billing Info</a>
			<a href="http://localhost:8080/project/addUser.jsp">AddUser</a>
		</footer>

  </body>
</html>
