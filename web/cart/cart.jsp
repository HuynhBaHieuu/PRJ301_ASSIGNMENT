<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Giỏ hàng</title>
</head>
<body>
    <h2>Giỏ hàng của bạn</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Tổng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.product.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.product.price * item.quantity}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <form action="<%= request.getContextPath() %>/CheckoutServlet" method="post">
        <input type="submit" value="Tiến hành thanh toán">
    </form>
</body>
</html>
