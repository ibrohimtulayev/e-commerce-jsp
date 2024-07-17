<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.shop.repo.CategoryRepo" %>
<%@ page import="uz.pdp.shop.entity.Category" %>
<%@ page import="java.util.Base64" %>
<%@ page import="uz.pdp.shop.entity.Basket" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 200px;
            background-color: #f8f9fa;
            padding: 20px;
            z-index: 1; /* Ensure sidebar stays above content */
            overflow-x: hidden; /* Hide horizontal scrollbar */
        }

        .content {
            margin-left: 200px; /* Adjust based on sidebar width */
            padding: 20px;
        }

        .admin-button {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 sidebar">
            <h3>Categories</h3>
            <ul class="list-group">
                <% List<Category> categories = new CategoryRepo().findAll();
                    for (Category category : categories) { %>
                <li class="list-group-item"><a href="/showCategoryProduct.jsp?id=<%=category.getId()%>"><%= category.getName() %></a></li>
                <% } %>
                <li class="list-group-item"><a href="/showCategoryProduct.jsp?">All</a></li>

            </ul>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 content">
            <a href="/admin/admin.jsp" class="admin-button"><button class="btn btn-success">Admin</button></a>
            <!-- Your main content here -->
            <p>Main content goes here...</p>
        </div>
    </div>
</div>

<!-- Bootstrap and jQuery JS files -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>