<%-- 
    Document   : head.jsp
    Created on : Jun 15, 2025, 11:06:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Header -->
        <div class="header">
            <div class="logo"><img src="../image/logo.png" alt="alt"/><span>Nông Sản Tương Lai</span></div>
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
                    <span>Giỏ hàng</span>
                </div>
                <div><a href="logout" style="font-size: 25px; color:white;">Logout</a></div>
            </div>
        </div>
</html>
