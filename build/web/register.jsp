<%-- 
    Document   : register
    Created on : Jun 5, 2025, 11:47:22 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Register page</title>
        <link rel="stylesheet" type="text/css" href="css/register.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div align="center">
            <div class="wrapper">
                <form method="post" action="register?action=create" onsubmit="return validateForm()">
                    <h1>Create an Account</h1>
                    <div class="input-box">
                        <input type="text" id="username" name="username" required placeholder="Username" onkeyup="validateUsername()">
                        <i class='bx bxs-user'></i>
                        <span id="usernameError"></span>
                    </div>

                    <div class="input-box">
                        <input type="email" id="email" name="email" required placeholder="Email">
                        <i class='bx bxs-envelope'></i>
                    </div>

                    <div class="input-box">
                        <input type="text" id="country" name="country" required placeholder="Country">
                        <i class='bx bxs-globe'></i>
                    </div>

                    <div class="input-box">
                        <input type="password" id="password" name="password" required placeholder="Password">
                        <i class='bx bxs-lock-alt'></i>
                    </div>

                    <div class="input-box">
                        <input type="date" id="dob" name="dob" required>
                    </div>

                    <div class="input-box">
                        <input type="text" id="phone" name="phone" required placeholder="Phone Number">
                        <i class='bx bxs-phone'></i>
                    </div>

                    <button type="submit" class="btn">Register</button>
                    <div class="register-link">
                        <p>Already have an account? <a href="login.jsp">Login</a></p>
                    </div>
                </form>
            </div>
        </div>
        <script>
            // Ngăn nhập dấu cách trong ô Username
            document.addEventListener("DOMContentLoaded", function () {
                const usernameInput = document.getElementById("username");

                // Chặn nhập phím cách
                usernameInput.addEventListener("keydown", function (e) {
                    if (e.key === " ") {
                        e.preventDefault();
                    }
                });

                // Nếu người dùng paste nội dung có space, tự động xóa luôn
                usernameInput.addEventListener("input", function () {
                    this.value = this.value.replace(/\s/g, "");
                });
            });

            // Kiểm tra toàn bộ form trước khi submit
            function validateForm() {
                const username = document.getElementById("username").value;
                const usernameError = document.getElementById("usernameError");

                if (/\s/.test(username)) {
                    usernameError.textContent = "Username must not contain spaces.";
                    return false;
                } else {
                    usernameError.textContent = "";
                }

                return true; // Cho submit nếu không có lỗi
            }
        </script>
    </body>
</html>
