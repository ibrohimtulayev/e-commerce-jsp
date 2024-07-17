<%@ page import="uz.pdp.shop.repo.OrderRepo" %>
<%@ page import="uz.pdp.shop.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.shop.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {

            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100%;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #042446;
            padding-top: 50px;
            z-index: 1; /* Ensure sidebar stays above other elements */
        }

        .sidebar a {
            padding: 10px;
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            display: block;
        }

        .sidebar a:hover {
            background-color: #001a32;
        }

        /* Change hover color to white */
        .sidebar a:hover {
            background-color: #fff;
            color: #042446;
        }

        .form-group label {
            color: #042446;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #042446;
            border: none;
            border-radius: 20px;
            margin-bottom: 10px; /* Add margin to separate buttons */
        }

        .btn-primary:hover {
            background-color: #001a32;
        }

        /* Add style for the top left corner button */
        .top-right-btn {
            position: absolute;
            top: 30px;
            right: 20px;
        }

        /* Style for the table */
        table {
            width: 100%; /* Adjusted width */
            margin-top: 20px; /* Added margin top */
            border-collapse: collapse;
            background-color: white; /* Set background color to white */
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #042446;
            color: white;
        }

        .container {
            margin-left: 200px; /* Adjusted margin to align with sidebar */
        }

        .table-container {
            margin-top: 20px; /* Added margin top */
            margin-left: 220px; /* Adjusted margin to align with sidebar */
            padding: 20px; /* Added padding for spacing */
        }
    </style>
</head>
<body>
<%
    OrderRepo orderRepo = new OrderRepo();
    List<Order> orders = orderRepo.findAll();
%>
<div class="sidebar">
    <a href="/admin/product/product.jsp" class="btn btn-primary btn-block">Product</a>
    <a href="/admin/category/category.jsp" class="btn btn-primary btn-block">Category</a>
    <a href="/admin/orders.jsp" class="btn btn-primary btn-block">Orders</a>

</div>
<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Total Sum</th>
            <th>Time</th>
            <th>Products</th>
        </tr>
        </thead>
        <tbody>
        <% for (Order order : orders) { %>
        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getUserId() %></td>
            <td><%= order.getTotalSum() %></td>
            <td><%= order.getTime() %></td>
            <td>
                <ul>
                    <% for (Product product : order.getProducts()) { %>
                    <li><%= product.getName() %></li>
                    <% } %>
                </ul>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
