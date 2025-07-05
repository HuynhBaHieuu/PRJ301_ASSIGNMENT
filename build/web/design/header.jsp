<%-- 
    Document   : head.jsp
    Created on : Jun 15, 2025, 11:06:11 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Header -->
    <div class="header">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/home" class="logo-link">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="alt"/>
                <span>Nông Sản Tương Lai</span>
            </a>
        </div>
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" name="query" placeholder="Tìm sản phẩm..." />
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>
        <div class="header-icons">
            <div class="header-contact">
                <div>
                    <img src="//theme.hstatic.net/1000269461/1000985512/14/phone-icon.png?v=2157" width="30" height="30" class="mr-3 align-self-center" alt="phone-icon"> 
                    <div>
                        Gọi mua hàng<br>
                        0829495069
                    </div>
                </div>
                <div>
                    <img src="//theme.hstatic.net/1000269461/1000985512/14/address-icon.png?v=2157" width="30" height="30" class="mr-3 align-self-center" alt="phone-icon"> 
                    <div>
                        Hệ thống<br>
                        cửa hàng
                    </div>
                </div>
            </div>

            <%
                User currentUser = (User) session.getAttribute("user");
            %>
            <a href="<%= (currentUser != null) ? (request.getContextPath() + "/editProfile") : (request.getContextPath() + "/login.jsp")%>" style="text-decoration: none; color: white;">                     
                <div>
                    <img src="//theme.hstatic.net/1000269461/1000985512/14/account-icon.png?v=2157" width="30" height="30" alt="account_icon" class="mr-3 align-self-center">
                    <div class="account">
                        Tài khoản<br>
                        <%= (currentUser != null) ? currentUser.getUsername() : "Đăng nhập"%>
                    </div>
                </div>
            </a>

            <div class="header-cart"><img src="//theme.hstatic.net/1000269461/1000985512/14/cart-icon.png?v=2157" width="30" height="30" alt="cart_icon">
                <a href="<%= request.getContextPath()%>/cart/cart2.jsp">Giỏ hàng</a><br><br>
            </div>
            <div class="logout"><a href="${pageContext.request.contextPath}/logout" style="font-size: 25px; color:white;">Đăng xuất</a></div>
        </div>
    </div>
</html>
