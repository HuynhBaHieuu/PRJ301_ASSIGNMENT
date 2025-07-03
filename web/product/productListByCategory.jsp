<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm theo danh mục</title>
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
                    <li><span class="divider">/</span><span class="current">Sản phẩm theo danh mục</span></li>
                </ul>
            </div>
        </section>

        <section class="allProducts-section">
            <div class="allProducts-container">
                <ul class="allProducts">
                    <li>Sản phẩm theo danh mục: <c:out value="${categoryName}"/></h2>
                </ul>
            </div>
        </section> 
        <div class="products">
            <c:forEach var="product" items="${products}">
                <div class="product">
                    <img src="image/${product.imageUrl}" alt="${product.name}">
                    <h4>${product.name}</h4>
                    <p>Giá: ${product.price}</p>
                    <p>${product.description}</p>
                    <a href="product/productDetail.jsp?id=${product.id}">Chi tiết</a>
                </div>
            </c:forEach>
        </div>
    </body>
</html> 