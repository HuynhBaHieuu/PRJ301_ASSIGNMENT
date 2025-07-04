<%-- 
    Document   : checkOrder
    Created on : Jun 22, 2025, 10:27:28 AM
    Author     : phung
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../design/header.jsp" %>
<%@ include file="../design/navbar.jsp" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiểm tra đơn hàng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/checkOrder.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    </head>

    <body>
        <!-- Nhúng script của Google reCAPTCHA -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <section class="breadcrumb-section">
            <div class="breadcrumb-container">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><span class="divider">/</span><span class="current">Kiểm tra đơn hàng</span></li>
                </ul>
            </div>
        </section>

        <section class="checkOrder-section">
            <div class="checkOrder-container">
                <ul class="checkOrder">
                    <li>Kiểm tra đơn hàng</li>
                </ul>
            </div>
        </section> 
        </section>

                    
        <h1>Kiểm tra đơn hàng</h1>            
        <div class="checkOrder-section">

            <div class="main-checkOrder">
                <!-- Form kiểm tra đơn hàng -->
                <div class="form-checkOrder">
                    <form method="post" action="${pageContext.request.contextPath}/checkOrder">
                        <h5 style="text-align: center;font-size: 15px;">
                            <i class="fa fa-search"></i> Kiểm tra đơn hàng của bạn
                        </h5>

                            <!-- Recaptcha mới -->
                            <div>
                                <div class="g-recaptcha" data-sitekey="6LeSkHQrAAAAAKanCNFfE-NbLI2txniV6qrvR6pE"></div>
                            </div>

                            <!-- Nhập số điện thoại -->
                            <div id="phone-input" style="margin-top: 20px;">
                                <label for="phonenumber">Nhập Số điện thoại của bạn:</label>
                                <br>
                                <input id="phonenumber" class="form-control" name="phonenumber" placeholder="0909 xxx xxx" type="text" style="margin-top: 10px;width: 97%;height: 30px;border-radius: 5px;border:white;padding-left: 10px;">
                            </div>

                            <!-- Thông báo và nút submit -->
                            <div>
                                <p class="mb-0">Nếu quý khách có bất kỳ thắc mắc nào, xin vui lòng gọi <b>0829 495 069</b></p>
                                <input id="addSubmit" class="btn btn-warning" name="search" value="Xem ngay" type="submit" style="margin-left: 180px;padding: 10px 25px;background-color: #E67E22;color: white;border: #E67E22;">
                            </div>
                    </form>        
                </div>

                <!-- Kết quả đơn hàng -->
                <div id="os-show">
                    <c:if test="${not empty error}">
                        <p style="color:red;">${error}</p>
                    </c:if>

                    <c:if test="${not empty message}">
                        <p>${message}</p>
                    </c:if>

                        <c:if test="${not empty details}">
                            <h3>Chi tiết đơn hàng:</h3>
                            <table style="width:100%; border-collapse: collapse; box-shadow: 0 0 10px rgba(0,0,0,0.1); border-radius: 10px; overflow: hidden;">
                                <thead style="background-color: #f39c12; color: white;">
                                    <tr>
                                        <th style="padding: 12px;">Người mua</th>
                                        <th style="padding: 12px;">Sản phẩm</th>
                                        <th style="padding: 12px;">Giá</th>
                                        <th style="padding: 12px;">Số lượng</th>
                                        <th style="padding: 12px;">Tổng tiền</th>
                                        <th style="padding: 12px;">Ngày đặt</th>
                                        <th style="padding: 12px;">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="d" items="${details}" varStatus="loop">
                                        <tr style="background-color: ${loop.index % 2 == 0 ? '#fff' : '#fdf2e9'};">
                                            <td style="padding: 10px; text-align: center;">${d.username}</td>
                                            <td style="padding: 10px; text-align: center;">${d.productName}</td>
                                            <td style="padding: 10px; text-align: center;">${d.productPrice}</td>
                                            <td style="padding: 10px; text-align: center;">${d.quantity}</td>
                                            <td style="padding: 10px; text-align: center;">${d.totalPrice}</td>
                                            <td style="padding: 10px; text-align: center;">${d.orderDate}</td>
                                            <td style="padding: 10px; text-align: center;">
                                                <span style="padding: 4px 8px; background-color: #e67e22; color: white; border-radius: 5px;">${d.status}</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                </div>
            </div>
        </div>


    <%@ include file="../design/footer.jsp" %>
    </body>

</html>