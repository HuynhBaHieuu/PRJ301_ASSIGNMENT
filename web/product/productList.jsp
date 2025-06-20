<!-- productList.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Product List</title>
    </head>
    <body>
    <center>
        <h1>Product Management</h1>
        <h2>
            <a href="products?action=create">Add New Product</a>
        </h2>
        <h3>
            <a href="users?action=users">List All Users</a>
        </h3>
        <h3><a href="categories">List All Categories</a></h3>
    </center>
    <div align="center">
        <h2>Product List</h2>
        <%-- Thiết lập số sản phẩm hiển thị trên mỗi trang --%>
        <c:set var="pageSize" value="10"/>
        <c:set var="currentPage" value="${param.page != null ? param.page : 1}"/>

        <c:set var="start" value="${(currentPage - 1) * pageSize}"/>
        <c:set var="end" value="${start + pageSize}"/>
        <c:set var="totalProducts" value="${products.size()}"/>
        <c:set var="totalPages" value="${Math.ceil(totalProducts / pageSize)}"/>
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Stock</th>
                <th>Status</th>
                <th>CategoryID</th>
                <th>ImageURL</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="product" items="${products}" varStatus="status">
                <c:if test="${status.index >= start && status.index < end}">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.description}</td>
                        <td>${product.stock}</td>
                        <td>
                            <c:choose>
                                <c:when test="${product.status}">
                                    valid
                                </c:when>
                                <c:otherwise>
                                    invalid
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${product.categoryId}</td>
                        <td>${product.imageUrl}</td>
                        <td>
                            <a href="products?action=edit&id=${product.id}">Edit</a>
                            <a href="products?action=delete&id=${product.id}">Delete</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>

        </table>
    </div>
    <!-- Phân trang -->
    <div align="center">
        <c:if test="${currentPage > 1}">
            <a href="products?page=${currentPage - 1}">Previous</a>
        </c:if>

        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="products?page=${i}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="products?page=${currentPage + 1}">Next</a>
        </c:if>
    </div>
</body>