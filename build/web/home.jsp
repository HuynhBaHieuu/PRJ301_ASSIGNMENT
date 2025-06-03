
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.User" %>
<%
//    if(session != null || session.getAttribute("user") == null){
//        response.sendRedirect("login.jsp");
//        return;
//    }
    User user = (User) session.getAttribute("user");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
    </head>
    <body>
        <h2>Welcome, <%= user.getUsername()%>!</h2>
        <p>Email: <%= user.getEmail()%></p>
        <p>Country: <%= user.getCountry()%></p>

        <a href="logout">Logout</a>
    </body>
</html>
