<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Edit Product</title>
    </head>
    <body>
    <center>
        <h1>Product Management</h1>
        <h2><a href="products">List All Products</a></h2>
    </center>
    <div align="center">
        <form method="post" action="products?action=edit">
            <table border="1" cellpadding="5">
                <caption><h2>Edit Product</h2></caption>

                <c:choose>
                    <c:when test="${not empty product}">
                        <input type="hidden" name="id" value="${product.id}" />
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" name="id" value="${param.id}" />
                    </c:otherwise>
                </c:choose>


                <tr>
                    <th>Product Name:</th>
                    <td>
                        <input type="text" name="name" size="45"
                               value="<c:out value='${product.name}'/>" required />
                    </td>
                </tr>

                <tr>
                    <th>Price:</th>
                    <td>
                        <input type="number" name="price" step="0.01"
                               value="<c:out value='${product.price}'/>" required />
                    </td>
                </tr>

                <tr>
                    <th>Description:</th>
                    <td>
                        <input type="text" name="description" size="45"
                               value="<c:out value='${product.description}'/>" />
                    </td>
                </tr>

                <tr>
                    <th>Stock:</th>
                    <td>
                        <input type="number" name="stock"
                               value="<c:out value='${product.stock}'/>" required />
                    </td>
                </tr>

                <tr>
                    <th>Import Date:</th>
                    <td>
                        <input type="date" name="importDate"
                               value="<c:out value='${product.importDate}'/>" required />
                    </td>
                </tr>

                <tr>
                    <th>Status:</th>
                    <td>
                        <input type="checkbox" name="status"
                               <c:if test="${product.status}">checked</c:if> />
                        Active
                    </td>
                </tr>
                
                <tr>
                    <th>Category ID:</th>
                    <td>
                        <input type="number" name="categoryId" 
                               value="<c:out value='${product.categoryId}'/>" required /> 
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Save" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
