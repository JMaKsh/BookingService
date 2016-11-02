<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="en">
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link href="../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>


<body>
<main>
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
    <div class="content">
        <div class="register_panel">
            <h3>Use the form below to register</h3>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-lg-6 col-lg-offset-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Registration</h3>
                            </div>
                            <form class="form-horizontal" action="/add_new_user" method="POST">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-md-offset-3 col-lg-offset-3 col-xl-offset-3 login-box">
                                            <div class="input-group">
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-user"></span></span>
                                                <input type="text" class="form-control" name="name"
                                                       placeholder="Your fullname"
                                                       required
                                                       autofocus/>
                                            </div>
                                            <div class="input-group">
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-user"></span></span>
                                                <input type="text" class="form-control" name="login"
                                                       placeholder="Your login"
                                                       required/>
                                            </div>

                                            <c:if test="${code eq 520}">
                                                <div style="color: crimson"><p><b>This login is already used. Choose
                                                    another
                                                    one</b></p>
                                                </div>
                                            </c:if>


                                            <div class="input-group">
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-envelope"></span></span>
                                                <input type="text" class="form-control" name="email"
                                                       placeholder="Your e-mail"
                                                       required/>
                                            </div>

                                            <c:if test="${code eq 530}">
                                                <div style="color: crimson"><p><b>This e-mail is already used. Choose
                                                    another one</b></p>
                                                </div>
                                            </c:if>

                                            <div class="input-group">
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-lock"></span></span>
                                                <input type="password" class="form-control" name="password"
                                                       id="password1"
                                                       placeholder="Password" required/>
                                            </div>
                                            <div class="input-group">
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-lock"></span></span>
                                                <input type="password" class="form-control" name="confirmPassword"
                                                       id="password2" placeholder="Confirm password" required/>
                                            </div>

                                            <c:if test="${code eq 510}">
                                                <div style="color: crimson"><p><b>Passwords non Match!</b></p></div>
                                            </c:if>


                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-md-offset-3 col-lg-offset-3 col-xl-offset-3 ">
                                            <button type="submit" class="btn-labeled btn-success">
                                                <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>Submit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

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
</html>