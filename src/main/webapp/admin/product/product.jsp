
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.shop.repo.ProductRepo" %>
<%@ page import="uz.pdp.shop.entity.Product" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/19/2024
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Product Page</title>
    <link rel="stylesheet" href="../../static/bootstrap.min.css">

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

<%
    ProductRepo productRepo = new ProductRepo();
    List<Product> products = productRepo.findAll();

%>

<body>

<div class="sidebar">
    <a href="/admin/product/product.jsp" class="btn btn-primary btn-block">Product</a>
    <a href="/admin/category/category.jsp" class="btn btn-primary btn-block">Category</a>
    <a href="/admin/orders.jsp" class="btn btn-primary btn-block">Orders</a>

</div>
<div class="container mt-5 table-container">
    <div class="row">
        <div class="col-md-12">
            <table class="table" style="background-color: white">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Actions</th>

                </tr>
                </thead>
                <tbody>
                <% for (Product product : products) { %>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getCategory().getName()%></td>
                    <td>
                        <a href="/admin/product/editProduct.jsp?id=<%= product.getId() %>" class="btn btn-outline-warning">Edit</a>
                        <a href="/product/delete?id=<%= product.getId() %>" class="btn btn-outline-danger">Delete</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="/admin/product/addProduct.jsp" class="btn btn-success align-content-center">Add Product</a>
            <a href="/" class="btn btn-dark">Back to Home</a>

        </div>
    </div>
</div>

</body>
</html>
