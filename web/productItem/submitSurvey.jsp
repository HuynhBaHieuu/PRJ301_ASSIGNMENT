<%-- 
    Document   : submitSurvey
    Created on : Jul 12, 2025, 4:25:49 PM
    Author     : phung
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Nông Sản Tương Lai - Cảm ơn bạn</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/home.css" />
        <link rel="stylesheet" href="../css/footer.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    </head>
    <body>
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>

        <section class="breadcrumb-section">
            <div class="breadcrumb-container">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><span class="divider">/</span><span class="current">Ghi nhận ý kiến</span></li>
                </ul>
            </div>
        </section>

        <style>
            .breadcrumb-section {
                padding: 12px 30px;
                font-family: Arial, sans-serif;
                border-radius: 6px;
                margin: 0 30px 20px 30px; /* thẳng hàng với header */
            }

            .breadcrumb-container {
                max-width: 1200px;
                margin-left: 2.7%;
                margin-top: 1%;
            }

            .breadcrumb {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
                align-items: center;
                font-size: 16px;
                color: #333;
            }

            .breadcrumb li {
                margin-right: 8px;
                display: flex;
                align-items: center;
            }

            .breadcrumb li a {
                color: #000000;
                text-decoration: none;
            }

            .breadcrumb li a:hover {
                text-decoration: underline;
            }

            .breadcrumb .divider {
                margin: 0 6px;
                color: #888;
            }

            .breadcrumb .current {
                color: #aaa;
                font-weight: normal;
            }
        </style>            


        <div style="background-color: #F0EBF8;padding: 20px 0;">
            <div style="width: 800px;margin:0 auto;">

                <div style="margin-top: 50px;border: solid 1px #C8C8C8;border-radius: 5px;padding: 50px;background-color: white;">
                    <h1 style="font-size: 30px; margin-left: -13px; color: purple;">Nông Sản Tương Lai ghi nhận ý kiến phản hồi từ Quý khách hàng</h1>

                    <p style="font-size: 18px;color: purple;">
                        Câu trả lời của bạn đã được ghi lại.
                    </p>

                    <div class="c2gzEf">
                        <a href="${pageContext.request.contextPath}/productItem/comment.jsp">Gửi ý kiến phản hồi khác</a>
                        <style>
                            /* Chỉnh sửa màu sắc của liên kết */
                            .c2gzEf a {
                                font-size: 18px;
                                color: #000000;  /* Màu mặc định */
                                text-decoration: none;
                                display: block;
                                text-align: center;
                                margin-top: 30px;
                            }

                            /* Hiệu ứng hover khi di chuột vào */
                            .c2gzEf a:hover {
                                color: #512a8a;  /* Màu khi di chuột vào */
                                text-decoration: underline;  /* Thêm gạch dưới khi hover */
                            }
                        </style>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../design/footer.jsp" %>  
    </body>
</html>

