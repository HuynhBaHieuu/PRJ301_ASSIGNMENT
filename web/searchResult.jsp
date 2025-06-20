<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Nông Sản Tương Lai</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/logo.png">
        <link rel="stylesheet" href="css/home.css" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <%@ include file="design/header.jsp" %>
        <%@ include file="design/navbar.jsp" %>
        <div class="main-content">
            <%@ include file="design/sidebar.jsp" %>
            <div class="banner-area">
                <h2 style="text-align: center; margin-top: 30px;">
                    Kết quả tìm kiếm cho: <span style="color: #009045">${searchQuery}</span>
                </h2>

                <div class="products">
                    <c:forEach var="product" items="${products}">
                        <div class="product">
                            <img src="images/${product.id}.jpg" alt="${product.name}">
                            <h4>${product.name}</h4>
                            <p>Giá: ${product.price}</p>
                            <p>${product.description}</p>
                            <a href="product/productDetail.jsp?id=${product.id}">Chi tiết</a>
                        </div>
                    </c:forEach>

                    <c:if test="${empty products}">
                        <p style="text-align:center; color:red; width: 100%;">Không tìm thấy sản phẩm nào.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
