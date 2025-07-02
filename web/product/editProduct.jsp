<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="active" value="products" scope="request"/>
<jsp:include page="../design/adminHeader.jsp"/>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark">
                    <h3 class="card-title mb-0"><i class="fas fa-edit"></i> Edit Product</h3>
                </div>
                <div class="card-body">
                    <form method="post" action="products?action=edit">
                        <table class="table table-borderless mb-0">
                            <caption class="mb-3"><h4 class="text-center">Edit Product</h4></caption>
                            <c:choose>
                                <c:when test="${not empty product}">
                                    <input type="hidden" name="id" value="${product.id}" />
                                </c:when>
                                <c:otherwise>
                                    <input type="hidden" name="id" value="${param.id}" />
                                </c:otherwise>
                            </c:choose>
                            <tr>
                                <th><label for="name" class="form-label">Product Name:</label></th>
                                <td><input type="text" class="form-control" name="name" id="name" size="45" value="<c:out value='${product.name}'/>" required /></td>
                            </tr>
                            <tr>
                                <th><label for="price" class="form-label">Price:</label></th>
                                <td><input type="number" class="form-control" name="price" step="0.01" id="price" value="<c:out value='${product.price}'/>" required /></td>
                            </tr>
                            <tr>
                                <th><label for="description" class="form-label">Description:</label></th>
                                <td><input type="text" class="form-control" name="description" id="description" size="45" value="<c:out value='${product.description}'/>" /></td>
                            </tr>
                            <tr>
                                <th><label for="stock" class="form-label">Stock:</label></th>
                                <td><input type="number" class="form-control" name="stock" id="stock" value="<c:out value='${product.stock}'/>" required /></td>
                            </tr>
                            <tr>
                                <th><label for="importDate" class="form-label">Import Date:</label></th>
                                <td><input type="date" class="form-control" name="importDate" id="importDate" value="<c:out value='${product.importDate}'/>" required /></td>
                            </tr>
                            <tr>
                                <th><label for="status" class="form-label">Status:</label></th>
                                <td><input type="checkbox" class="form-check-input" name="status" id="status" <c:if test="${product.status}">checked</c:if> /> <label for="status" class="form-check-label">Active</label></td>
                            </tr>
                            <tr>
                                <th><label for="categoryId" class="form-label">Category ID:</label></th>
                                <td><input type="number" class="form-control" name="categoryId" id="categoryId" value="<c:out value='${product.categoryId}'/>" required /></td>
                            </tr>
                            <tr>
                                <th><label for="imageUrl" class="form-label">ImageURL:</label></th>
                                <td>
                                    <input type="text" class="form-control" name="imageUrl" id="imageUrl" value="<c:out value='${product.imageUrl}'/>" required />
                                    <c:if test="${not empty product.imageUrl}">
                                        <div class="mt-2">
                                            <img src="${product.imageUrl}" alt="${product.name}" style="max-width: 200px; max-height: 200px;" class="img-thumbnail">
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Save</button>
                                    <a href="products" class="btn btn-secondary ms-2"><i class="fas fa-arrow-left"></i> Back to List</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../design/adminFooter.jsp"/>
