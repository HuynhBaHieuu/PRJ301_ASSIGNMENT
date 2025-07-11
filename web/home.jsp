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
        <link rel="stylesheet" href="css/footer.css"/>
        <style>
            /* Thêm CSS cho modal upload */
            .upload-modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.7);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 10% auto;
                padding: 20px;
                width: 60%;
                max-width: 500px;
                position: relative;
                border-radius: 8px;
            }

            .close {
                position: absolute;
                top: 10px;
                right: 15px;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            #fileInput {
                margin: 15px 0;
                width: 100%;
            }

            #uploadButton {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                margin-top: 10px;
                border-radius: 4px;
            }

            #previewContainer {
                margin-top: 15px;
                text-align: center;
                display: none;
            }

            #previewImage {
                max-width: 100%;
                max-height: 300px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home" class="logo-link">
                    <img src="image/logo.png" alt="alt"/>
                    <span>Nông Sản Tương Lai</span>
                    <a/>
            </div>
            <div class="search-bar">
                <form action="search" method="get">
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

                <%                    User currentUser = (User) session.getAttribute("user");
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

        <!-- Modal upload file -->
        <div id="uploadModal" class="upload-modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h3>Tải lên ảnh sản phẩm</h3>
                <input type="file" id="fileInput" accept="image/png, image/jpeg, image/jpg" />
                <button id="uploadButton">Tải lên và nhận diện</button>
                <div id="previewContainer">
                    <img id="previewImage" />
                </div>
            </div>
        </div>
        <!-- Navbar -->
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
    </div>

    <!-- Body Content -->
    <div class="main-content">
        <!-- Sidebar -->
        <div class="sidebar">   
            <ul>
                <c:forEach var="category" items="${categories}">
                    <li>
                        <a href="category-products?categoryId=${category.categoryId}">${category.name}</a>
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
    </div>
    <!-- Footer -->

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
    <script>
        // JavaScript xử lý upload file
        document.addEventListener('DOMContentLoaded', function () {
            const modal = document.getElementById('uploadModal');
            const uploadBtn = document.getElementById('uploadImageButton');
            const closeBtn = document.querySelector('.close');
            const fileInput = document.getElementById('fileInput');
            const uploadButton = document.getElementById('uploadButton');
            const previewContainer = document.getElementById('previewContainer');
            const previewImage = document.getElementById('previewImage');

            // Mở modal khi click vào nút upload
            uploadBtn.addEventListener('click', function () {
                modal.style.display = 'block';
            });

            // Đóng modal
            closeBtn.addEventListener('click', function () {
                modal.style.display = 'none';
                previewContainer.style.display = 'none';
                fileInput.value = '';
            });

            // Khi chọn file, hiển thị preview
            fileInput.addEventListener('change', function (e) {
                if (e.target.files && e.target.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        previewImage.src = e.target.result;
                        previewContainer.style.display = 'block';
                    };
                    reader.readAsDataURL(e.target.files[0]);
                }
            });

            // Xử lý khi nhấn nút tải lên
            uploadButton.addEventListener('click', function () {
                if (!fileInput.files || !fileInput.files[0]) {
                    alert('Vui lòng chọn file ảnh.');
                    return;
                }

                const file = fileInput.files[0];

                // Giới hạn kích thước file (2MB)
                if (file.size > 2 * 1024 * 1024) {
                    alert('Ảnh quá lớn. Vui lòng chọn ảnh < 2MB.');
                    return;
                }

                const reader = new FileReader();

                reader.onload = function (e) {
                    const imageData = e.target.result;

                    // Hiển thị loading
                    uploadButton.disabled = true;
                    uploadButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';

                    fetch('${pageContext.request.contextPath}/upload-image', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({image: imageData})
                    })
                            .then(response => {
                                uploadButton.disabled = false;
                                uploadButton.innerHTML = 'Tải lên và nhận diện';

                                if (!response.ok) {
                                    return response.text().then(text => {
                                        try {
                                            const errorData = JSON.parse(text);
                                            throw new Error(errorData.error || 'Lỗi không xác định');
                                        } catch {
                                            throw new Error(text || `Lỗi HTTP: ${response.status}`);
                                        }
                                    });
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.error) {
                                    throw new Error(data.error);
                                }

                                // Chuyển hướng với tham số category
                                window.location.href = 'searchAI?category=' + encodeURIComponent(data.category);
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                alert('Lỗi: ' + error.message);
                            });
                };

                reader.readAsDataURL(file);
            });

            // Đóng modal khi click bên ngoài
            window.addEventListener('click', function (event) {
                if (event.target === modal) {
                    modal.style.display = 'none';
                    previewContainer.style.display = 'none';
                    fileInput.value = '';
                }
            });
        });
    </script>
</body>
</html>