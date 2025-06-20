
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.User" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nông Sản Tương Lai</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/logo.png">
        <link rel="stylesheet" href="css/home.css" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <div class="logo"><img src="image/logo.png" alt="alt"/><span>Nông Sản Tương Lai</span></div>
            <div class="search-bar">
                <form action="search" method="get">
                    <input type="text" name="query" placeholder="Tìm sản phẩm..." />
                    <button type="submit"><i class="fas fa-search"></i></button>
                </form>
            </div>
            <div class="header-icons">
                <div><img src="//theme.hstatic.net/1000269461/1000985512/14/phone-icon.png?v=2157" width="30" height="30" class="mr-3 align-self-center" alt="phone-icon"> 
                    <div>
                        Gọi mua hàng<br>
                        0829495069
                    </div>
                </div>
                <div><img src="//theme.hstatic.net/1000269461/1000985512/14/address-icon.png?v=2157" width="30" height="30" class="mr-3 align-self-center" alt="phone-icon"> 
                    <div>
                        Hệ thống<br>
                        cửa hàng
                    </div>
                </div>
                <div><img src="//theme.hstatic.net/1000269461/1000985512/14/account-icon.png?v=2157" width="30" height="30" alt="account_icon" class="  mr-3 align-self-center"> 
                    <div>
                        Tài khoản<br>
                        Đăng nhập
                    </div>
                </div>
                <div class="header-cart"><img src="//theme.hstatic.net/1000269461/1000985512/14/cart-icon.png?v=2157" width="30" height="30" alt="cart_icon">
                    <a href="<%= request.getContextPath() %>/cart/cart2.jsp">Giỏ hàng</a><br><br>
                </div>
                <div><a href="logout" style="font-size: 25px; color:white;">Logout</a></div>
            </div>
        </div>

        <!-- Navbar -->
        <div class="sub-header">
            <div class="menu-toggle"><i class="fas fa-bars"></i><strong> DANH MỤC SẢN PHẨM</strong></div>
            <div class="nav-links">
                <a href="#">SẢN PHẨM</a>
                <a href="#">KIỂM TRA ĐƠN HÀNG</a>
                <a href="#">BLOG</a>
                <a href="#">CHÍNH SÁCH VẬN CHUYỂN</a>
                <a href="#">CHÍNH SÁCH CHIẾT KHẤU</a>
                <a href="#">LIÊN HỆ</a>
                <a href="#">GÓP Ý</a>
            </div>
        </div>

        <!-- Body Content -->
        <div class="main-content">
            <!-- Sidebar -->
            <div class="sidebar">   
                <ul>
                    <c:forEach var="category" items="${categories}">
                        <li>
                            <a href="home?categoryId=${category.categoryId}">${category.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <!-- Banner and Highlights -->
            <div class="banner-area">
                <div class="main-banner">

                    <img src="image/mainbanner.png" alt="mainbanner" class="banner-main"/>
                    <img src="image/phan.png" alt="banner-phan" class="banner-phan"/>


                    <h2>SẢN PHẨM CHÍNH HÃNG<br>ĐẢM BẢO CHẤT LƯỢNG</h2>
                </div>
                <div class="rightimg-banner">
                    <img src="image/hatgiong9k.jpg" alt="hatgiong9k">
                    <img src="image/tuvan.jpg" alt="tuvan">
                </div>

            </div>
            <!--
            <div class="features">
                    <div class="feature-box">Hạt giống đồng giá 9K</div>
                    <div class="feature-box">Sản phẩm chất lượng</div>
                    <div class="feature-box">Tư vấn miễn phí</div>
                </div>
            -->
        </div>
        <div class="bottom-main-content">
            <div>
                <img src="image/hatgiong.jpg" alt="hatgiong">
            </div>
            <div>
                <img src="image/raucu.png" alt="raucu">
                <p>CHIẾT KHẤU LÊN ĐẾN <br> <strong>18%</strong> <br> CHO ĐƠN SỈ</p>
            </div>    
            <div>
                <img src="image/rau.jpg" alt="rau">
                <p>GIẢM TRỰC TIẾP TRÊN MỖI SẢN PHẨM</p>
            </div>   

            <img src="image/hoa.jpg" alt="hoa">

        </div>
        
        <div class="products">
            <c:forEach var="entry" items="${groupedProducts}">
                <h2 style="margin-top: 40px;">${entry.key.name}</h2>

                <div class="products">
                    <c:forEach var="product" items="${entry.value}">
                        <div class="product">
                            <img src="image/${product.imageUrl}" alt="${product.name}">
                            <h4>${product.name}</h4>
                            <p>Giá: ${product.price}</p>
                            <p>${product.description}</p>
                            <a href="product/productDetail.jsp?id=${product.id}">Chi tiết</a>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
    </body>
</html>