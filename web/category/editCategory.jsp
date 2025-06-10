<%-- 
    Document   : editCategory
    Created on : Jun 4, 2025, 7:53:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Category</title>
    </head>
    <center>
        <h1>Category Management</h1>
        <h2><a href="categories">List All Category</a></h2>
    </center>
    <div align="center">
        <form method="post" action="categories?action=edit">
            <table border="1" cellpadding="5">
                <caption><h2>Edit Product</h2></caption>

                <c:choose>
                    <c:when test="${not empty category}">
                        <input type="hidden" name="id" value="${category.categoryId}" />
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" name="id" value="${param.categoryId}" />
                    </c:otherwise>
                </c:choose>


                <tr>
                    <th>Category Name:</th>
                    <td>
                        <input type="text" name="name" size="45"
                               value="<c:out value='${category.name}'/>" required />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</html>
