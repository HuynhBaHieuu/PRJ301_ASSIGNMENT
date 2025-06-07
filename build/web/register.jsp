<%-- 
    Document   : register
    Created on : Jun 7, 2025, 4:03:00 PM
    Author     : phung
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="user/css/register.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="wrapper">
            <form class="register-form" action="register?action=create" method="post">
                <h1>Create an Account</h1>

                <div class="input-box">
                    <input type="text" id="username" name="username" required placeholder="Username">
                    <i class='bx bxs-user'></i>
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
    </body>
</html>
