<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="en">
<head>
    <title>Registration</title>
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
    <div class="container">

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <p class="text-center"><h2><b>Use the form below to register</b></h2></p>
                <form class="form-horizontal" action="/add_new_user" method="POST">
                    <input type="text" id="username" name="name" placeholder="Your fullname" class="input-lg form-control" autocomplete="off" required>
                    <div class="row">
                        <div class="col-sm-12">
                            <p><b>Enter your fullname</b></p>
                        </div>
                    </div>
                    <input type="text" id="login" name="login" placeholder="Your login" class="input-lg form-control" autocomplete="off" required>
                    <div class="row">
                        <c:if test="${code eq 520}">
                            <div style="color: crimson"><p><b>This login is already used. Choose another one</b></p></div>
                        </c:if>
                        <div class="col-sm-12">
                            <p><b>Enter your login. It needs for autorization</b></p>
                        </div>
                    </div>
                    <input type="text" id="email" name="email" placeholder="Your e-mail" class="input-lg form-control" required>
                    <div class="row">
                        <c:if test="${code eq 530}">
                            <div style="color: crimson"><p><b>This e-mail is already used. Choose another one</b></p></div>
                        </c:if>
                        <div class="col-sm-12">
                            <p><b>Enter your e-mail</b></p>
                        </div>
                    </div>
                    <input type="password" class="input-lg form-control" name="password" id="password1" placeholder="Password" autocomplete="off" required>
                    <div class="row">
                        <div class="col-sm-12">
                            <p><b>Enter your password</b></p>
                        </div>
                    </div>
                    <input type="password" class="input-lg form-control" name="confirmPassword" id="password2" placeholder="Confirm Password" autocomplete="off" required>
                    <div class="row">
                        <div class="col-sm-12">
                            <c:if test="${code eq 510}">
                                <div style="color: crimson"><p><b>Passwords non Match!</b></p></div>
                            </c:if>
                            <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> <b>Passwords Match</b>
                        </div>
                    </div>
                    <input type="submit" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Adding new user..." value="Submit">
                </form>
            </div>
        </div><
    </div>
        <div class="footer">
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
</div>
<script>
    $("input[type=password]").keyup(function(){
            if($("#password1").val() == $("#password2").val()){
            $("#pwmatch").removeClass("glyphicon-remove");
            $("#pwmatch").addClass("glyphicon-ok");
            $("#pwmatch").css("color","#00A41E");
        }else{
            $("#pwmatch").removeClass("glyphicon-ok");
            $("#pwmatch").addClass("glyphicon-remove");
            $("#pwmatch").css("color","#FF0004");
        }
    });
</script>
</body>
</html>