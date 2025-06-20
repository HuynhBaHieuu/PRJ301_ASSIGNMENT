<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Create New Product</title>
    </head>
    <body>
    <center>
        <h1>Product Management</h1>
        <h2><a href="products">List All Products</a></h2>
    </center>
    <div align="center">
        <form method="post" action="products?action=create">
            <table border="1" cellpadding="5">
                <caption><h2>Add New Product</h2></caption>
                <tr>
                    <th>Product Name:</th>
                    <td><input type="text" name="name" id="name" size="45" required/></td>
                </tr>
                <tr>
                    <th>Price:</th>
                    <td><input type="number" step="0.01" name="price" id="price" required/></td>
                </tr>
                <tr>
                    <th>Description:</th>
                    <td><input type="text" name="description" id="description" size="45"/></td>
                </tr>
                <tr>
                    <th>Stock:</th>
                    <td><input type="number" name="stock" id="stock" required/></td>
                </tr>
<!--                <tr>
                    <th>Import Date:</th>
                    <td><input type="date" name="importDate" id="importDate" required/></td>
                </tr>-->
                <tr>
                    <th>Status:</th>
                    <td><input type="checkbox" name="status" id="status" value="1"/> Active</td>
                </tr>
                <tr>
                    <th>CategoryID:</th>
                    <td><input type="number" name="categoryId" id="categoryId" required</td>
                </tr>
                
                <tr>
                    <th>ImageURL:</th>
                    <td>
                        <input type="number" name="imageUrl" 
                               value="<c:out value='${product.imageUrl}'/>" required /> 
                    </td>
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
