<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.shop.repo.ProductRepo" %>
<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.shop.entity.Category" %>
<%@ page import="uz.pdp.shop.repo.CategoryRepo" %>
<%@ page import="uz.pdp.shop.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/bootstrap.min.css">
    <style>
        .form-group label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card" style="max-width: 400px; margin: 0 auto;">
        <div class="card-body">
            <h5 class="card-title text-center mb-4">Edit Product</h5>
            <%
                // Retrieve product ID from request parameter
                ProductRepo productRepo = new ProductRepo();
                Product product = productRepo.findById(UUID.fromString(request.getParameter("id")));

                CategoryRepo categoryRepo = new CategoryRepo();
                List<Category> categories = categoryRepo.findAll();
            %>
            <form action="/product/update" method="post">
                <input type="hidden" name="id" value="<%= product.getId() %>">

                <div class="form-group">
                    <label for="name">Product Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= product.getName() %>" required>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required>
                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <select class="form-control" id="category" name="category" required>

                        <% for (Category category : categories) { %>
                        <option value="<%= category.getId() %>"><%= category.getName() %></option>
                        <% } %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Update Product</button>
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
