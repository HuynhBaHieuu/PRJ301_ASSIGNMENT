<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Mục Sản Phẩm</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/allProducts.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    </head>

    <body>
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>
        <section class="breadcrumb-section">
            <div class="breadcrumb-container">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><span class="divider">/</span><a href="${pageContext.request.contextPath}/productItem/allProducts.jsp">Danh mục</a></li>
                    <li><span class="divider">/</span><span class="current">Tất cả sản phẩm</span></li>
                </ul>
            </div>
        </section>

        <section class="allProducts-section">
            <div class="allProducts-container">
                <ul class="allProducts">
                    <li>Tất cả sản phẩm</li>
                </ul>
            </div>
        </section> 

        <!-- Hiển thị sản phẩm -->
        <div class="products">
            <c:forEach var="product" items="${products}">
                <div class="product">
                    <!-- Hiển thị hình ảnh sản phẩm -->
                    <img src="image/${product.imageUrl}" alt="${product.name}" class="product-image">

                    <!-- Tên sản phẩm -->
                    <h4 class="product-name">${product.name}</h4>

                    <!-- Giá sản phẩm -->
                    <p class="product-price">Giá: ${product.price}</p>

                    <!-- Mô tả sản phẩm -->
                    <p class="product-description">${product.description}</p>

                    <!-- Liên kết đến chi tiết sản phẩm -->
                    <a href="product/productDetail.jsp?id=${product.id}" class="product-link">Chi tiết</a>
                </div>
            </c:forEach>
        </div>
        <%@ include file="../design/footer.jsp" %>               
    </body>

</html>
