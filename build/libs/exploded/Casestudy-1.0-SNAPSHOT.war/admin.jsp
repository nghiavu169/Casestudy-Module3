<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- JS, Popper.js, and jQuery -->
</head>
<body>
<h1>Luxury Watches</h1>
<a href="/watches">Back to Home</a>
<p>

    <!-- Create view -->
<a href="#" data-toggle="modal" data-target="#exampleModal">Create new luxury watch</a>
</p>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Create watch</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/watches?action=create" method="post">
                <div class="form-group">
                    <label for="exampleInputBrandID">Brand ID</label>
                    <input type="text" class="form-control" id="exampleInputBrandID" aria-describedby="emailHelp" placeholder="Brand Id" name="brandID">
                </div>
                <div class="form-group">
                    <label for="exampleInputName">Name</label>
                    <input type="text" class="form-control" id="exampleInputName" placeholder="Name" name="name">
                </div>
                <div class="form-group">
                    <label for="exampleInputPrice">Price</label>
                    <input type="text" class="form-control" id="exampleInputPrice" placeholder="Price" name="price">
                </div>
                <div class="form-group">
                    <label for="exampleInputImage">Image</label>
                    <input type="text" class="form-control" id="exampleInputImage" placeholder="Image" name="image">
                </div>
                <div class="form-group">
                    <label for="exampleInputDescription">Description</label>
                    <input type="text" class="form-control" id="exampleInputDescription" placeholder="Description" name="description">
                </div>
                <button type="submit" class="btn btn-primary">Create</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Create view -->


<!-- Update view -->
<c:forEach items='${requestScope["watchList"]}' var="watch">
<div class="modal fade" id="exampleModal1${watch.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Update Watch</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/watches?action=edit&id=${watch.getId()}" method="post">
                    <div class="form-group">
                        <label for="exampleInputBrandID">Brand ID</label>
                        <input type="text" class="form-control" aria-describedby="emailHelp" placeholder="Brand Id" name="brandID" value="<c:out value='${watch.getBrand_id()}' />">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputName">Name</label>
                        <input type="text" class="form-control" placeholder="Name" name="name" value="<c:out value='${watch.getName()}' />">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPrice">Price</label>
                        <input type="text" class="form-control" placeholder="Price" name="price" value="<c:out value='${watch.getPrice()}' />">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputImage">Image</label>
                        <input type="text" class="form-control" placeholder="Image" name="image" value="<c:out value='${watch.getImg()}' />">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputDescription">Description</label>
                        <input type="text" class="form-control" placeholder="Description" name="description" value="<c:out value='${watch.getDescription()}' />">
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</c:forEach>
<!-- Update view -->
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
            <td><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1${watch.getId()}">edit</a></td>
            <td><a href="/watches?action=delete&id=${watch.getId()}" class="btn btn-danger">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</html>