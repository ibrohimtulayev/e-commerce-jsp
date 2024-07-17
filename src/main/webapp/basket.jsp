<%@ page import="uz.pdp.shop.entity.Basket" %>
<%@ page import="uz.pdp.shop.entity.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 22/04/2024
  Time: 6:37 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Basket</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        .product-card {
            max-width: 500px;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
        }

        .product-img {
            max-width: 150px;
            max-height: 150px;
            margin-right: 20px;
        }

        .product-info {
            flex-grow: 1;
        }

        .quantity-btn {
            display: inline-block;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            margin-left: 5px;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
        }

        .remove-btn {
            display: inline-block;
            padding: 5px 10px;
            background-color: #dc3545;
            color: #fff;
            border-radius: 5px;
            margin-left: 10px;
        }

        /* Style for ORDER button */
        .order-btn {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #ffc107; /* Yellow color */
            color: #212529;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
        }
    </style>
</head>
<body>
<%
    Object object = session.getAttribute("basket");
    Basket basket = (Basket) object;
    int sum = 0;
%>
<div class="container">
    <%
        List<Product> products = new ArrayList<>();

        for (Map.Entry<Product, Integer> productEntry : basket.getBasketProduct().entrySet()) {
            Product product = productEntry.getKey();
            int quantity = productEntry.getValue();
            sum += product.getPrice() * quantity;
            // Convert byte[] photo to Base64 for display
            String base64Image = Base64.getEncoder().encodeToString(product.getPhoto());
            products.add(product);
            session.setAttribute("products",products);
    %>
    <div class="product-card card">
        <div class="card-body d-flex">
            <!-- Product Image -->
            <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= product.getName() %>" class="product-img">
            <div class="product-info">
                <h5 class="card-title"><%= product.getName() %>
                </h5>
                <p class="card-text">Price: <%= product.getPrice() %> sum</p>
                <!-- Quantity Controls -->
                <div class="quantity-controls">
                    <a href="/basket/change?sign=minus&id=<%= product.getId() %>&amount=1" class="quantity-btn">-</a>
                    <input type="text" name="quantity" value="<%= quantity %>" class="quantity-input">
                    <a href="/basket/change?sign=plus&id=<%= product.getId() %>&amount=1" class="quantity-btn">+</a>
                    <!-- Remove Button -->
                    <a href="/basket/change?sign=remove&id=<%= product.getId() %>" class="remove-btn">Remove</a>
                </div>
                <!-- Total Price -->
                <p class="card-text">Total: <%= product.getPrice() * quantity %> sum</p>
            </div>
        </div>
    </div>
    <% } // End of for loop %>

    <!-- ORDER Button -->

    <a href="/order?allSum=<%= sum %>" class="order-btn">ORDER</a>



</div>
<h4 class="text-center">Total: <%= sum %> sum</h4>
</body>
</html>
