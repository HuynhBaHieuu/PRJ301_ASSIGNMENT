<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Kết quả tìm kiếm - Nông Sản Tương Lai</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/logo.png">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <style>
            /* CSS riêng cho trang kết quả tìm kiếm */
            .search-result-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .search-header {
                text-align: center;
                margin: 30px 0;
                padding: 15px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .search-header h2 {
                color: #333;
                font-size: 24px;
                margin-bottom: 10px;
            }

            .search-category {
                color: #009045;
                font-weight: bold;
            }

            .products-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 20px;
                padding: 20px 0;
            }

            .product-card {
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 15px;
                transition: transform 0.3s, box-shadow 0.3s;
                background-color: white;
                display: flex;
                flex-direction: column;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .product-card img {
                width: 100%;
                height: 200px;
                object-fit: contain;
                border-radius: 4px;
                margin-bottom: 15px;
            }

            .product-card h4 {
                font-size: 18px;
                margin: 10px 0;
                color: #333;
                flex-grow: 1;
            }

            .product-card p {
                margin: 5px 0;
                color: #666;
            }

            .product-price {
                color: #e74c3c;
                font-weight: bold;
                font-size: 18px;
            }

            .product-card a {
                display: block;
                text-align: center;
                padding: 8px 15px;
                background-color: #009045;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                margin-top: 10px;
                transition: background-color 0.3s;
            }

            .product-card a:hover {
                background-color: #007a38;
            }

            .no-results {
                text-align: center;
                padding: 50px;
                grid-column: 1 / -1;
            }

            .no-results p {
                font-size: 18px;
                color: #666;
            }

            .try-again {
                margin-top: 20px;
                text-align: center;
            }

            .try-again a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #009045;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                margin: 0 5px;
            }

            .ai-result {
                background-color: #e8f5e9;
                padding: 10px;
                border-radius: 8px;
                margin-bottom: 15px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <!-- Header (giống trang chủ) -->
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
                <button id="uploadImageButton" style="background: none; border: none; cursor: pointer; color: white; font-size: 18px; margin-left: 5px;">
                    <i class="fas fa-camera"></i>
                </button>
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
                <div class="logout"><a href="logout" style="font-size: 25px; color:white;">Đăng xuất</a></div>
            </div>
        </div>

        <!-- Navbar (giống trang chủ) -->
        <div class="sub-header">
            <div class="menu-toggle"><i class="fas fa-bars"></i><strong> DANH MỤC SẢN PHẨM</strong></div>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/sp">SẢN PHẨM</a>
                <a href="${pageContext.request.contextPath}/productItem/checkOrder.jsp">KIỂM TRA ĐƠN HÀNG</a>
                <a href="${pageContext.request.contextPath}/productItem/blog.jsp">BLOG</a>
                <a href="${pageContext.request.contextPath}/productItem/shippingPolicy.jsp">CHÍNH SÁCH VẬN CHUYỂN</a>
                <a href="${pageContext.request.contextPath}/productItem/discountPolicy.jsp">CHÍNH SÁCH CHIẾT KHẤU</a>
                <a href="${pageContext.request.contextPath}/productItem/contact.jsp">LIÊN HỆ</a>
                <a href="${pageContext.request.contextPath}/productItem/comment.jsp">GÓP Ý</a>
            </div>
        </div>

        <!-- Nội dung chính của trang kết quả -->
        <div class="search-result-container">
            <div class="search-header">
                <!-- Hiển thị kết quả tìm kiếm hoặc danh mục AI -->
                <c:choose>
                    <c:when test="${not empty searchQuery}">
                        <h2>Kết quả tìm kiếm cho: <span class="search-category">${searchQuery}</span></h2>
                        </c:when>
                        <c:when test="${not empty category}">
                        <h2>Sản phẩm gợi ý trong danh mục: <span class="search-category">${category}</span></h2>
                        <div class="ai-result">
                            <i class="fas fa-file-image"></i> Kết quả từ nhận diện hình ảnh
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h2>Sản phẩm gợi ý</h2>
                    </c:otherwise>
                </c:choose>
                <c:if test="${not empty error}">
                    <div class="error-message" style="color: red; padding: 10px; background: #ffecec; border-radius: 4px; margin-top: 10px;">
                        <i class="fas fa-exclamation-triangle"></i> ${error}
                    </div>
                </c:if>
            </div>

            <div class="products-grid">
                <c:forEach var="product" items="${products}">
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/image/${product.imageUrl}" alt="${product.name}">
                        <h4>${product.name}</h4>
                        <p class="product-description">${product.description}</p>
                        <p class="product-price">${product.price} VND</p>
                        <a href="${pageContext.request.contextPath}/product/productDetail.jsp?id=${product.id}">
                            <i class="fas fa-shopping-cart"></i> Chi tiết
                        </a>
                    </div>
                </c:forEach>

                <c:if test="${empty products}">
                    <div class="no-results">
                        <p>Không tìm thấy sản phẩm nào phù hợp.</p>
                        <div class="try-again">
                            <a href="${pageContext.request.contextPath}/home">
                                <i class="fas fa-home"></i> Quay về trang chủ
                            </a>
                            <a href="#" onclick="history.back()">
                                <i class="fas fa-arrow-left"></i> Thử lại
                            </a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Footer (giống trang chủ) -->
        <div class="footer-top">
            <div class="footer-top-sub"> 
                <img alt="Hàng hóa chất lượng" src="https://file.hstatic.net/1000269461/file/hiclipart.com_63eb43bb31374cc4a8d2a7409fe2c261_icon.png" width="30" height="30"> 
                <h3>HÀNG CHẤT LƯỢNG</h3>
            </div>

            <div class="footer-top-sub" id="footer-top-center">
                <img alt="Đa dạng sản phẩm" src="https://file.hstatic.net/1000269461/file/empty-white-box_98aaa9a247be44c5b40772f9ba9761c1_icon.png" width="30" height="30">  
                <h3>ĐA DẠNG HÀNG HÓA</h3>
            </div>

            <div class="footer-top-sub">
                <img alt="Miễn phí tư vấn kỹ thuật" src="https://file.hstatic.net/1000269461/file/pngitem_5234004_7793937ab76143208cb528e2884c08e8_icon.png" width="30" height="30"> 
                <h3>MIỄN PHÍ TƯ VẤN KỸ THUẬT</h3>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="footer-bottom-sub">
                <h3 style="text-align: left;">HỆ THỐNG CỬA HÀNG</h3>
                <div style="display: flex;gap:5px;">
                    <img src="https://uxwing.com/wp-content/themes/uxwing/download/location-travel-map/map-pin-icon.svg" width="15" height="15" class="mr-3 align-self-center" alt="location-icon"> 
                    <div>
                        <p style="font-size: 17px;margin-top: 0;"><strong>Địa chỉ:</strong></p>
                        <p style="font-size: 17px;">CH Quận Hải Châu: 227A Núi Thành, Phường Hòa Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng</p>
                        <strong style="font-size: 17px;">GIỜ MỞ CỬA</strong>
                        <span style="display:block;font-size: 17px;margin-top: 5px;">⏰ Thứ 2 - Chủ Nhật: 7:30 - 18:00</span>
                    </div>
                </div>				

                <div style="display: flex;gap:5px;margin-top: 20px;">
                    <img src="https://cdn-icons-png.flaticon.com/64/597/597177.png" width="15" height="15" class="mr-3 align-self-center" alt="phone-icon"> 
                    <p style="font-size: 17px;margin-top: 0;"><strong>Số điện thoại:</strong> 0829 495 069</p>
                </div>
                <div style="display: flex;gap:5px;">
                    <img src="https://cdn-icons-png.flaticon.com/64/732/732200.png" width="15" height="15" class="mr-3 align-self-center" alt="email-icon">
                    <p style="font-size: 17px;margin-top: 0;"><strong>Email:</strong> huynhbahieu456@gmail.com</p>
                </div>
                <a rel="nofollow" target="_blank" href="http://online.gov.vn/Home/WebDetails/40165" title="Logo Bộ Công Thương">
                    <img src="//theme.hstatic.net/1000269461/1000985512/14/logo_bct.png?v=2164" width="104" height="40" alt="Logo Bộ Công Thương">
                </a>
            </div>

            <div class="footer-bottom-sub">
                <h3 class="title-menu clicked">
                    HỖ TRỢ KHÁCH HÀNG <i class="fa fa-angle-down d-md-none d-inline-block"></i>
                </h3>
                <ul class="list-menu toggle-mn" style="line-height: 30px;list-style: none;padding-left: 0;">
                    <li class="li_menu">
                        <a class="link" href="" title="CHÍNH SÁCH &amp; QUY ĐỊNH CHUNG">CHÍNH SÁCH &amp; QUY ĐỊNH CHUNG</a>
                    </li>
                    <li class="li_menu">
                        <a class="link" href="" title="QUY ĐỊNH VÀ HÌNH THỨC THANH TOÁN">QUY ĐỊNH VÀ HÌNH THỨC THANH TOÁN</a>
                    </li>
                    <li class="li_menu">
                        <a class="link" href="" title="CHÍNH SÁCH BẢO MẬT THÔNG TIN">CHÍNH SÁCH BẢO MẬT THÔNG TIN</a>
                    </li>
                    <li class="li_menu">
                        <a class="link" href="" title="CHÍNH SÁCH VẬN CHUYỂN, GIAO NHẬN">CHÍNH SÁCH VẬN CHUYỂN, GIAO NHẬN</a>
                    </li>
                    <li class="li_menu">
                        <a class="link" href="" title="CHÍNH SÁCH TRẢ HÀNG - HOÀN TIỀN">CHÍNH SÁCH TRẢ HÀNG - HOÀN TIỀN</a>
                    </li>
                    <li class="li_menu">
                        <a class="link" href="" title="CHÍNH SÁCH KHÁCH HÀNG THÂN THIẾT">CHÍNH SÁCH KHÁCH HÀNG THÂN THIẾT</a>
                    </li>
                </ul>
            </div>

            <div class="footer-bottom-sub">
                <h3>
                    TỔNG ĐÀI HỖ TRỢ MIỄN PHÍ 
                </h3>
                <p>
                    <span><b>GỌI MUA HÀNG</b><br>
                        <b><a href="tel:0829495069" style="color:#009b49; font-size:20px;">0829 495 069</a></b><br>
                        Thứ 2 - Chủ Nhật: 8:00 - 17:00
                        <br><br>
                        <b>GỌI GÓP Ý - KHIẾU NẠI</b> <br>
                        <b><a href="tel:0906800386" style="color:#009b49; font-size:20px;">0905 033 546</a></b><br>
                        Thứ 2 - Thứ 6: 08:00 - 17:00 | Thứ 7: 08:00 - 12:00
                        <br><br></span>
                </p>
                <h4>PHƯƠNG THỨC THANH TOÁN</h4>
                <div>
                    <a href="" target="_blank" title="PHƯƠNG THỨC THANH TOÁN">
                        <img src="//theme.hstatic.net/1000269461/1000985512/14/footer_trustbadge.jpg?v=2164" alt="" width="246" height="56">
                    </a>
                </div>
            </div>  
        </div>

        <div id="copyright" style="text-align: center;font-size:20px;padding:20px;background-color: #FEFA8E;">
            <span class="wsp">
                © Bản quyền thuộc về Nông Sản Tương Lai - Công ty Cổ Phần P3T 
            </span>
        </div>
        <jsp:include page="chatbot/chatbot.jsp" />
    </body>
</html>