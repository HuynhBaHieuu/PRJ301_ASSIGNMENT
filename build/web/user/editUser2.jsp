<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        <c:if test="${user != null}">
            <form method="post" action="${pageContext.request.contextPath}/editProfile">
                <table border="1" cellpadding="5">
                    <caption><h2>Thông tin người dùng</h2></caption>
                    <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                    <tr>
                        <th>Tên đăng nhập:</th>
                        <td><input type="text" name="username" size="45" value="<c:out value='${user.username}' />" required/></td>
                    </tr>


                    <tr>
                        <th>Email:</th>
                        <td><input type="email" name="email" size="45" value="<c:out value='${user.email}' />" required/></td>
                    </tr>

                    <tr>
                        <th>Quốc gia:</th>
                        <td><input type="text" name="country" size="20" value="<c:out value='${user.country}' />" /></td>
                    </tr>

                    <tr>
                        <th>Mật khẩu:</th>
                        <td><input type="password" name="password" size="45" value="<c:out value='${user.password}' />" required/></td>
                    </tr>

                    <fmt:formatDate value="${user.dob}" pattern="yyyy-MM-dd" var="formattedDob" />
                    <tr>
                        <th>Ngày sinh:</th>
                        <td><input type="date" name="dob" value="${formattedDob}" required/></td>
                    </tr>

                    <tr>
                        <th>Số điện thoại:</th>
                        <td><input type="text" name="phone" value="<c:out value='${user.phone}' />" required/></td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Lưu thay đổi" />
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
    </div>
</body>
</html>
