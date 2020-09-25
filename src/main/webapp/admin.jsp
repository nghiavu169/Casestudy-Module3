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
<h1>Luxury Watches</h1>
<form>
    <div class="form-group">
        <label for="exampleInputBrandID">Brand ID</label>
        <input type="text" class="form-control" id="exampleInputBrandID" aria-describedby="emailHelp" placeholder="Brand ID">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
        <label for="exampleInputName">Watch Name</label>
        <input type="text" class="form-control" id="exampleInputName" placeholder="Name">
    </div>
    <div class="form-group">
        <label for="exampleInputPrice">Price</label>
        <input type="text" class="form-control" id="exampleInputPrice" placeholder="Price">
    </div>
    <div class="form-group">
        <label for="exampleInputImage">Image</label>
        <input type="text" class="form-control" id="exampleInputImage" placeholder="Image">
    </div>
    <div class="form-group">
        <label for="exampleInputDescription">Description</label>
        <input type="text" class="form-control" id="exampleInputDescription" placeholder="Description">
    </div>
    <button type="submit" class="btn btn-primary">Create</button>
</form>
<p>
    <a href="#">Create new luxury watch</a>
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
            <td><a href="/watches?action=delete&id=${watch.getId()}" class="btn btn-danger">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
