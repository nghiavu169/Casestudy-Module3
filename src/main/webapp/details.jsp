<%--
  Created by IntelliJ IDEA.
  User: Viet
  Date: 9/27/2020
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- JS, Popper.js, and jQuery -->

    <style>
        .container {
            height: auto;
        }

        .col-sm-1 ul .menu-left a {
            color: white;
            text-decoration: none;
        }

        .row {
            height: 200px;
        }

        footer {
            clear: both;
        }

        #content {
            height: 300px;
        }

        .col-sm-4 p {
            color: white;
        }

        .card-text {
            color: red;
        }

        .nav-item {
            width: 100px;
            border-right: 1px solid grey;
            text-align: center;
        }

        .dropdown {

        }

        .col-sm-4 {
            padding-bottom: 5px;
        }

        footer {
            padding-top: 10px;
        }

        nav {
            position: fixed;
        }
    </style>
</head>
<body>
<div style="height: auto; width: 100%">
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">TGDD</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="/watches">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true" aria-expanded="false">Products</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/watches?action=brand&type=rolex">Rolex</a>
                        <a class="dropdown-item" href="/watches?action=brand&type=hublot">Hublot</a>
                        <a class="dropdown-item" href="#">Apple Watch</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/category">List of Watches</a>
                    </div>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">Login</a>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <!-- navbar -->

    <!-- promoted banner -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100"
                     src="https://luxuo.vn/wp-content/uploads/2019/10/Hublot-Big-Bang-Tourmaline-Paraiba-banner.jpg"
                     alt="First slide" height="550px">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://donghosomot.com/FileUpload/Images/rolexbanner.jpg"
                     alt="Second slide" height="550px">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100"
                     src="https://cdn.shopify.com/s/files/1/0046/9077/2040/files/Hublot_Banner_with_Logo_18e043ef-52b2-4c41-aea9-4911d3bb837b_2000x.jpg?v=1569368370"
                     alt="Third slide" height="550px">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- promoted banner -->

    <!-- main view product -->
    <div class="container" style="padding-top: 20px">
        <div class="row" style="height: auto">
            <div class="col-sm-12">
                <div class="container">
                    <h1>${watch.getName()}</h1>
                    <div class="row" id="content" style="height: 100%;">
                        <div class="col-sm-8">
                            <a href="/watches?action=showDetails&id=${watch.getId()}"><img class="card-img-top"
                                                                                           src="${watch.getImg()}"
                                                                                           alt="Card image cap"></a>
                        </div>
                        <div class="col-sm-4">
                            <div class="card" style="width:19rem; ">
                                <div class="card-body">
                                    <a href="/watches?action=showDetails&id=${watch.getId()}"><h5
                                            class="card-title" style="height: 50px">${watch.getName()}</h5></a>
                                    <p class="card-text"
                                       style="color: darkred; font-weight: bold">${watch.getPrice()}$</p>
                                    <hr/>
                                    <p class="card-text" style="color: black">${watch.getDescription()}</p>
                                    <a href="/cart?action=buy&id=${watch.getId()}" class="btn btn-primary">Add to
                                        Cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- main view product -->
    <div class="footer">
        <p style="color: silver; background-color: grey;text-align: center;width: 100%;height: 100px">Coppyright &copy;
            2019 Boss Luxury Watch. All rights reserved</p>
    </div>
</div>
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
