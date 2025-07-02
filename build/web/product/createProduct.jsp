<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="active" value="products" scope="request"/>
<jsp:include page="../design/adminHeader.jsp"/>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0"><i class="fas fa-plus"></i> Add New Product</h3>
                </div>
                <div class="card-body">
                    <form method="post" action="products?action=create">
                        <table class="table table-borderless mb-0">
                            <caption class="mb-3"><h4 class="text-center">Add New Product</h4></caption>
                            <tr>
                                <th><label for="name" class="form-label">Product Name:</label></th>
                                <td><input type="text" class="form-control" name="name" id="name" size="45" required/></td>
                            </tr>
                            <tr>
                                <th><label for="price" class="form-label">Price:</label></th>
                                <td><input type="number" step="0.01" class="form-control" name="price" id="price" required/></td>
                            </tr>
                            <tr>
                                <th><label for="description" class="form-label">Description:</label></th>
                                <td><input type="text" class="form-control" name="description" id="description" size="45"/></td>
                            </tr>
                            <tr>
                                <th><label for="stock" class="form-label">Stock:</label></th>
                                <td><input type="number" class="form-control" name="stock" id="stock" required/></td>
                            </tr>
<!--                            <tr>
                                <th><label for="importDate" class="form-label">Import Date:</label></th>
                                <td><input type="date" class="form-control" name="importDate" id="importDate" required/></td>
                            </tr>-->
                            <tr>
                                <th><label for="status" class="form-label">Status:</label></th>
                                <td><input type="checkbox" class="form-check-input" name="status" id="status" value="1" checked/> <label for="status" class="form-check-label">Active</label></td>
                            </tr>
                            <tr>
                                <th><label for="categoryId" class="form-label">CategoryID:</label></th>
                                <td><input type="number" class="form-control" name="categoryId" id="categoryId" required/></td>
                            </tr>
                            <tr>
                                <th><label for="imageUrl" class="form-label">ImageURL:</label></th>
                                <td><input type="text" class="form-control" name="imageUrl" id="imageUrl" required/></td>
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
