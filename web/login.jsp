<%-- 
    Document   : login
    Created on : May 14, 2025, 1:37:58 PM
    Author     : Admin
--%>

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
                savedUser = c.getValue();
            } else if ("password".equals(c.getName())) {
                savedPass = c.getValue();
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form name="input" action="login" method="post">
            <table>
                <tr>
                    <td>User name:</td>
                    <td><input type="text" name="user" value="<%= savedUser%>" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="pass" value="<%= savedPass%>" /></td>
                </tr>
                <tr>
                    <td>Remember me:</td>
                    <td><input type="checkbox" name="remember" <%= (savedUser.isEmpty() ? "" : "checked")%> /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="color:red;">
                        <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : ""%>
                    </td>
                </tr>
            </table>
        </form>

    </body>
</html>
