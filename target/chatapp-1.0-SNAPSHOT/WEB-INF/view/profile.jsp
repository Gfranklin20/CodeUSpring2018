<%@ page import="codeu.model.store.basic.UserStore" %>

<!DOCTYPE html>
<html>
<head>
  <title><%= request.getSession().getAttribute("user") %></title>
  <link rel="stylesheet" href="/css/main.css">
    <nav>
      <a id="navTitle" href="/">CodeU Chat App</a>
      <a href="/conversations">Conversations</a>
      <% if(request.getSession().getAttribute("user") != null){ %>
        <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <% } else{ %>
        <a href="/login">Login</a>
      <% } %>
      <a href="/about.jsp">About</a>
       <% if (request.getSession().getAttribute("user") != null) { %>
      <a href="/admin"> Admin page </a>
       <% } else { %>
       <a href="/login">Login as Admin</a>
       <a href="/user/<%=request.getSession().getAttribute("user")%>">Profile</a>
        
      <% } %>
    </nav>
</head>
  <body>
      <div style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;" id="container">
        <h1><%= request.getSession().getAttribute("user")%></h1>
        <h1> ABOUT ME:</h1>
        <h1><%= request.getParameter("AboutMe")%></h1>
          <div class="aboutMe">
            <form action="/user/<%=request.getSession().getAttribute("user")%>" method="GET">
              <input type="text" name="AboutMe" value="What about you?">
              <br/><br/>
              <input type="submit" value="Submit">
            </form>    
          </div>
      </div>
  </body>
</html>