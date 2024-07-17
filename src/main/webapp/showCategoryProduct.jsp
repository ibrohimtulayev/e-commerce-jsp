<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.shop.repo.ProductRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.shop.entity.Product" %>
<%@ page import="uz.pdp.shop.repo.CategoryRepo" %>
<%@ page import="uz.pdp.shop.entity.Category" %>
<%@ page import="static uz.pdp.shop.util.Base64.encodeBase64" %>
<%@ page import="uz.pdp.shop.entity.Basket" %>
<%@ page import="uz.pdp.shop.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
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
            margin-left: 220px; /* Adjust based on sidebar width */
            padding: 20px;
        }

        .admin-button {
            position: fixed;
            top: 20px;
            right: 20px;
        }

        /* Custom styles for products */
        .card-deck {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            margin: 20px -10px; /* Negative margin to offset card padding */
            padding: 0;
            list-style: none;
        }

        /* Updated styles for card size */
        .card {
            width: calc(33.33% - 20px); /* Three cards per row, with margins */
            margin: 10px; /* Margin between each card */
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
            max-width: 300px; /* Maximum width of 300px */
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card .card-body {
            padding: 15px;
        }

        .card .card-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .card .card-text {
            font-size: 14px;
            color: #333;
        }

        .buy-button {
            margin-top: 10px;
            width: 100%;
        }

        /* Additional style for smaller screens */
        @media (max-width: 768px) {
            .card {
                width: calc(50% - 20px); /* Two cards per row on smaller screens */
            }
        }
    </style>
</head>
<body>
<%
    Basket basket = new Basket();
    Object object = session.getAttribute("basket");
    if (object != null) {
        basket = (Basket) object;
    }
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 sidebar">
            <h3>Categories</h3>
            <ul class="list-group">
                <% List<Category> categories = new CategoryRepo().findAll();
                    for (Category category : categories) { %>
                <li class="list-group-item">
                    <a href="/showCategoryProduct.jsp?id=<%=category.getId()%>">
                        <%= category.getName() %>
                    </a>
                </li>
                <% } %>
                <li class="list-group-item"><a href="/showCategoryProduct.jsp?id=">All</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 content">
            <div class="d-flex justify-content-end mb-3">
                <a href="/basket.jsp" class="btn btn-primary mr-3">Basket <%= basket.getBasketProduct().size() %></a>

                <%-- Check if the user is logged in --%>
                <%
                    User user = (User) session.getAttribute("currentUser");
                    if (user == null) { %>
                <!-- If not logged in, show the Login button -->
                <a href="login.jsp" class="btn btn-success">Login</a>
                <% } else { %>
                <!-- If logged in, check if user is an admin -->
                <% if (user.isAdmin()) { %>
                <!-- If admin, show the Admin button -->
                <a href="/admin/admin.jsp" class="btn btn-success">Admin</a>
                <% } else { %>
                <!-- If not admin, show the User button -->
                <a href="/user.jsp?id=<%= user.getId() %>" class="btn btn-success">User</a>

                <% } %>
                <% } %>
                <a href="/logout" class="btn btn-danger">Log out</a>
            </div>


            <div class="container">
                <h2>Products</h2>
                <%-- Get the category ID from the request parameter --%>
                <% String categoryIdParam = request.getParameter("id");
                    UUID categoryId = null;
                    if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                        categoryId = UUID.fromString(categoryIdParam);
                    }
                    ProductRepo productRepo = new ProductRepo();
                    List<Product> products;
                    if (categoryId != null) {
                        products = productRepo.findByCategoryId(categoryId);
                    } else {
                        products = productRepo.findAll();
                    } %>

                <%-- Display products in a Bootstrap card deck --%>
                <div class="card-deck">
                    <% for (Product product : products) { %>
                    <div class="card">
                        <img src="data:image/jpeg;base64, <%= encodeBase64(product.getPhoto()) %>" class="card-img-top"
                             alt="<%= product.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %>
                            </h5>
                            <p class="card-text">Price: <%= product.getPrice() %>
                            </p>
                            <%
                                if (basket.getBasketProduct().containsKey(product)) { %>

                            <button class="btn btn-secondary">Added</button>

                            <% } else { %>
                            <form action="/basket/add" method="post">
                                <input type="hidden" name="productId" value="<%=product.getId()%>">
                                <button class="btn btn-primary buy-button">Buy</button>
                            </form>
                            <% }
                            %>

                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

    </div>
    <!-- Admin Button -->

    <!-- Bootstrap and jQuery JS files -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <%-- Custom script to encode byte array to Base64 --%>

</body>
</html>
