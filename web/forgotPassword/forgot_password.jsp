<%-- 
    Document   : forgot_password
    Created on : Jul 12, 2025, 3:35:00 PM
    Author     : phung
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
</head>
<body>
    <h2>Quên Mật Khẩu</h2>
    <form action="search_account.jsp" method="post">
        <label for="usernameOrPhone">Nhập Tên Đăng Nhập hoặc Số Điện Thoại:</label><br>
        <input type="text" id="usernameOrPhone" name="usernameOrPhone" required placeholder="Tên đăng nhập hoặc Số điện thoại" /><br><br>
        <button type="submit">Tìm Tài Khoản</button>
    </form>

    <br>
    <a href="${pageContext.request.contextPath}/login.jsp">Quay lại trang đăng nhập</a>
</body>
</html>



