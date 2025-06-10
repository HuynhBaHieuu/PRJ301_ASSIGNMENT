<%-- 
    Document   : login
    Created on : May 14, 2025, 1:37:58 PM
    Author     : Admin
--%>

<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%
    String savedUser = "";
    String savedPass = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("username".equals(c.getName())) {
                savedUser = URLDecoder.decode(c.getValue(), "UTF-8");
            } else if ("password".equals(c.getName())) {
                savedPass = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="user/css/login.css"> <!-- Liên kết đến CSS -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="wrapper">
            <form name="input" action="login" method="post">
                <h1>Login</h1>
                <div class="input-box">
                    <input type="text" id="username" name="user" value="<%= savedUser%>" placeholder="Username" required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="input-box">
                    <input type="password" id="password" name="pass" value="<%= savedPass%>" placeholder="Password" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>
                <div class="remember-forgot">
                    <label><input type="checkbox" name="remember" <%= (savedUser.isEmpty() ? "" : "checked")%> > Remember Me</label>
                    <a href="#">Forgot Password</a>
                </div>
                <button type="submit" class="btn">Login</button>
                <div class="register-link">
                    <p>Don't have an account? <a href="register.jsp">Sign up</a></p>
                </div>
                <div class="error-message">
                    <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : ""%>
                </div>
            </form>
        </div>
    </body>
</html>
