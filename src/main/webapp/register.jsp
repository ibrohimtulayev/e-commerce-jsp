<%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 23/04/2024
  Time: 5:48 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="card" style="max-width: 400px; margin: 0 auto;">
        <div class="card-body">
            <h5 class="card-title text-center mb-4">Register</h5>
            <form action="/register" method="post">

                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" required>

                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>

                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>

                </div>


                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
