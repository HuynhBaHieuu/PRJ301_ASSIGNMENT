<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Chỉnh sửa thông tin cá nhân</title>
</head>
<body>
    <center>
        <h1>Chỉnh sửa thông tin</h1>
        <h3><a href="${pageContext.request.contextPath}/home">Quay lại trang chủ</a></h3>
    </center>

    <div align="center">
        <form method="post" action="${pageContext.request.contextPath}/editProfile">
            <table border="1" cellpadding="5">
                <caption><h2>Thông tin người dùng</h2></caption>

                <tr>
                    <th>Tên đăng nhập:</th>
                    <td><input type="text" name="username" size="45" value="${user.username}" required/></td>
                </tr>

                <tr>
                    <th>Email:</th>
                    <td><input type="email" name="email" size="45" value="${user.email}" required/></td>
                </tr>

                <tr>
                    <th>Quốc gia:</th>
                    <td><input type="text" name="country" size="20" value="${user.country}" /></td>
                </tr>

                <tr>
                    <th>Mật khẩu:</th>
                    <td><input type="password" name="password" size="45" value="${user.password}" required/></td>
                </tr>

                <tr>
                    <th>Ngày sinh:</th>
                    <td><input type="date" name="dob" value="${user.dob}" required/></td>
                </tr>

                <tr>
                    <th>Số điện thoại:</th>
                    <td><input type="text" name="phone" value="${user.phone}" required/></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Lưu thay đổi" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
