<%@ page import="java.sql.*"%>
<head>

		<title>Flick It Up!</title>
		<link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">
		<link href="css/hover.css" rel="stylesheet" media="all">
		<link rel="stylesheet" type="text/css" href="/project/css/account.css">

<meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Flick It Up!</title>


</head>
<body>

<div class="topnav">
  <a  href="home.jsp">Home</a>
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
  if (session.getAttribute("accountID")==null){%>
  <h2>You are not logged in!</h2>
  <p>Please choose an option below</p>
  <p><sub><a href="http://localhost:8080/project/login.jsp">Login</a></sub>
  <sub><a href="http://localhost:8080/project/register.jsp">Sign Up</a></sub></p>
 

  <%}else{
   int accountID = (Integer)session.getAttribute("accountID");
   //out.println(accountID);


   StringBuilder builder = new StringBuilder();
	 String [] str = {" "," "," "," "};
	 int [] id = {-1,-1,-1,-1};
   builder.append("SELECT * FROM `CS157A_Proj`.user WHERE account_id = ");
   builder.append(accountID);
   builder.append(";");
   String query = builder.toString();
   String user = "appdb";
   String password = "password";
   try {
       java.sql.Connection con;
       Class.forName("com.mysql.jdbc.Driver");
       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
       Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
       ResultSet rs = stmt.executeQuery(query);
			 int i=0;
       while(rs.next()){
       	//out.println(rs.getString(2)+ "<br/><br/>");
				str[i]=rs.getString(2);
				id[i] = rs.getInt(1);
				String type = rs.getString(3);
				session.setAttribute("isAdmin",type);
				i++;
		 	}
     }catch(SQLException e) {
         out.println("SQLException caught: " + e.getMessage());
     }

  %>

	  <form method="post">
			<label for="users">Choose an User</label>
		<select id="users" name="users">
		  <option value=<%= id[0] %>><%= str[0] %></option>
		  <option value=<%= id[1] %>><%= str[1] %></option>
		  <option value=<%= id[2] %>><%= str[2] %></option>
		  <option value=<%= id[3] %>><%= str[3] %></option>
		</select>
		<input type="submit" value="Go To User" name="goUser">
		</form>

		<%
			String input = request.getParameter("goUser");
			if(input != null){
				session.setAttribute("userID",Integer.parseInt(request.getParameter("users")));
				response.sendRedirect("home.jsp");
			}

			if ((session.getAttribute("isAdmin")).equals("admin")){
				%>
			<li><a href="http://localhost:8080/project/adminReview.jsp">Review the movie Review</a></li>
			<%
		}


		%>


		<ul>
			
			<li><a href="http://localhost:8080/project/billing.jsp">Billing Info</a></li>
			<li><a href="http://localhost:8080/project/addUser.jsp">AddUser</a></li>
		</ul>

<%
}
%>
  </body>
</html>
