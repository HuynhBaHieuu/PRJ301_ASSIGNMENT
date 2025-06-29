<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Nông Sản Tương Lai</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/logo.png">
        <link rel="stylesheet" href="css/home.css" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/footer.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <title>Shopping Cart</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                text-align: center;
            }
            th, td {
                padding: 8px;
                border: 1px solid #ccc;
            }
            .btn {
                padding: 5px 10px;
                border: none;
                color: white;
                cursor: pointer;
            }
            .btn-update {
                background-color: blue;
            }
            .btn-remove {
                background-color: red;
            }
            .btn-checkout {
                background-color: green;
                margin-top: 10px;
            }
        </style>
        <link rel="stylesheet" href="../css/home.css" />
    </head>
    <body>
        <meta charset="UTF-8">
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>
        <h2 style="text-align:center;">Shopping Cart</h2>
        
        <c:if test="${not empty sessionScope.errorMessage}">
            <div style="color:red; font-weight:bold; margin-bottom:10px;">
                ${sessionScope.errorMessage}
            </div>
            <!-- Sau khi hiển thị, xóa thông báo lỗi khỏi session -->
            <c:remove var="errorMessage" scope="session" />
        </c:if>
            
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="entry" items="${cart.items}">
                    <tr>
                        <td>${entry.key}</td>
                        <td>${entry.value.product.name}</td>
                        <td>$${entry.value.product.price}</td>
                        <td>
                            <form action="<%= request.getContextPath()%>/carts" method="post" style="display:inline;">
                                <input type="number" name="quantity" value="${entry.value.quantity}" min="1" />
                                <input type="hidden" name="productId" value="${entry.key}" />
                                <input type="hidden" name="action" value="update" />
                                <input type="submit" value="Update" class="btn btn-update" />
                            </form>
                        </td>
                        <td>$${entry.value.product.price * entry.value.quantity}</td>
                        <td>
                            <form action="<%= request.getContextPath()%>/carts" method="post">
                                <input type="hidden" name="productId" value="${entry.key}" />
                                <input type="hidden" name="action" value="remove" />
                                <input type="submit" value="Remove" class="btn btn-remove" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h3 style="text-align:right; margin-right: 20px;">Total Cost: $${cart.totalCost}</h3>

        <div style="text-align:center;">
            <a href="../home"><button class="btn">Continue Shopping</button></a>
            <form action="<%= request.getContextPath()%>/CheckoutServlet" method="post" style="display:inline;">
                <input type="submit" value="Checkout" class="btn btn-checkout" />
            </form>
        </div>

    </body>
</html>
