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
        <script>
            function validateUsername() {
                var username = document.getElementById("username").value;
                var errorSpan = document.getElementById("usernameError");
                
                // Remove any spaces from the input
                var trimmedUsername = username.replace(/\s+/g, '');
                if (username !== trimmedUsername) {
                    // Update the input field to remove spaces
                    document.getElementById("username").value = trimmedUsername;
                    errorSpan.innerHTML = "Spaces have been automatically removed";
                    errorSpan.style.color = "orange";
                    return false;
                }
                
                if(username.length === 0) {
                    errorSpan.innerHTML = "Please enter username";
                    errorSpan.style.color = "red";
                    return false;
                } else {
                    errorSpan.innerHTML = "✓ Username valid";
                    errorSpan.style.color = "green";
                    return true;
                }
            }
            
            function validateForm() {
                return validateUsername();
            }
        </script>
    </head>
    <body>
    <center>
        <h1>Register</h1>
    </center>
    <div align="center">
        <form method="post" action="register?action=create" onsubmit="return validateForm()">
            <table border="1" cellpadding="5">
                <caption><h2>Register New User</h2></caption>
                <tr>
                    <th>User Name:</th>
                    <td>
                        <input type="text" name="username" id="username" size="45" required onkeyup="validateUsername()"/>
                        <span id="usernameError"></span>
                    </td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><input type="email" name="email" id="email" size="45" required/></td>
                </tr>
                <tr>
                    <th>Country:</th>
                    <td><input type="text" name="country" id="country" size="45" required/></td>
                </tr>
                <tr>
                    <th>Password:</th>
                    <td><input type="password" name="password" id="password" size="45" required/></td>
                </tr>
                <tr>
                    <th>Date of Birth:</th>
                    <td><input type="date" name="dob" id="dob" required/></td>
                </tr>
                <tr>
                    <th>Phone number:</th>
                    <td><input type="text" name="phone" id="phone" required/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Register"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
