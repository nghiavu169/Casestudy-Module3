<%--
  Created by IntelliJ IDEA.
  User: Viet
  Date: 9/25/2020
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <!-- JS, Popper.js, and jQuery -->
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="#">Create new customer</a>
</p>
<table border="1" class="table table-bordered">
    <tr>
        <td>ID</td>
        <td>Brand ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Image</td>
        <td>Description</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["watchList"]}' var="watch">
        <tr>
            <td><a href="">${watch.getId()}</a></td>
            <td>${watch.getBrand_id()}</td>
            <td>${watch.getName()}</td>
            <td>${watch.getPrice()}</td>
            <td>${watch.getImg()}</td>
            <td>${watch.getDescription()}</td>
            <td><a href="" class="btn btn-primary">edit</a></td>
            <td><a href="" class="btn btn-danger">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
