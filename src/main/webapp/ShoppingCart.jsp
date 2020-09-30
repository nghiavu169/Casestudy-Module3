<%--
  Created by IntelliJ IDEA.
  User: Viet
  Date: 9/28/2020
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: black">
    <a class="navbar-brand" href="#"><img style="width: 50px;height: 50px"
                                          src="https://www.screenja.com/static/img/thumbs/logo-rolex-normal-636.png"
                                          alt="lỗi"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02"
            aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href="watches">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Features</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                   aria-expanded="false">Products</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/watches?action=brand&type=rolex">Rolex</a>
                    <a class="dropdown-item" href="/watches?action=brand&type=hublot">Hublot</a>
                    <a class="dropdown-item" href="#">Apple Watch</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/category">List of Watches</a>
                </div>
            </li>
            <li class="nav-item " style="position: relative; float: right">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">Login</a>
            </li>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <form style="width: 100%;" method="post" action="/watches?action=login">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Username</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1"
                                           aria-describedby="emailHelp" placeholder="Username" name="username">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1"
                                           placeholder="Password" name="password">
                                </div>
                                <button type="submit" class="btn btn-primary">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->
        </ul>
        <form class="form-inline my-2 my-lg-0" method="post" action="/watches?action=search">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" name="name">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>


<section class="pt-5 pb-5">
    <div class="container">
        <div class="row w-100">
            <div class="col-lg-12 col-md-12 col-12">
                <h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
                <p class="mb-5 text-center">
                    <i class="text-info font-weight-bold"><c:out value="${cart.getNumbersOfItemsInCart()}"/></i> items
                    in your cart</p>
                <table id="shoppingCart" class="table table-condensed table-responsive">
                    <thead>
                    <tr>
                        <th style="width:60%">Product</th>
                        <th style="width:12%">Price</th>
                        <th style="width:10%">Quantity</th>
                        <th style="width:16%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cart.getList()}" var="list">
                        <tr>
                            <td data-th="Product">
                                <div class="row">
                                    <div class="col-md-3 text-left">
                                        <img src="<c:out value="${list.getWatch().getImg()}"/>" alt=""
                                             class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                    </div>
                                    <div class="col-md-9 text-left mt-sm-2">
                                        <h4>Product Name</h4>
                                        <p class="font-weight-light"><c:out value="${list.getWatch().getName()}"/></p>
                                    </div>
                                </div>
                            </td>
                            <td data-th="Price"><c:out value="${list.getPrice()}"/>$</td>
                            <td data-th="Quantity">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <a href="/cart?action=buy&id=${list.getWatch().getId()}"
                                       class="btn btn-secondary">+</a>
                                    <button type="button" class="btn btn-secondary"><c:out
                                            value="${list.getQuantity()}"/></button>
                                    <a href="/cart?action=decrease&id=${list.getWatch().getId()}"
                                       class="btn btn-secondary">-</a>
                                </div>
                            </td>
                            <td class="actions" data-th="">
                                <div class="text-right">
                                    <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                        <a href="/cart?action=delete&id=${list.getWatch().getId()}"
                                           class="fas fa-trash">Delete</a>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="float-right text-right">
                    <h4>Subtotal:</h4>
                    <h1><c:out value="${cart.getTotalPrice()}"/>$</h1>
                </div>
            </div>
        </div>
        <div class="row mt-4 d-flex align-items-center">
            <div class="col-sm-6 order-md-2 text-right">
                <a href="#" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Checkout</a>
            </div>
            <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                <a href="/watches" class="fas fa-arrow-left mr-2">Continue Shopping</a>
            </div>
        </div>
    </div>

</section>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
</html>
