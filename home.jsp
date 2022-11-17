<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<head>

<style>

</style>

<style><%@include file="css/home.css"%></style>


  <title>Flick It Up!</title>

</head>
<body style="background-color:#b14e59;">

  <nav>
    <ul>
			<li><a href="movies.jsp">Movies</a></li>
      <li><a href="saved.jsp">Saved</a></li>
		</ul>
    <div class="searchbar">
      <form action="search.jsp">
        <input type="text" placeholder="Search Title, People, Genres..." name="search">
        <button><i class="fa fa-search"></i></button>
      </form>
    </div>
	</nav>



  <%if (session.getAttribute("accountID")==null){%>
  <p><sub><a href="http://localhost:8080/project/login.jsp">Login</a></sub>
  <sub><a href="http://localhost:8080/project/register.jsp">Sign Up</a></sub></p>
  <%}else{
      int accountID = (Integer)session.getAttribute("accountID");
    %>
      <form method="post">
        <input type="submit" value="Log Out" name="logOut">
      </form>
      <p><sub><a href="http://localhost:8080/project/accountPage.jsp">Account</a></sub></p>
  <%
      if (session.getAttribute("userID")==null){%>
        <p><sub> You did not pick a user!</sub></p>
      <%} else {
        int userID = (Integer)session.getAttribute("userID");
        %>
          <p><sub> <%=userID%> </sub></p>

        <%
      }



      String sign = request.getParameter("logOut");
      if(sign!=null){
        session.removeAttribute("accountID");
        session.removeAttribute("userID");
        response.sendRedirect("home.jsp");

      }

    }%>
  <h1> WELCOME TO FLICK IT UP!</h1>
  <%
  String [] str = {" "," "," "," "," "," "," "," "," "," "};
  int [] id = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
  String user = "appdb";
  String password = "password";
  try {
      java.sql.Connection con;
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS157A_Proj?autoReconnect=true&useSSL=false",user, password);
      Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);


      StringBuilder builder = new StringBuilder();
      builder.append("SELECT * FROM `CS157A_Proj`.movie");
      builder.append(";");

      String query = builder.toString();

      ResultSet rs = stmt.executeQuery(query);
      int index = 0;
      while(rs.next()){
        out.println(rs.getString(2)+ "<br/><br/>");
        str[index]=rs.getString(2);
        id[index] = rs.getInt(1);
        index++;
      }

      rs.close();
      stmt.close();
      con.close();
  } catch(SQLException e) {
      out.println(e);
  }
  %>
  <form method="post">
    <label for="movie">Choose an movie</label>
  <select id="movie" name="movie">
    <option value=<%= id[0] %>><%= str[0] %></option>
    <option value=<%= id[1] %>><%= str[1] %></option>
    <option value=<%= id[2] %>><%= str[2] %></option>
    <option value=<%= id[3] %>><%= str[3] %></option>
    <option value=<%= id[4] %>><%= str[4] %></option>
    <option value=<%= id[5] %>><%= str[5] %></option>
    <option value=<%= id[6] %>><%= str[6] %></option>
    <option value=<%= id[7] %>><%= str[7] %></option>
    <option value=<%= id[8] %>><%= str[8] %></option>
    <option value=<%= id[9] %>><%= str[9] %></option>
  </select>
  <input type="submit" value="Go To Movie Page" name="goMovie">
  </form>
  <%
    String input = request.getParameter("goMovie");
    if(input != null){
      session.setAttribute("movieID",Integer.parseInt(request.getParameter("movie")));
      response.sendRedirect("movies.jsp");
    }

  %>



</body>
