<!-- productList.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Categories List</title>
    </head>
    <body>
    <center>
        <h1>Categories Management</h1>
        <h2>
            <a href="categories?action=create">Add New Category</a>
        </h2>
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
                <th>Actions</th>
            </tr>
            <c:forEach var="category" items="${categories}" varStatus="status">
                <c:if test="${status.index >= start && status.index < end}">
                    <tr>
                        <td>${category.categoryId}</td>
                        <td>${category.name}</td>
                        <td>
                            <a href="products?action=edit&id=${category.categoryId}">Edit</a>
<!--                            <a href="products?action=delete&id=${category.categoryId}">Delete</a>-->
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