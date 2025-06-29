<%-- 
    Document   : navbar
    Created on : Jun 15, 2025, 11:08:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="sub-header">
            <div class="menu-toggle"><i class="fas fa-bars"></i><strong> DANH MỤC SẢN PHẨM</strong></div>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/productItem/allProducts.jsp">SẢN PHẨM</a>
                <a href="${pageContext.request.contextPath}/productItem/checkOrder.jsp">KIỂM TRA ĐƠN HÀNG</a>
                <a href="${pageContext.request.contextPath}/productItem/blog.jsp">BLOG</a>
                <a href="${pageContext.request.contextPath}/productItem/shippingPolicy.jsp">CHÍNH SÁCH VẬN CHUYỂN</a>
                <a href="${pageContext.request.contextPath}/productItem/discountPolicy.jsp">CHÍNH SÁCH CHIẾT KHẤU</a>
                <a href="${pageContext.request.contextPath}/productItem/contact.jsp">LIÊN HỆ</a>
                <a href="${pageContext.request.contextPath}/productItem/comment.jsp">GÓP Ý</a>
            </div>
        </div>
</html>
