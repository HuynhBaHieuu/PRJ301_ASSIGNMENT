<%-- 
    Document   : sidebar
    Created on : Jun 15, 2025, 11:10:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="sidebar">   
                <ul>
                    <c:forEach var="category" items="${categories}">
                        <li>
                            <a href="home?categoryId=${category.categoryId}">${category.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
</html>
