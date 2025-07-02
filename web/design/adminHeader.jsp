<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .admin-sidebar {
                min-height: 100vh;
                background-color: #343a40;
                padding-top: 20px;
            }
            .admin-sidebar .nav-link {
                color: #fff;
                padding: 10px 20px;
            }
            .admin-sidebar .nav-link:hover {
                background-color: #495057;
            }
            .admin-sidebar .nav-link.active {
                background-color: #0d6efd;
            }
            .admin-content {
                padding: 20px;
            }
            .admin-header {
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
                padding: 15px 20px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 admin-sidebar">
                    <div class="d-flex flex-column">
                        <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                            <span class="fs-4">Admin Panel</span>
                        </a>
                        <hr class="text-white">
                        <ul class="nav nav-pills flex-column mb-auto">
                            <li class="nav-item">
                                <a href="products" class="nav-link ${param.active == 'products' ? 'active' : ''}">
                                    <i class="fas fa-box me-2"></i>
                                    Products
                                </a>
                            </li>
                            <li>
                                <a href="categories" class="nav-link ${param.active == 'categories' ? 'active' : ''}">
                                    <i class="fas fa-list me-2"></i>
                                    Categories
                                </a>
                            </li>
                            <li>
                                <a href="users" class="nav-link ${param.active == 'users' ? 'active' : ''}">
                                    <i class="fas fa-users me-2"></i>
                                    Users
                                </a>
                            </li>
                            <li>
                                <a href="orders" class="nav-link ${param.active == 'orders' ? 'active' : ''}">
                                    <i class="fas fa-shopping-cart me-2"></i>
                                    Orders
                                </a>
                            </li>
                        </ul>
                        <hr class="text-white">
                        <div class="dropdown">
                            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user-circle fa-2x me-2"></i>
                                <strong>${sessionScope.user.username}</strong>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                                <li><a class="dropdown-item" href="profile">Profile</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="logout">Sign out</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Main content -->
                <div class="col-md-10">
                    <div class="admin-header d-flex justify-content-between align-items-center">
                        <h4 class="m-0">Dashboard</h4>
                        <div class="d-flex align-items-center">
                            <span class="me-3">Welcome, ${sessionScope.user.username}!</span>
                            <a href="logout" class="btn btn-outline-danger">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>
                        </div>
                    </div>
                    <!-- Content will be injected here -->
                    <div class="admin-content"> 