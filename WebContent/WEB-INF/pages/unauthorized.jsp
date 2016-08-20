<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>ACCSESS DENIED</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"
            integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
          integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
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
<div align="center">
    <p><h1> Unfortunately, ACCSESS DENIED!</h1></p>
</div>
</body>
</html>