<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- head -->
<jsp:include page="layout/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<style>
    .mt-5 {
        margin-top: 2em;
    }
    .mt-2 {
        margin-top: 1em;
    }
    .my-5 {
        margin-top: 2em;
        margin-bottom: 2em;
    }
    .weather-pannel {
        background-color : rgb(51,122,183);
        color: white;
    }
    .weather-pannel small, .weather-pannel i {
        color: white;
    }
    .text-right {
        text-align: right;
    }
    .w-span {
        font-size: 30px;
        color: white;
    }
    .x_title span {
        color: white;
    }

</style>
</head>
<!-- head -->
<body class="nav-md">
    <div class="container body">
        <div class="main_container">

            <!-- sidebar -->
            <jsp:include page="layout/side-bar.jsp" />
            <!-- /sidebar -->

            <!-- top-nav -->
            <jsp:include page="layout/top-nav.jsp" >
                <jsp:param name="empl" value="${empl}"/>
            </jsp:include>
            <!-- top-nav -->


            <!-- content -->
            <div class="right_col" role="main">
                <div class="col-md-12 my-5">
                    <h1>AIO <small>All In One</small></h1>
                </div>
                <div class="col-md-5 col-lg-5 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>출퇴근 <small>출퇴근 하기 전 꼭 체크하세요!</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="chkBox" class="row text-center">
                                <label>${workDate}</label>
                            </div>
                            
                            <div id="attdBox" class="">
                                <c:if test="${empl.goWork}">
                                    <div class="col-md-6 text-right">
                                        <a href="#" class="btn" style="background: #777777; color: white">출근</a>
                                    </div>
                                </c:if>
                                <c:if test="${!empl.goWork}">
                                    <div class="col-md-6 text-right">
                                        <a href="/work/gowork" class="btn" style="background: blue; color: white">출근</a>
                                    </div>
                                </c:if>
                                <c:if test="${empl.goHome}">
                                    <div class="col-md-6 text-left">
                                        <a href="#" class="btn" style="background: #777777; color: white">퇴근</a>
                                    </div>
                                </c:if>
                                <c:if test="${!empl.goHome}">
                                    <div class="col-md-6 text-left">
                                        <a href="/work/gohome" class="btn" style="background: purple; color: white">퇴근</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <div class="x_panel weather-pannel">
                        <div class="x_title">
                            <img class="col-md-4" id="weatherIcon" src="">
                            <div class="col-md-8 mt-5">
                                <div class="row text-right ">
                                    <span id="temp" class="w-span"></span>
                                </div>
                                <div class="row text-right">
                                    <span id="weather" class="w-span"></span>
                                </div>
                                <div class="row text-right">
                                    <span id="city" class="w-span"></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="col-md-4">
                                <div class="row text-center mt-2">
                                    <span class="w-span mt-2"><i class="fas fa-wind"></i></span><br />
                                    <h5 id="windy"></h5>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row text-center mt-2">
                                    <span class="w-span mt-2"><i class="fas fa-tint"></i></span><br />
                                    <h5 id="waterDrop"></h5>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row text-center mt-2">
                                    <span class="w-span mt-2"><i class="fas fa-cloud-upload-alt"></i></span><br />
                                    <h5 id="cloudy"></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /content -->

            <!-- footer  -->
            <jsp:include page="layout/footer.jsp" />
            <!-- /footer  -->

        </div>
    </div>
    <script type="application/javascript">
        var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid="+"6a450e4848c92eaf1d0d9c7fd313f05d";
        $.ajax({
            url: apiURI,
            dataType: "json",
            type: "GET",
            async: "false",
            success: function(resp) {
                var img_url='http://openweathermap.org/img/wn/' + resp.weather[0].icon + '@2x.png';
                console.log(resp);
                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
                console.log("현재습도 : "+ resp.main.humidity);
                console.log("날씨 : "+ resp.weather[0].main );
                console.log("상세날씨설명 : "+ resp.weather[0].description );
                console.log("날씨 이미지 : "+ resp.weather[0].icon );
                console.log("바람   : "+ resp.wind.speed );
                console.log("나라   : "+ resp.sys.country );
                console.log("도시이름  : "+ resp.name );
                console.log("구름  : "+ (resp.clouds.all) +"%" );
                $("#weatherIcon").attr("src", img_url)
                $("#temp").html(Math.floor(resp.main.temp - 273.15) + " ℃");
                $("#weather").html(resp.weather[0].description);
                $("#city").html(resp.name + ", " +  resp.sys.country);
                $("#windy").html(resp.wind.speed + " m/s");
                $("#waterDrop").html(resp.main.humidity + " %");
                $("#cloudy").html(resp.clouds.all + " %");

            }
        });
    </script>
<!-- script -->
    <jsp:include page="layout/script.jsp" />
<!-- /script -->
</body>
</html>
