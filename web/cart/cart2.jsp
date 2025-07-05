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
            .cart-container {
                max-width: 900px;
                margin: 40px auto 40px auto;
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 2px 16px rgba(0,0,0,0.07);
                padding: 32px 18px 24px 18px;
            }
            .cart-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                background: #fff;
                border-radius: 10px;
                overflow: hidden;
                margin-bottom: 18px;
            }
            .cart-table th {
                background: #009045;
                color: #fff;
                font-weight: 600;
                padding: 12px 8px;
                font-size: 1.08rem;
                border-right: 1px solid #e0e0e0;
            }
            .cart-table th:last-child {
                border-right: none;
            }
            .cart-table td {
                padding: 10px 8px;
                border-bottom: 1px solid #f0f0f0;
                font-size: 1rem;
                text-align: center;
            }
            .cart-table tr:last-child td {
                border-bottom: none;
            }
            .cart-table tr:hover {
                background: #f6fff7;
            }
            .cart-btn {
                padding: 7px 18px;
                border: none;
                border-radius: 5px;
                font-size: 1rem;
                font-weight: 600;
                cursor: pointer;
                margin: 2px 2px;
                transition: background 0.2s, color 0.2s;
            }
            .btn-update {
                background: #1976d2;
                color: #fff;
            }
            .btn-update:hover {
                background: #1256a3;
            }
            .btn-remove {
                background: #e53935;
                color: #fff;
            }
            .btn-remove:hover {
                background: #b71c1c;
            }
            .btn-checkout {
                background: #009045;
                color: #fff;
                margin-left: 10px;
            }
            .btn-checkout:hover {
                background: #007a38;
            }
            .btn-continue {
                background: #fff;
                color: #009045;
                border: 2px solid #009045;
                margin-right: 10px;
            }
            .btn-continue:hover {
                background: #009045;
                color: #fff;
            }
            .cart-total {
                text-align: right;
                font-size: 1.3rem;
                font-weight: bold;
                color: #009045;
                margin: 18px 0 18px 0;
            }
            .cart-title {
                text-align: center;
                font-size: 2rem;
                font-weight: bold;
                margin-bottom: 18px;
                color: #222;
            }
            .cart-error {
                color: #e53935;
                background: #fff0f0;
                border: 1px solid #e53935;
                border-radius: 5px;
                padding: 10px 0;
                font-weight: 600;
                margin-bottom: 18px;
                text-align: center;
            }
            @media (max-width: 700px) {
                .cart-container {padding: 8px;}
                .cart-table th, .cart-table td {font-size: 0.95rem; padding: 7px 2px;}
                .cart-title {font-size: 1.3rem;}
                .cart-total {font-size: 1.05rem;}
            }
        </style>
        <link rel="stylesheet" href="../css/home.css" />
    </head>
    <body>
        <meta charset="UTF-8">
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>
        <div class="cart-container">
        <div class="cart-title">Giỏ hàng của bạn</div>
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="cart-error">
                ${sessionScope.errorMessage}
            </div>
            <!-- Sau khi hiển thị, xóa thông báo lỗi khỏi session -->
            <c:remove var="errorMessage" scope="session" />
        </c:if>
            
        <table class="cart-table">
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
                                <input type="submit" value="Cập nhật" class="cart-btn btn-update" />
                            </form>
                        </td>
                        <td>$${entry.value.product.price * entry.value.quantity}</td>
                        <td>
                            <form action="<%= request.getContextPath()%>/carts" method="post">
                                <input type="hidden" name="productId" value="${entry.key}" />
                                <input type="hidden" name="action" value="remove" />
                                <input type="submit" value="Xóa" class="cart-btn btn-remove" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="cart-total">Tổng cộng: $${cart.totalCost}</div>

        <div style="text-align:center; margin-top: 18px;">
            <a href="../home" class="cart-btn btn-continue">Tiếp tục mua hàng</a>
            <form action="<%= request.getContextPath()%>/CheckoutServlet" method="post" style="display:inline;">
                <input type="submit" value="Thanh toán" class="cart-btn btn-checkout" />
            </form>
        </div>
        </div>
    </body>
</html>
