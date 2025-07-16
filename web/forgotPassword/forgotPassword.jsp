<%-- 
    Document   : forgotPassword
    Created on : Jul 15, 2025, 7:11:57 PM
    Author     : Administrator
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error = (String) session.getAttribute("forgotErrorMessage");
    if (error != null) session.removeAttribute("forgotErrorMessage");

    String success = (String) session.getAttribute("forgotSuccessMessage");
    if (success != null) session.removeAttribute("forgotSuccessMessage");

    String forgotEmail = (String) session.getAttribute("forgotEmail");
    if (forgotEmail != null) session.removeAttribute("forgotEmail");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="wrapper">
        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
            <h1>Forgot Password</h1>
            <br>
            <p style="text-align: center;font-size: 15px;">Enter your email and we'll send you the instructions</p>
            <div class="input-box">
                <input type="email" name="email" placeholder="Enter your email" required 
                       value="<%= forgotEmail != null ? forgotEmail : "" %>" />
            </div>
            <button type="submit" class="btn">Submit</button>
            
            <div class="error-message" style="color: red; margin-top: 20px;text-align: center;font-size: 20px;">
                <%= error != null ? error : "" %>
            </div>
            <div class="success-message" style="color: green; margin-top: 20px;text-align: center;font-size: 20px;">
                <%= success != null ? success : "" %>
            </div>
        </form>
    </div>
</body>
</html>