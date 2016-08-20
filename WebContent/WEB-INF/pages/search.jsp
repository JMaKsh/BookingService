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
</head>
<body style="height: 100%;background: url(../../resources/img/background.jpg) no-repeat center center fixed">

<div class="container" style="background-color:#6957ff;height:60px;margin-bottom: 50px">
    <div class="row">
        <div class="col-xs-2 col-md-2">
            <c:url value="/" var="indexURL"/>
            <a href="${indexURL}">
                <div style="padding-top:15px;color: #FFFAFA"> HOME</div>
            </a>
        </div>
        <div class="col-xs-2 col-md-2">
            <c:url value="/submitpage" var="submitURL"/>
            <a href="${submitURL}">
                <div style="text-align: right;padding-top:15px;color: #FFFAFA"> My tickets</div>
            </a>
        </div>
        <div class=" col-xs-2 col-md-2 ">
            <c:url value="/userpage" var="userpageUrl"/>
            <a href="${userpageUrl}">
                <div style="text-align: right;padding-top: 15px;color: #FFFAFA"> Cabinet</div>
            </a>
        </div>
        <sec:authorize access="!isAuthenticated()">
            <div class=" col-xs-2 col-md-2 ">
                <c:url value="/login" var="loginUrl"/>
                <a href="${loginUrl}">
                    <div style="text-align: right;padding-top: 15px;color: #FFFAFA"> Login</div>
                </a>
            </div>
            <div class=" col-xs-2 col-md-2 ">
                <c:url value="/registration" var="rigistUrl"/>
                <a href="${rigistUrl}">
                    <div style="text-align: right;padding-top: 15px;color: #FFFAFA"> Registration</div>
                </a>

            </div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class=" col-xs-2 col-md-2 ">
                <c:url value="/logout" var="logoutUrl"/>
                <a href="${logoutUrl}">
                    <div style="text-align: right;padding-top: 15px;color: #FFFAFA"> LogOut</div>
                </a>
            </div>
        </sec:authorize>
    </div>
</div>
<c:choose>
<c:when test="${ not empty schedule }">

<div class="container" style="margin-bottom: 50px;margin-top:30px; min-height: 100%">

    <table class="table table-striped table-responsive table-bordered table-hover" style="border: solid 3px;">
        <thead>
        <tr style="border: solid 3px; background-color: #c7ddef">
            <th class="text-center"><b>VEHICLE</b></th>
            <th class="text-center"><b>CARRIER</b></th>
            <th class="text-center"><b>FROM</b></th>
            <th class="text-center"><b>TO</b></th>
            <th class="text-center"><b>Date</b></th>
            <th class="text-center"><b>Time</b></th>
            <th class="text-center"><b>DISTANCE</b></th>
            <th class="text-center"><b>TRIP DURATION</b></th>
            <th class="text-center"><b>Price</b></th>
            <th class="text-center"><b>Action</b></th>
        </tr>
        </thead>

        <c:forEach items="${schedule}" var="sch">
            <tr style="border: solid 3px;background-color: #c7ddef">
                <td class="text-center">${sch.carrier.vehicle.name}</td>
                <td class="text-center">${sch.carrier.fullname}</td>
                <td class="text-center">${sch.departure.fullname}</td>
                <td class="text-center">${sch.arrival.fullName}</td>
                <td class="text-center">${sch.date}</td>
                <td class="text-center">${sch.time}</td>
                <td class="text-center">${sch.distance}</td>
                <td class="text-center">${sch.duration}</td>
                <td class="num text-center"id="price" value ="${sch.price}">${sch.price}</td>
                <td>
                    <form action="/add_new_ticket" method="post">
                        <input type="hidden" name="id" value=${sch.id}>
                        <button type="submit" class="btn btn-primary">BOOKING</button>
                    </form>
                </td>
            </tr>
        </c:forEach>


    </table>
  </c:when>
    <c:otherwise>
        <div align="center">
       <p><h1> Unfortunately, there're no variants for this direction on choosen date</h1></p>
            </div>
    </c:otherwise>
        </c:choose>
</div>



<div class="footer" style="position:absolute;bottom: 0px; padding-left: 85px">
    <div class="container clearfix" style="height: auto;background-color:#708090;margin-top: 50px">
        <div class="footetColumn pull-left">
            <div class="footetColumn header">
                <c:url value="/" var="indexURL"/>
                <a href="${indexURL}">
                    <div style="padding-top:15px;color: #FFFAFA"> HOME</div>
                </a></div>
            <div class="footetColumn header">
                <c:url value="/submitpage" var="submitUrl"/>
                <a href="${submitUrl}">
                    <div style="padding-top: 15px;color: #FFFAFA"> My tickets</div>
                </a>
            </div>
            <div class="footetColumn header">
                <c:url value="/userpage" var="userpageUrl"/>
                <a href="${userpageUrl}">
                    <div style="padding-top: 15px;color: #FFFAFA"> Cabinet</div>
                </a>
            </div>
            <sec:authorize access="!isAuthenticated()">
                <div class="footetColumn header">
                    <c:url value="/login" var="loginUrl"/>
                    <a href="${loginUrl}">
                        <div style="padding-top: 15px;color: #FFFAFA"> Login</div>
                    </a>

                    <c:url value="/registration" var="rigistUrl"/>
                    <a href="${rigistUrl}">
                        <div style=";padding-top: 15px;color: #FFFAFA"> Registration</div>
                    </a>
                </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <div class="footetColumn header">
                    <c:url value="/logout" var="logoutUrl"/>
                    <a href="${logoutUrl}">
                        <div style="padding-top: 15px;color: #FFFAFA"> LogOut</div>
                    </a>
                </div>
            </sec:authorize>
        </div>
    </div>
</div>
</body>

</html>