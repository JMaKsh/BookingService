<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
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
    <c:when test="${ not empty schedule }">
        <%--<div>
            <button type="submit" class="btn btn-primary" id="uah">UAH</button>
            <button type="submit" class="btn btn-primary" id="usd">USD</button>
            <button type="submit" class="btn btn-primary" id="eur">EUR</button>
            <button type="button" class="btn btn-danger" id="like" value="notThisValue">DISLIKES<span
                    class="glyphicon glyphicon-thumbs-down"></span></button>
        </div>--%>
    <div class="container">
        <div class=" row search_hd">
            <h2> please, Choose the variant of the trip below</h2>
        </div>
        <div class="row search_results">
            <div class="col-xs-12 col-sm-12col-md-12 col-lg-12 col-xl-12">
                <div class="table_search">
                    <table class="table table-responsive  table-condensed cf table-hover">
                        <thead>
                        <tr>
                            <th><b>vehicle</b></th>
                            <th><b>route</b></th>
                            <th><b>departure</b></th>
                            <th><b>duration</b></th>
                            <th><b>price</b></th>
                            <th><b>action</b></th>
                        </tr>
                        </thead>

                        <c:forEach items="${schedule}" var="sch">
                            <%-- <tr style="border: solid 3px;background-color: #c7ddef">
                                 <td class="text-center">${sch.carrier.vehicle.name}</td>
                                 <td class="text-center">${sch.carrier.fullname}</td>
                                 <td class="text-center">${sch.departure.fullname}</td>
                                 <td class="text-center">${sch.arrival.fullName}</td>
                                 <td class="text-center">${sch.date}</td>
                                 <td class="text-center">${sch.time}</td>
                                 <td class="text-center">${sch.distance}</td>
                                 <td class="text-center">${sch.duration}</td>
                                 <td class="num text-center" id="price" value="${sch.price}">${sch.price}</td>
                                 <td>
                                     <form action="/add_new_ticket" method="post">
                                         <input type="hidden" name="id" value=${sch.id}>
                                         <button type="submit" class="btn btn-primary">BOOKING</button>
                                     </form>
                                 </td>
                             </tr>--%>
                            <tr>
                                <td style="vertical-align: middle">${sch.carrier.vehicle.name}
                                    <b><p>${sch.carrier.fullname}</p></b></td>
                                <td style="vertical-align: middle"><b>${sch.departure.fullname}
                                    - ${sch.arrival.fullName}</b></td>
                                <td style="vertical-align: middle"><b>
                                    <div class="time" style="font-size:25px">${sch.time}</div>
                                </b>
                                    <p>${sch.date}</p></td>
                                <td class="travel_time" style="vertical-align: middle"><b>
                                    <div class="time" style="font-size:20px">${sch.duration}</div>
                                </b>
                                    <p>${sch.distance} km</p></td>
                                <td class="price_td" style="vertical-align:middle;font-size:20px"><b>${sch.price} UAH</b>
                                </td>
                                <td style="vertical-align: middle">
                                    <form action="/add_new_ticket" method="post">
                                        <input type="hidden" name="id" value=${sch.id}>
                                        <button type="submit" class="btn-q-search btn-primary">choose</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

            </div>
        </div>
        </c:when>
        <c:otherwise>
            <div class="no_ticket">
                <p>
                <h1> Unfortunately, there're no variants for this direction on choosen date</h1></p>
            </div>
        </c:otherwise>
        </c:choose>
    </div>
</main>
<div class="footer_btm1"><!-- start footer_btm -->
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
</html>