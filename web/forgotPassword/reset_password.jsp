<%-- 
    Document   : reset_password
    Created on : Jul 12, 2025, 3:49:21 PM
    Author     : phung
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Lại Mật Khẩu</title>
</head>
<body>
    <h2>Đặt lại mật khẩu</h2>
    
    <form action="reset_password.jsp" method="post">
        <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>" />
        <label for="newPassword">Mật khẩu mới:</label><br>
        <input type="password" name="newPassword" required /><br><br>

        <label for="confirmPassword">Nhập lại mật khẩu:</label><br>
        <input type="password" name="confirmPassword" required /><br><br>

        <button type="submit">Đặt lại mật khẩu</button>
    </form>
</body>
</html>


