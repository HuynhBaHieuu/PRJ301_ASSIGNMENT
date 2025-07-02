<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../design/adminHeader.jsp"/>
<div class="container mt-5">
    <h2>Order Detail - ID: ${order.id}</h2>
    <p>User: ${order.userId}</p>
    <p>Date: ${order.orderDate}</p>
    <p>Total: ${order.totalPrice}</p>
    <p>Status: <c:choose><c:when test="${order.status == 1 || order.status == '1'}">Paid</c:when><c:otherwise>Pending</c:otherwise></c:choose></p>
    <h4>Order Items</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${orderItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price}</td>
                    <td>${item.subtotal}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="orders" class="btn btn-secondary">Back to Orders</a>
</div>
<jsp:include page="../design/adminFooter.jsp"/> 