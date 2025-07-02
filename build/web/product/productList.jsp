<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="active" value="products" scope="request"/>
<jsp:include page="../design/adminHeader.jsp"/>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Product Management</h2>
        <a href="products?action=create" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add New Product
        </a>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="pageSize" value="10"/>
                        <c:set var="currentPage" value="${param.page != null ? param.page : 1}"/>
                        <c:set var="start" value="${(currentPage - 1) * pageSize}"/>
                        <c:set var="end" value="${start + pageSize}"/>
                        <c:set var="totalItems" value="${fn:length(products)}"/>
                        <c:set var="totalPages" value="${(totalItems + pageSize - 1) / pageSize}"/>
                        <c:forEach var="product" items="${products}" varStatus="status">
                            <c:if test="${status.index >= start && status.index < end}">
                                <tr>
                                    <td>${product.id}</td>
                                    <td>
                                        <img src="${product.imageUrl}" alt="${product.name}" style="width: 50px; height: 50px; object-fit: cover;">
                                    </td>
                                    <td>${product.name}</td>
                                    <td>$${product.price}</td>
                                    <td>${product.stock}</td>
                                    <td>${product.categoryId}</td>
                                    <td>
                                        <span class="badge bg-${product.status ? 'success' : 'danger'}">
                                            ${product.status ? 'Active' : 'Inactive'}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="products?action=edit&id=${product.id}" class="btn btn-sm btn-warning" data-bs-toggle="tooltip" title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="products?action=delete&id=${product.id}" class="btn btn-sm btn-danger" data-bs-toggle="tooltip" title="Delete" onclick="return confirm('Are you sure you want to delete this product?');">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Pagination -->
                <div class="d-flex justify-content-center mt-3">
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="products?page=${currentPage - 1}">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="products?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="products?page=${currentPage + 1}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../design/adminFooter.jsp"/>