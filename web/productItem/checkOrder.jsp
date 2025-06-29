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
        <link rel="stylesheet" href="../css/home.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/checkOrder.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    </head>

    <body>
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

    <%@ include file="../design/footer.jsp" %>
    </body>

</html>