<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="active" value="categories" scope="request"/>
<jsp:include page="../design/adminHeader.jsp"/>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark">
                    <h3 class="card-title mb-0"><i class="fas fa-edit"></i> Edit Category</h3>
                </div>
                <div class="card-body">
                    <form method="post" action="categories?action=edit">
                        <c:choose>
                            <c:when test="${not empty category}">
                                <input type="hidden" name="id" value="${category.categoryId}" />
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="id" value="${param.categoryId}" />
                            </c:otherwise>
                        </c:choose>
                        <div class="mb-3">
                            <label for="name" class="form-label">Category Name:</label>
                            <input type="text" class="form-control" name="name" id="name" value="<c:out value='${category.name}'/>" required />
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Save</button>
                            <a href="categories" class="btn btn-secondary ms-2"><i class="fas fa-arrow-left"></i> Back to List</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../design/adminFooter.jsp"/>
