<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    <style>
        /*.col-sm-1, .col-sm-11{*/
        /*    height: 1000px;*/
        /*    border: 1px solid black;*/
        /*}*/
        /*.col-sm-1{*/
        /*    background-color: #1C1C1C;*/
        /*}*/
        .container{
            height: 600px;
        }
        .col-sm-1, .col-sm-1 ul, .col-sm-1 li{
            margin: 0;
            padding: 0;
        }

        /*ul .menu-left{*/
        /*    list-style: none;*/
        /*    position: relative;*/
        /*    width: 120px;*/
        /*    height: 40px;*/
        /*    border-bottom: 1px solid gray;*/
        /*    line-height: 40px;*/
        /*}*/
        /*ul .menu-left:hover{*/
        /*    background-color: gray;*/
        /*}*/
        .col-sm-1 ul .menu-left a{
            color: white;
            text-decoration: none;
        }
        .row{
            height: 200px;
        }
        footer{
            clear: both;
        }
        #content{
            height: 300px;
        }
        .col-sm-4 p{
            color: white;
        }
        .card-text{
            color: red;
        }
        .nav-item{
            width: 100px;
            border-right: 1px solid grey;
            text-align: center;
        }
        .dropdown{

        }
    </style>


</head>
<body>
<div class="container-fluid" style="height: auto">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">TGDD</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Separated link</a>
                    </div>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#"  data-toggle="modal" data-target="#exampleModal">Login</a>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <form style="width: 100%;">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Username</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="https://www.dangquangwatch.vn/upload/slideshow/1496345607_dong_ho_citizen.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://www.dangquangwatch.vn/upload/slideshow/631203232_bannerdayda.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://www.dangquangwatch.vn/upload/slideshow/1231178149_bannerdqw0909.jpg" alt="Third slide">
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
    <div class="container">
        <div class="row" style="height: auto">
            <div class="col-sm-12">
                <div class="container" style="height: 1000px">
                    <div class="row" id="content">
                        <div class="col-sm-4">
                            <div class="card" style="width: 19rem;">
                                <img class="card-img-top" src="https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text" style="color: black">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card" style="width: 19rem;">
                                <img class="card-img-top" src="https://bossluxurywatch.vn/uploads/san-pham/hublot/thumbs/418x0/hublot-classic-fusion-chronograph-king-gold.png" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text" style="color: black">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card" style="width: 19rem;">
                                <img class="card-img-top" src="https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text" style="color: black">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <p style="color: silver; background-color: grey;text-align: center;width: 100%;height: 100px">Coppyright &copy; 2019 Boss Luxury Watch. All rights reserved</p>
</div>

</body>
<script src="https://kit.fontawesome.com/yourcode.js"></script>
</html>
