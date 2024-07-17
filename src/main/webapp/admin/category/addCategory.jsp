<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/19/2024
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Category Page</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }

        .container {
            padding-top: 50px;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            color: #042446;
            font-size: 24px;
            text-align: center;
            margin-top: 20px;
        }

        .form-group label {
            color: #042446;
            font-weight: bold;
        }

        .form-control {
            border-radius: 20px;
            border-color: #ced4da;
        }

        .btn-primary {
            background-color: #042446;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 16px;
            margin-top: 20px;
        }

        .btn-primary:hover {
            background-color: #001a32;
        }

        /* Additional styles for responsiveness */
        @media (max-width: 576px) {
            .col-md-4.offset-md-4 {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add Category</h5>
                    <form action="/admin/category/add" method="post">
                        <div class="form-group">
                            <label for="categoryName">Category Name</label>
                            <input type="text" class="form-control" id="categoryName" name="name" placeholder="Enter Category Name">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (Optional if needed) -->
<script src="../static/jquery.min.js"></script>
<script src="../static/bootstrap.min.js"></script>
</body>
</html>
