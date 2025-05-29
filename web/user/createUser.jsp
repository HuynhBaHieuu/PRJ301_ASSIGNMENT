<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Create New User</title>
    </head>
    <body>
    <center>
        <h1>User Management</h1>
        <h2><a href="users?action=users">List All Users</a></h2>
    </center>
    <div align="center">
        <form method="post" action="users?action=create">
            <table border="1" cellpadding="5">
                <caption><h2>Add New User</h2></caption>
                <tr>
                    <th>User Name:</th>
                    <td><input type="text" name="username" id="username" size="45" required/></td>
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
                    <th>Role:</th>
                    <td>
                        <select name="role" id="role" required>
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Status:</th>
                    <td><input type="checkbox" name="status" id="status" value="1"/> Active</td>
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
                    <td colspan="2" align="center">
                        <input type="submit" value="Save"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
