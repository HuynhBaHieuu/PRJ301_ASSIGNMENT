<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa thông tin cá nhân</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
        <style>
            .edit-user-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 70vh;
            }
            .edit-user-title {
                font-size: 1.5rem;
                font-weight: bold;
                margin-top: 30px;
                margin-bottom: 10px;
                text-align: center;
            }
            .edit-user-back {
                color: #800080;
                font-weight: 600;
                text-align: center;
                margin-bottom: 30px;
                display: block;
                text-decoration: underline;
                font-size: 1.1rem;
            }
            .edit-user-table {
                margin: 0 auto;
                border: 1px solid #aaa;
                border-radius: 6px;
                padding: 20px 30px 10px 30px;
                background: #fff;
                min-width: 350px;
                max-width: 450px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            }
            .edit-user-table th {
                text-align: left;
                font-weight: 600;
                padding-right: 10px;
                font-size: 1rem;
            }
            .edit-user-table td {
                padding: 7px 0;
            }
            .edit-user-table input[type="text"],
            .edit-user-table input[type="email"],
            .edit-user-table input[type="password"],
            .edit-user-table input[type="date"] {
                width: 100%;
                padding: 6px 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 1rem;
            }
            .edit-user-table input[type="submit"] {
                margin-top: 10px;
                padding: 8px 24px;
                background: #009045;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 1.1rem;
                font-weight: 600;
                cursor: pointer;
                transition: background 0.2s;
            }
            .edit-user-table input[type="submit"]:hover {
                background: #007a38;
            }
            .edit-user-table caption {
                font-size: 1.3rem;
                font-weight: bold;
                margin-bottom: 10px;
                color: #222;
            }
        </style>
    </head>
    <body>
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>
    <div class="edit-user-container">
        <div class="edit-user-title">Thông tin tài khoản</div>
<!--        <a href="${pageContext.request.contextPath}/home" class="edit-user-back">Quay lại trang chủ</a>-->
        <c:if test="${user != null}">
            <form method="post" action="${pageContext.request.contextPath}/editProfile">
                <table class="edit-user-table">
<!--                    <caption>Thông tin người dùng</caption>-->
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
    <%@ include file="../design/footer.jsp" %>    
</body>
</html>
