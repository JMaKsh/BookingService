<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="en">
<head>
    <title>BookingService</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"
            integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7"
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="../../resources/js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="../../resources/js/bootstrap-datetimepicker.min.js"></script>
    <script src="../../resources/js/bootstrap3-typeahead.js"></script>
    <script type="text/javascript" src="../../resources/js/carousel.js"></script>
    <link rel="stylesheet" href="../../resources/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css"/>
    <link href="../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
</head>


<body>
<div class="header_bg"><!-- start header -->
    <div class="container">
        <div class="row header">
            <nav class="navbar" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/"><img src="../../resources/img/logo.png" alt=""
                                                              class="img-responsive"/> </a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="menu nav navbar-nav ">
                            <c:url value="/" var="indexURL"/>
                            <li><a href="${indexURL}">home</a></li>
                            <c:url value="/submitpage" var="submitURL"/>
                            <li><a href="${submitURL}">my tickets</a></li>
                            <c:url value="/userpage" var="userpageUrl"/>
                            <li><a href="${userpageUrl}">my cabinet</a></li>

                            <sec:authorize access="!isAuthenticated()">
                                <c:url value="/login" var="loginUrl"/>
                                <li><a href="${loginUrl}">sign in</a></li>

                                <c:url value="/registration" var="rigistUrl"/>
                                <li><a href="${rigistUrl}">registration</a></li>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                <c:url value="/logout" var="logoutUrl"/>
                                <li><a href="${logoutUrl}">logout</a></li>
                            </sec:authorize>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>


        <div class="container testdate">
            <p>
            <h3><b>For test: Min date:08/20/2016; Max date: 09/30/2016</b></h3></p>
        </div>

        <div class="container searchblock">
            <form role="form" action="/search" method="post">
                <legend>Let's make a booking</legend>
                <div class="row">
                    <div class="col-sm-4 col-md-4">
                        <input type="text" class="form-control" id="search" data-provide="typeahead" data-items="4" required
                               placeholder="From" name="from" autocomplete="off">
                    </div>
                    <div class="col-sm-1 col-md-1" style="text-align:center">
                        <img src="../../resources/img/swap.png" id="switcher" style="cursor:pointer">
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <input type="text" class="form-control" id="search1" data-provide="typeahead" data-items="4" required
                               placeholder="To" name="to" autocomplete="off">
                    </div>
                    <div class=" col-sm-2 col-md-2">
                        <input type="text" class="form-control" id="datetimepicker1" required style="width:120px"
                               placeholder="Date" name="date"/>
                    </div>
                    <div class="col-sm-1 col-md-1 <!--col-sm-offset-10 col-md-offset-10-->">
                        <button type="submit" class="btn btn-primary"> <!--style="margin:-85%;margin-top:-50%"-->SEARCH</button>
                    </div>
                </div>

            </form>
        </div>


    </div>
</div>

