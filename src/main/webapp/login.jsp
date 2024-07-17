<%@ page import="uz.pdp.shop.entity.User" %>
<%@ page import="static uz.pdp.shop.config.DataLoader.em" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 100px;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.9); /* Adjust background color and opacity */
        }

        .card-header {
            background-color: #042446;
            color: #fff;
            border-top-left-radius: 10px; /* Decreased top border radius */
            border-top-right-radius: 10px; /* Decreased top border radius */
        }

        .card-body {
            padding: 40px;
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
        }

        .btn-primary:hover {
            background-color: #001a32;
        }
    </style>
</head>
<body>
<%
//    em.getTransaction().begin();
//    User user = User.builder()
//            .email("ibtulayev")
//            .isAdmin(true)
//            .firstName("ibrohim")
//            .password("1221")
//            .build();
//    em.persist(user);
//    em.getTransaction().commit();
%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-header">
                    <h3 class="text-center">Login</h3>
                </div>
                <div class="card-body">
                    <form action="/auth/login" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input name="email" type="text" class="form-control" id="username" placeholder="Enter your username">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password">
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember Me</label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>

                    <a href="/register.jsp"><button class="btn btn-success">Register</button></a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
