<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Kiểm tra session nếu người dùng đã đăng nhập
    User user = (User) session.getAttribute("user");

    if (user == null) {
%>
<!-- Nếu người dùng chưa đăng nhập, hiển thị thông tin mặc định và nút đăng nhập -->
<h2>Welcome, Guest!</h2>
<a href="login.jsp">Login</a>
<%
} else {
%>
<!-- Nếu người dùng đã đăng nhập, hiển thị thông tin người dùng -->
<h2>Welcome, <%= user.getUsername()%>!</h2>
<a href="logout">Logout</a>
<%
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <style>
            .product {
                border: 1px solid #ccc;
                padding: 15px;
                margin-bottom: 20px;
                width: 200px;
                display: inline-block;
                text-align: center;
            }
            .product img {
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <!-- Form tìm kiếm -->
        <form action="search" method="get">
            <input type="text" name="query" placeholder="Search products..." required>
            <button type="submit">Search</button>
        </form>
        <h3>Best seller</h3>

        <div class="products">
            <c:forEach var="product" items="${products}">
                <div class="product">
                    <!-- Giả sử sản phẩm có ảnh, bạn có thể thay đổi tùy thuộc vào dữ liệu thực tế -->
                    <img src="images/${product.id}.jpg" alt="${product.name}">
                    <h4>${product.name}</h4>
                    <p>Price: ${product.price}</p>
                    <p>${product.description}</p>
                    <a href="productDetail.jsp?id=${product.id}">Details</a>
                </div>
            </c:forEach>
        </div>
    </body>
</html>