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

        <div class="container" style="background-color:#ccc;margin-bottom: 200 px; width: 300px">
        <c:url value="/j_spring_security_check" var="loginUrl"/>
        <form action="${loginUrl}" method="post">
            <h2 class="form-signin-heading">Please sign in</h2>
            <input type="text" class="form-control" name="j_username" placeholder="Login" required autofocus>
            <input type="password" class="form-control" name="j_password" placeholder="Password" required>
            <button class="btn btn-lg btn-primary btn-block" type="submit">LogIn</button>

            <c:if test="${param.error ne null}">
                <div style="color: crimson"><p>Wrong login or password!</p></div>
            </c:if>
        </form>

        <h2 class="form-signin-heading" style="text-align: center">OR</h2>
        <c:url value="/registration" var="registerUrl"/>
        <form action="${registerUrl}" method="get">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
        </form>
    </div>
    <div class="footer" style="position: absolute;bottom: 0px; padding-left: 75px">
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