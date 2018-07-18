<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>
<%@ page import="codeu.model.store.basic.UserStore" %>



<!DOCTYPE html>

<html>
<head>
  <title>CodeU Chat App</title>
   <link rel="stylesheet" href="/css/main.css">
   <link href="https://fonts.googleapis.com/css?family=Montserrat:700" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
     <nav>
       <a id="navTitle" href="/">MURMUR</a>
       <% if(request.getSession().getAttribute("user") != null){ %>
         <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
       <% } else{ %>
         <a href="/login">Login</a>
       <% } %>
       <a href="/about.jsp">About</a>
       <a href="/activityfeed">Feed</a>
       <% if(request.getSession().getAttribute("user") != null){ %>
       <a href="/conversations">Conversations</a>
        <% }  %>
       <% if(request.getSession().getAttribute("user") != null){ %>
       <a href="/mentions" > Notifications</a>
        <% }  %>
       <a href="/user/<%=request.getSession().getAttribute("user")%>">Profile</a>
       <% if(request.getSession().getAttribute("user") != null){ %>
       <a href="/logout" > Logout</a>
        <% }  %>
      </nav>
</head>

  <body>
        <% Boolean isRegistered = (Boolean) request.getAttribute("isRegistered");
            Boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
        %>
        <%   if (isAdmin) {  %>
      <h1>this is what the admin page looks like with real data:</h1>
      <ul>
        <li><b>Total Messages: <%= request.getAttribute("totalMessages") %></b></li>
        <li><b>Total Users:<%= request.getAttribute("totalUsers") %></b></li>
        <li><b>Total Conversations:<%= request.getAttribute("totalConvos") %></b> </li>
      </ul>

          <% }
          else {
              response.sendRedirect("/login");
            }
          %>

  </body>
</html>
