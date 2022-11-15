<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<head>

  <style>
   input[type=submit] {
    position: absolute;
    top: 10px;
    right: 10px;
   }
  </style>

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
  <>


</body>
