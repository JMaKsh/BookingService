<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserPage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"
            integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7"
            crossorigin="anonymous"></script>
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
    </div>
</div>
<main>
    <c:choose>
        <c:when test="${ not empty subticket}">

            <c item="${username}" var="user"></c>
            <div class="container cabinet">
                <h3>Thank you for planning your travel with our service!</h3>

                <h3><b>Our manager will contact you shortly</b></h3>

                <c:forEach items="${subticket}" var="subticket">
                    <div class="row">
                        <div class="col-xs-11 col-sm-11 col-md-7 col-lg-7 col-xl-7 col-md-offset-2 col-lg-offset-2 col-xl-offset-2 ticket-info">
                            <table class="book-tc table-responsive  table-condensed cf">

                                <tr>
                                    <td><u> Order # <b>00554${subticket.id}</b></u></td>
                                    <td> Date of booking: <u>${subticket.createdDate}</u></td>

                                </tr>
                                <tr>
                                    <td> Customer:</td>
                                    <td> <b>${user.name}</b></td>
                                </tr>
                                <tr>
                                    <td>destination:
                                    </td>
                                    <td><b>${subticket.schedule.departure.fullname}
                                        - ${subticket.schedule.arrival.fullName}</b></td>
                                </tr>

                                <tr>
                                    <td>departure time:
                                    </td>
                                    <td><b>${subticket.schedule.time} ${subticket.schedule.date}</b></td>
                                </tr>

                                <tr>
                                    <td><b>${subticket.schedule.carrier.fullname}</b>
                                    </td>
                                    <td>
                                        <div class="price-f"><b>${subticket.schedule.price} UAH</b></div>
                                    </td>
                                </tr>

                            </table>
                        </div>


                    </div>
                </c:forEach>
            </div>
            <div class = "container cabinet">

                <h2><b>Enjoy your trip!</b></h2>
            </div>



        </c:when>
        <c:otherwise>
            <div class="row no_ticket">
                <p>
                <h1> There're no booked tickets.</h1>
            </div>
        </c:otherwise>
    </c:choose>
    <div class="clearfix"></div>

</main>
<div class="footer_btm"><!-- start footer_btm -->
    <div class="container">
        <div class="row  footer1">
            <div class="col-md-3">
                <div class="soc_icons">
                    <ul class="list-unstyled">
                        <li><a class="icon1" href="https://www.facebook.com"></a></li>
                        <li><a class="icon5" href="https://www.linkedin.com/in/MaksymGorinshteyn"></a></li>

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

</html>