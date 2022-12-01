<%@ page import="java.sql.*"%>
<%@ page import="java.string.*"%>
<head>

    <title>Flick It Up!</title>
    <link rel="icon" type="image/png" href="https://pics.freeicons.io/uploads/icons/png/19348469091553508380-512.png">
    <link href="css/hover.css" rel="stylesheet" media="all">
    <link rel="stylesheet" type="text/css" href="/project/css/reviewForm.css">

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<div class="topnav">
  <a  href="home.jsp">Home</a>
  <a href="movies.jsp">Movies</a>
  <a href="favorite.jsp">Favorites</a>
  <a href="accountPage.jsp">Account</a>
</div>
<br>
    <%
      //session.setAttribute("movieID",3);
      if (session.getAttribute("movieID")==null){
        %>
          <h1>ERROR, No movie was selected</h1>
        <%
      }else{

        int movieID = (Integer)session.getAttribute("movieID");
	      int userID = (Integer)session.getAttribute("userID");
        String user = "appdb";
        String password = "password";
            %>
            <div id = “review”>
			<h1> Write a Review </h1>
      	<form>
			<table>
				<thead>
					<th>Rate</th>
					<th>Comment</th>

				</thead>
				<tbody>
					<tr>
						<td><input type = "text" name = "rate"></td>
						<td><input type = "text" name = "comment"></td>
					</tr>
				</tbody>
			</table>

	      		<form method="post" action="movies.jsp">
				<input type="submit" value="Submit" name="review">
	  	</form>
		</div>

            <%
            String review = request.getParameter("review");

      if(review != null && review.equals("Submit")){
  		String rate = request.getParameter("rate");
  		String comment = request.getParameter("comment");
  		String connectionURL = "jdbc:mysql://localhost:3306/CS157A_Proj";
  		Connection connection = null;
  		PreparedStatement pstatement = null;
  		int updateQuery = 0;
  		if (rate==null || comment==null ||rate=="" || comment=="")	{
			%>
    			<br>
			<h3>Entries are incorrect, try again</h3>
 			<%
	   	}else {
    			try{
      				Class.forName("com.mysql.jdbc.Driver");
      				connection = DriverManager.getConnection(connectionURL,"appdb","password");
      				String queryString = "INSERT INTO review (user_id, movie_id,rating, comment) VALUES (?,?,?,?)";
      				pstatement = connection.prepareStatement(queryString);
              pstatement.setInt(1, userID);
              pstatement.setInt(2, movieID);
              int rateInt = Integer.parseInt(rate);
              pstatement.setInt(3, rateInt);
      				pstatement.setString(4, comment);
      				updateQuery = pstatement.executeUpdate();
     				if (updateQuery != 0){
                response.sendRedirect("movies.jsp");
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
