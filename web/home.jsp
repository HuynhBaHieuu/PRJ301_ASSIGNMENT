<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.User" %>
<%
    // Kiểm tra session nếu người dùng đã đăng nhập
    User user = (User) session.getAttribute("user");

    if (user == null) {
%>
<!-- Nếu người dùng chưa đăng nhập, hiển thị thông tin mặc định và nút đăng nhập -->
<h2>Welcome, Guest!</h2>
<a href="login.jsp">Login</a>
<%
} else {
%>
<!-- Nếu người dùng đã đăng nhập, hiển thị thông tin người dùng -->
<h2>Welcome, <%= user.getUsername()%>!</h2>
<a href="logout">Logout</a>
<%
    }
%>