<div class="main"><!-- start main -->
    <div class="container main">
        <div class="row reasons">
            <div class="col-md-3 grid1_of_3">
                <h2>best price</h2>
                <img src="../../resources/img/icon1.png" class="img-responsive"/>
                <p>Find our lowest price to destinations worldwide, guaranteed</p>
            </div>
            <div class="col-md-3 grid1_of_3">
                <h2>Easy booking</h2>
                <img src="../../resources/img/icon2.png" class="img-responsive"/>
                <p>Search, select and save - the fastest way to book your trip</p>
            </div>
            <div class="col-md-3 grid1_of_3">
                <h2>Save time and money</h2>
                <img src="../../resources/img/icon3.png" class="img-responsive"/>
                <p>Plan your trip without leaving your computer</p>
            </div>

            <div class="col-md-3 grid1_of_3">
                <h2>24/7 customer care</h2>
                <img src="../../resources/img/icon4.png" class="img-responsive"/>
                <p>We will never leave you with the problem alone, the solution is here</p>
            </div>
        </div>
        <div class="clearfix"></div>


        <div class="row popular_dir">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                <h2>Most popular directions</h2>
                <form role="form" action="/quicksearch" method="post">
                    <div class="table_dir">
                        <table class="table table-responsive  table-condensed cf table-hover">
                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="1" checked="checked"><b>Kyiv </b>
                                            <span class="glyphicon glyphicon-arrow-right"></span><b> Odesa</b>
                                        </label>
                                    </div>
                                </td>
                                <td class = "price_td" style="vertical-align:middle"><b>from 232.02 UAH</b></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="2"><b>Kyiv </b>
                                            <span class="glyphicon glyphicon-arrow-right"></span><b> Lviv</b>
                                        </label>
                                    </div>

                                </td>
                                <td class = "price_td" style="vertical-align:middle"><b>from 265.10 UAH</b></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="3"><b>Kyiv </b>
                                            <span class="glyphicon glyphicon-arrow-right"></span><b> Kharkiv</b>
                                        </label>
                                    </div>
                                </td>
                                <td class = "price_td" style="vertical-align:middle"><b>from 155.50 UAH</b></td>

                            </tr>
                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="4"><b>Kyiv </b>
                                            <span class="glyphicon glyphicon-arrow-right"></span><b> Dnipro</b>
                                        </label>
                                    </div>
                                </td>
                                <td class = "price_td" style="vertical-align:middle"><b>from 158.50 UAH</b></td>

                            </tr>

                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="5"><b>Kyiv
                                            <span class="glyphicon glyphicon-arrow-right"></span> Uzhorod</b>
                                        </label>
                                    </div>
                                </td>
                                <td class = "price_td" style="vertical-align:middle"><b>from 450.12 UAH</b></td>
                            </tr>
                        </table>
                        <div align="center">
                            <input type="text" class="span3" id="datetimepicker2" required style="width:25%"
                                   placeholder="Date" name="date"/>

                            <button type="submit" class="btn-q-search btn-primary">SEARCH</button>
                        </div>
                    </div>
                </form>

                <div class="clearfix"></div>
            </div>

            <div class="col-md-6 slider">

                <div id="myCarousel" class="carousel slide" data-ride="carousel">

                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../../resources/img/autolux_1.jpg" class="img-thumbnail center-block" alt=""
                            >
                            <div class="carousel-caption">
                            </div>
                        </div>

                        <div class="item">
                            <img src="../../resources/img/train_1.jpg" class="img-thumbnail center-block" alt=""
                            >
                            <div class="carousel-caption">
                            </div>
                        </div>

                        <div class="item">
                            <img src="../../resources/img/mau_1.jpg" class="img-thumbnail center-block" alt=""
                            >
                            <div class="carousel-caption">
                            </div>
                        </div>

                        <div class="item">
                            <img src="../../resources/img/mau_2.jpg" class="img-thumbnail center-block" alt=""
                            >
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../resources/img/gunsel_1.jpg" class="img-thumbnail center-block" alt=""
                            >
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../resources/img/train_2.jpg" class="img-thumbnail center-block" alt=""
                            >
                            <div class="carousel-caption">
                            </div>
                        </div>


                    </div>

                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>

</div>
</div>

<div class="footer_btm"><!-- start footer_btm -->
    <div class="container">
        <div class="row  footer1">
            <div class="col-md-3">
                <div class="soc_icons">
                    <ul class="list-unstyled">
                        <li><a class="icon1" href="https://www.facebook.com"></a></li>
                        <li><a class="icon5" href="https://www.linkedin.com/in/MaksymGorinshteyn"></a></li>
                        <div class="clearfix"></div>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 copy">
                <p class="link text-right"><span>BookingService - fast and easy planning your trip</span></p>
            </div>
            <div class="col-md-5 copy">
                <p class="link text-right"><span>&#169; All rights reserved | 2016 Maksym Gorinshteyn</span></p>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker(
                {
                    pickTime: false, language: 'en',
                    minDate: '08/20/2016',
                    maxDate: '09/30/2016'
                }
        );
    });
</script>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker2').datetimepicker(
                {
                    pickTime: false, language: 'en',
                    minDate: '08/20/2016',
                    maxDate: '09/30/2016'
                }
        );
    });
</script>

<script>
    var departures = [<c:forEach items="${departure}" var="dep"> '${dep}', </c:forEach>];
    $('#search').typeahead({source: departures})
</script>

<script>
    var arrivals = [<c:forEach items="${departure}" var="dep"> '${dep}', </c:forEach>];
    $('#search1').typeahead({source: arrivals})
</script>

<script>
    $('#switcher').click(function () {
        var a = $('#search');
        var b = $('#search1');
        var temp;

        temp = a.val();
        a.val(b.val());
        b.val(temp);
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.carousel').carousel({
            interval: 3000
        })
    });
</script>
</html>