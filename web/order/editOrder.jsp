<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../design/adminHeader.jsp"/>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4>Edit Order</h4>
                </div>
                <div class="card-body">
                    <form action="orders" method="post">
                        <input type="hidden" name="id" value="${order.id}" />
                        <div class="mb-3">
                            <label for="userId" class="form-label">User</label>
                            <select class="form-select" name="userId" id="userId">
                                <c:forEach var="user" items="${users}">
                                    <option value="${user.id}" ${user.id == order.userId ? 'selected' : ''}>
                                        ${user.username}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="totalPrice" class="form-label">Total Price</label>
                            <input type="number" step="0.01" class="form-control" name="totalPrice" id="totalPrice" value="${order.totalPrice}" required />
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" name="status" id="status">
                                <option value="0" ${order.status == 0 || order.status == '0' ? 'selected' : ''}>Pending</option>
                                <option value="1" ${order.status == 1 || order.status == '1' ? 'selected' : ''}>Paid</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Save</button>
                        <a href="orders" class="btn btn-secondary">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../design/adminFooter.jsp"/> 