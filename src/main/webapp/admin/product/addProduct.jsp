<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.shop.entity.Product" %>
<%@ page import="uz.pdp.shop.repo.ProductRepo" %>
<%@ page import="uz.pdp.shop.entity.Category" %>
<%@ page import="uz.pdp.shop.repo.CategoryRepo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/bootstrap.min.css">
    <style>
        .error-message {
            font-size: 0.8em;
            color: red;
        }
    </style>
</head>
<body>
<%
    ProductRepo productRepo = new ProductRepo();
    CategoryRepo categoryRepo = new CategoryRepo();
    List<Category> categories = categoryRepo.findAll();
    List<Product> products = productRepo.findAll();
%>
<div class="container mt-5">
    <div class="card" style="max-width: 400px; margin: 0 auto;">
        <div class="card-body">
            <h5 class="card-title text-center mb-4">Register</h5>
            <form action="/product/add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Product Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select class="form-control" id="category" name="category" required>
                        <option value="" selected disabled>Select Category</option>
                        <% for (Category category : categories) { %>
                        <option value="<%= category.getId() %>"><%= category.getName() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="photo">Product Photo</label>
                    <input type="file" class="form-control-file" id="photo" name="photo" accept="image/*" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </form>
        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
