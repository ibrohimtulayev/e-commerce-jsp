<%@ page import="uz.pdp.shop.repo.CategoryRepo" %>
<%@ page import="java.util.UUID" %>
<%@ page import="uz.pdp.shop.entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 21/04/2024
  Time: 3:00 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit category</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    CategoryRepo categoryRepo = new CategoryRepo();
    Category category = categoryRepo.findById(UUID.fromString(request.getParameter("id")));

%>


<div class="container mt-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title text-center my-3">Edit Group</h5>
                    <form action="/category/edit?id=<%=category.getId()%>" method="post">
                        <div class="form-group text-center">
                            <label for="categoryName">Category Name</label>
                            <input type="text" value="<%=category.getName()%>" class="form-control my-3 text-center" id="categoryName" name="name" placeholder="Enter category name">
                        </div>
                        <button type="submit" class="btn btn-primary my-3 w-100">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
