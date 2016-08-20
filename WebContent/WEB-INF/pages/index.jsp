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
</head>


<body>
<div style="background: url(../../resources/img/background.jpg) no-repeat center center fixed">
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
    <div class="container" style="margin-bottom: 50px; text-align: center">
        <p><h3>For test: Min date:08/20/2016; Max date: 09/30/2016</h3></p>
        </div>

    <div class="container" style="background-color:#ccc;margin-bottom: 50px">
        <form role="form" action="/search" method="post">
            <legend>Let's make a booking</legend>
            <div class="row">
                <div class="col-sm-4 col-md-4">
                    <input type="text" class="span3" id="search" data-provide="typeahead" data-items="4" required
                           style="width:300px" placeholder="From" name="from" autocomplete="off">
                </div>
                <div class="col-sm-1 col-md-1">
                    <img src="../../resources/img/swap.png" id="switcher" style="cursor:pointer">

                </div>
                <div class="col-sm-4 col-md-4">
                    <input type="text" class="span3" id="search1" data-provide="typeahead" data-items="4" required
                           style="width:300px" placeholder="To" name="to" autocomplete="off">
                </div>

                <div class=" col-sm-1 col-md-1">
                    <input type="text" class="form-control" id="datetimepicker1" required style="width:120px"
                           placeholder="Date" name="date" readonly="readonly"/>
                </div>
            </div>

            <div class="col-sm-1 col-md-1 col-sm-offset-10 col-md-offset-10">
                <button type="submit" class="btn btn-primary">SEARCH</button>
            </div>


        </form>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-md-6" style="background-color:antiquewhite">
                <h1>Most popular directions</h1>
                <form role="form" action="/quicksearch" method="post">
                    <div class="table-responsive" style="max-width: 100%; overflow: auto;">
                        <table class="table table-responsive  table-condensed cf table-hover">

                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="1" checked="checked">Kyiv
                                            <span class="glyphicon glyphicon-arrow-right"></span>Odesa
                                        </label>
                                    </div>

                                </td>
                                <td style="vertical-align:middle;color:red" align="center"><b>from 232.02 UAH</b></td>

                            </tr>

                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="2">Kyiv
                                            <span class="glyphicon glyphicon-arrow-right"></span>Lviv
                                        </label>
                                    </div>

                                </td>
                                <td style="vertical-align:middle;color:red" align="center"><b>from 265.10 UAH</b></td>

                            </tr>
                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="3">Kyiv
                                            <span class="glyphicon glyphicon-arrow-right"></span>Kharkiv
                                        </label>
                                    </div>
                                </td>
                                <td style="vertical-align:middle;color:red" align="center"><b>from 155.50 UAH</b></td>

                            </tr>
                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="4">Kyiv
                                            <span class="glyphicon glyphicon-arrow-right"></span>Dnipro
                                        </label>
                                    </div>
                                </td>
                                <td style="vertical-align:middle;color:red" align="center"><b>from 158.50 UAH</b></td>

                            </tr>

                            <tr>
                                <td>
                                    <div class="radio">
                                        <label><input type="radio" name="optradio" value="5">Kyiv
                                            <span class="glyphicon glyphicon-arrow-right"></span>Uzhorod
                                        </label>
                                    </div>
                                </td>
                                <td style="vertical-align:middle;color:red" align="center"><b>from 450.12 UAH</b></td>

                            </tr>
                        </table>
                        <div align="center">
                            <input type="text" class="span3" id="datetimepicker2" required style="width:10x"
                                   placeholder="Date" name="date"/>
                            <button type="submit" class="btn btn-primary">SEARCH</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6">
                <img class="img-responsive" src="../../resources/img/reasons.jpg" max-width="570" max-height="410">
            </div>
        </div>
    </div>
    <!-- =============Slider=================== -->


    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">

                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="../../resources/img/UIA_f.jpg" class="img-thumbnail center-block" alt=""
                             width="920"
                             height="690">
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <img src="../../resources/img/gunsel_f.jpg" class="img-thumbnail center-block" alt=""
                             width="920" height="690">
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <img src="../../resources/img/autolux_f.jpg" class="img-thumbnail center-block" alt=""
                             width="920" height="690">
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <img src="../../resources/img/railway_f.jpg" class="img-thumbnail center-block" alt="Flower"
                             width="920" height=" 690">
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
        </div>
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