<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="active" value="users" scope="request"/>
<jsp:include page="../design/adminHeader.jsp"/>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark">
                    <h3 class="card-title mb-0"><i class="fas fa-user-edit"></i> Edit User</h3>
                </div>
                <div class="card-body">
                    <form method="post">
                        <table class="table table-borderless mb-0">
                            <caption class="mb-3"><h4 class="text-center">Edit User</h4></caption>
                            <c:if test="${user != null}">
                                <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                            </c:if>
                            <tr>
                                <th><label for="username" class="form-label">User Name:</label></th>
                                <td><input type="text" class="form-control" name="username" id="username" size="45" value="<c:out value='${user.username}' />" required/></td>
                            </tr>
                            <tr>
                                <th><label for="email" class="form-label">User Email:</label></th>
                                <td><input type="email" class="form-control" name="email" id="email" size="45" value="<c:out value='${user.email}' />" required/></td>
                            </tr>
                            <tr>
                                <th><label for="country" class="form-label">Country:</label></th>
                                <td><input type="text" class="form-control" name="country" id="country" size="15" value="<c:out value='${user.country}' />" required/></td>
                            </tr>
                            <tr>
                                <th><label for="role" class="form-label">Role:</label></th>
                                <td>
                                    <select class="form-select" name="role" id="role" required>
                                        <option value="admin" <c:if test="${user.role == 'admin'}">selected</c:if>>Admin</option>
                                        <option value="user" <c:if test="${user.role == 'user'}">selected</c:if>>User</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="status" class="form-label">Status:</label></th>
                                <td><input type="checkbox" class="form-check-input" name="status" id="status" <c:if test="${user.status}">checked</c:if> /> <label for="status" class="form-check-label">Active</label></td>
                            </tr>
                            <tr>
                                <th><label for="password" class="form-label">Password:</label></th>
                                <td><input type="password" class="form-control" name="password" id="password" size="45" value="<c:out value='${user.password}' />" required/></td>
                            </tr>
                            <tr>
                                <th><label for="dob" class="form-label">Date of Birth:</label></th>
                                <td><input type="date" class="form-control" name="dob" id="dob" value="<c:out value='${user.dob}' />" required/></td>
                            </tr>
                            <tr>
                                <th><label for="phone" class="form-label">Phone number:</label></th>
                                <td><input type="text" class="form-control" name="phone" id="phone" value="<c:out value='${user.phone}' />" required/></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Save</button>
                                    <a href="users?action=users" class="btn btn-secondary ms-2"><i class="fas fa-arrow-left"></i> Back to List</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../design/adminFooter.jsp"/>