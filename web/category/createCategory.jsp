<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Create New Category</title>
    </head>
    <body>
    <center>
        <h1>Category Management</h1>
        <h2><a href="categories">List All Categories</a></h2>
    </center>
    <div align="center">
        <form method="post" action="categories?action=create">
            <table border="1" cellpadding="5">
                <caption><h2>Add New Category</h2></caption>
                <tr>
                    <th>Category Name:</th>
                    <td><input type="text" name="name" id="name" size="45" required/></td>
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