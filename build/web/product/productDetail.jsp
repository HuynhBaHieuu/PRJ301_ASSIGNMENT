<%-- 
    Document   : productDetail
    Created on : Jun 14, 2025, 8:56:39 PM
    Author     : Administrator
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Product" %>
<%@ page import="service.ProductService" %>
<%
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
        out.println("<h1>Không tìm thấy sản phẩm!</h1>");
        return;
    }

    int id = Integer.parseInt(idParam);
    ProductService service = new ProductService();
    Product product = service.getProductById(id);

    if (product == null) {
        out.println("<h1>Sản phẩm không tồn tại!</h1>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= product.getName() %></title>
    <link rel="stylesheet" href="../css/productDetail.css" />
</head>
<body>
    <div class="container">
    <!-- Bên trái: Ảnh sản phẩm -->
    <div class="left-image">
        <img src="images/<%= product.getId() %>.jpg" alt="<%= product.getName() %>">
    </div>

    <!-- Bên phải: Thông tin sản phẩm -->
    <div class="right-content">
        <h2><%= product.getName() %> - <%= product.getDescription() %></h2>
        <div class="product-id">Mã sản phẩm: <span style="color:#1e90ff;font-weight: bolder"><%= product.getId() %></span></div>
        <div class="product-price"><%= product.getPrice() %><sup class="vnd-symbol">đ</sup></div>

        <!-- Số lượng -->
        <div class="quantity">
            <span>Số lượng:</span>
            <button onclick="decreaseQuantity()">-</button>
            <input type="text" id="quantity" value="1" readonly>
            <button onclick="increaseQuantity()">+</button>
        </div>

        <!-- Nút mua ngay -->
        <button class="buy-button"><i class="fa fa-shopping-cart"></i> MUA NGAY</button>

        <!-- Thêm vào giỏ -->
        <button class="add-to-cart-button">THÊM VÀO GIỎ</button>
    </div>
</div>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script>
    function increaseQuantity() {
        let qty = document.getElementById("quantity");
        qty.value = parseInt(qty.value) + 1;
    }

    function decreaseQuantity() {
        let qty = document.getElementById("quantity");
        if (parseInt(qty.value) > 1) {
            qty.value = parseInt(qty.value) - 1;
        }
    }
</script>
</body>
</html>


