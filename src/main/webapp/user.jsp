<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.shop.repo.OrderRepo" %>
<%@ page import="uz.pdp.shop.entity.Order" %>
<%@ page import="uz.pdp.shop.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="static uz.pdp.shop.config.DataLoader.em" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Orders</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        ul {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        li {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<%
   Integer userId = Integer.valueOf(request.getParameter("id"));
    OrderRepo orderRepo = new OrderRepo();
    List<Order> userOrders = orderRepo.findByUserId(userId);
%>
<div class="container">
    <h1 class="mt-4 mb-4">Orders for User ID: <%= userId %></h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Total Sum</th>
            <th>Time</th>
            <th>Products</th>
        </tr>
        </thead>
        <tbody>
        <% for (Order order : userOrders) { %>
        <tr>
            <td><%= order.getId() %></td>
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
        <% }
        %>
        </tbody>
    </table>
</div>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
