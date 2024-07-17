
<%@ page import="java.util.List" %>
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
  <title>Admin</title>
  <link rel="stylesheet" href="../static/bootstrap.min.css">

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

  </style>
</head>



<body>

<div class="sidebar">
  <a href="/admin/product/product.jsp" class="btn btn-primary btn-block">Product</a>
  <a href="/admin/category/category.jsp" class="btn btn-primary btn-block">Category</a>
  <a href="/admin/orders.jsp" class="btn btn-primary btn-block">Orders</a>

</div>

</body>
</html>
