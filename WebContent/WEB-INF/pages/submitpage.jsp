<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>Authorization</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body style="background: url(../../resources/img/background.jpg) no-repeat center center fixed">

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
    <c:when test="${ not empty subticket}">

        <c item="${username}" var="user"></c>

    <div align="center">
        <p><h3>Thank you for planning yor travel with our service!</h3></p>
        <p><h3>Enjoy your trip!</h3></p>
    </div>
<c item="${username}" var="user"></c>
<div align="center">
    <p><h2>Your booked tickets, ${user.name}:</h2></p>
</div>
<div class="container" style="margin-bottom: 50px;margin-top:30px; min-height: 100%">

    <table class="table table-striped table-responsive table-bordered table-hover" style="border: solid 3px;" >
        <thead>
        <tr style="border: solid 3px; background-color: #c7ddef">
            <th class="text-center"><b>Date of BOOKING</b></th>
            <th class="text-center"><b>VEHICLE</b></th>
            <th class="text-center"><b>CARRIER</b></th>
            <th class="text-center"><b>FROM</b></th>
            <th class="text-center"><b>TO</b></th>
            <th class="text-center"><b>Date</b></th>
            <th class="text-center"><b>Time</b></th>
            <th class="text-center"><b>DISTANCE</b></th>
            <th class="text-center"><b>TRIP DURATION</b></th>
            <th class="text-center"><b>Price</b></th>

        </tr>
        </thead>

        <c:forEach items="${subticket}" var="subticket">
            <tr style="border: solid 3px;background-color: #c7ddef">
                <td class="text-center">${subticket.createdDate}</td>
                <td class="text-center">${subticket.schedule.carrier.vehicle.name}</td>
                <td class="text-center">${subticket.schedule.carrier.fullname}</td>
                <td class="text-center">${subticket.schedule.departure.fullname}</td>
                <td class="text-center">${subticket.schedule.arrival.fullName}</td>
                <td class="text-center">${subticket.schedule.date}</td>
                <td class="text-center">${subticket.schedule.time}</td>
                <td class="text-center">${subticket.schedule.distance}</td>
                <td class="text-center">${subticket.schedule.duration}</td>
                <td class="text-center">${subticket.schedule.price}</td>

            </tr>
        </c:forEach>


    </table>
    </div>
</c:when>
<c:otherwise>
    <div align="center">
        <p><h1> There're no your booked tickets.</h1></p>
    </div>
</c:otherwise>
</c:choose>
<div class="footer" style="position: absolute;bottom: 0px; padding-left: 100px">
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