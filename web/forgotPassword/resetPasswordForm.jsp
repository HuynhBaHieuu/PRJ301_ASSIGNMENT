<%-- 
    Document   : resetPasswordForm
    Created on : Jul 15, 2025, 7:14:04 PM
    Author     : Administrator
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error = (String) session.getAttribute("resetErrorMessage");
    if (error != null) session.removeAttribute("resetErrorMessage");

    String email = request.getParameter("email");
    if (email == null || email.isEmpty()) {
        email = (String) session.getAttribute("resetEmail");
        if (email != null) session.removeAttribute("resetEmail");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="wrapper">
        <form action="${pageContext.request.contextPath}/reset-password" method="post">
            <h1>Reset Password</h1>
            <input type="hidden" name="email" value="<%= email != null ? email : "" %>" />
            <div class="input-box">
                <input type="password" name="newPassword" placeholder="New Password" required />
            </div>
            <div class="input-box">
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required />
            </div>
            <button type="submit" class="btn">Reset</button>
            <div class="error-message" style="color: red; margin-top: 20px;text-align: center;font-size: 20px;">
                <%= error != null ? error : "" %>
            </div>
        </form>
    </div>
</body>
</html>
