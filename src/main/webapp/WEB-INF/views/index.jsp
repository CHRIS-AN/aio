<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- head -->
<jsp:include page="layout/header.jsp"/>
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
        /*background-color: rgb(51, 122, 183);*/
        color: black;

    }

    .weather-pannel small, .weather-pannel i {
        color: black;
    }

    .text-right {
        text-align: right;
    }

    .w-span {
        font-size: 20px;
        color: white;
    }

    .x_title span {
        color: black;
    }
    .x_title {
        border-bottom: none;
    }

    .nav-md .container.body .right_col {
        padding: 100px 3.5em;
    }
    .m-auto {
        margin-left: auto;
        margin-right: auto;
        margin: 0 auto;
    }
    .weather-box {
        right: 50px;
        top: 100px;
        width: 20%;
        position: fixed;

    }
    .attd-top-box {
        width: 20%;
        min-width: 300px;
        margin: 0 auto;

    }
    .attd-mid-box {
        background: none;
        border-radius: 10px;
        box-shadow: 0px 0px 5px #777777;
    }
    .flex-box {
        position: relative;
        display: flex;
        align-items: center;
        height: 70%;
    }
    h4 {
        display: inline-block;
    }
    #clock {
        float: right;
        margin-top: 10px;
    }
    .title {
        position: fixed;
        margin: 1.5em;
        color: #372C81;
    }
    .title h1 {
        font-size: 40px;
    }
    .title span {
        font-size: 20px;
    }
    #snowBox {
        margin-top: 1.5em;
        height: 120px;
    }
    #snowBox {
        background-image: url("/images/people.png");
        background-size: cover;
    }
</style>
</head>
<!-- head -->
<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <!-- sidebar -->
        <jsp:include page="layout/side-bar.jsp"/>
        <!-- /sidebar -->

        <!-- top-nav -->
        <jsp:include page="layout/top-nav.jsp">
            <jsp:param name="empl" value="${empl}"/>
        </jsp:include>
        <!-- top-nav -->
        <!-- content -->
        <div class="right_col" role="main">
            <div class="title">
                <h1>Olive Bro <span> AIO ©</span></h1>
                <div id="snowBox">
                </div>
                <div id="avatar">
<%--                    <img width="200px" src="/images/people.jpg"/>--%>
                </div>
            </div>
            <div class="flex-box">
                <div class="attd-top-box">
                    <div class="x_panel attd-mid-box">
                        <div class="x_content">
                            <div id="attdBox" class="">
                                <h4>출근/퇴근</h4>
                                <span id="clock"></span>
                                <br>
                                <br>
                                <div class="col-md-6">
                                <c:if test="${empl.goWork}">
                                    <div class="col-md-12 text-center">
                                        <a href="#" class="btn" style="background: #777777; color: white">출근</a>
                                    </div>
                                </c:if>
                                <c:if test="${!empl.goWork}">
                                    <div class="col-md-12 text-center">
                                        <a href="/work/gowork" class="btn" style="background: #2727c4; color: white">출근</a>
                                    </div>
                                </c:if>
                                <div id="chkBox" class="col-md-12 text-center">
                                    <c:forEach items="${workDates}" var="date">
                                        <c:if test="${date.attendance eq '출근'}">
                                            <label>${date.calWorkDate}</label>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                </div>
                                <div class="col-md-6">
                                <c:if test="${empl.goHome}">
                                    <div class="col-md-12 text-center">
                                        <a href="#" class="btn" style="background: #777777; color: white">퇴근</a>
                                    </div>
                                </c:if>
                                <c:if test="${!empl.goHome}">
                                    <div class="col-md-12 text-center">
                                        <a href="/work/gohome" class="btn"
                                           style="background: #d70000; color: white">퇴근</a>
                                    </div>
                                </c:if>

                                <div id="chkBox" class="col-md-12 text-center">
                                    <c:forEach items="${workDates}" var="date">
                                        <c:if test="${date.attendance eq '퇴근'}">
                                            <label>${date.calWorkDate}</label>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="weather-box">
                <div class="weather-pannel">
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
<%--                    <div class="x_content">--%>
<%--                        <div class="col-md-4">--%>
<%--                            <div class="row text-center mt-2">--%>
<%--                                <span class="w-span mt-2"><i class="fas fa-wind"></i></span><br/>--%>
<%--                                <h5 id="windy"></h5>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4">--%>
<%--                            <div class="row text-center mt-2">--%>
<%--                                <span class="w-span mt-2"><i class="fas fa-tint"></i></span><br/>--%>
<%--                                <h5 id="waterDrop"></h5>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4">--%>
<%--                            <div class="row text-center mt-2">--%>
<%--                                <span class="w-span mt-2"><i class="fas fa-cloud-upload-alt"></i></span><br/>--%>
<%--                                <h5 id="cloudy"></h5>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
        <!-- /content -->

        <!-- footer  -->
        <jsp:include page="layout/footer.jsp"/>
        <!-- /footer  -->

    </div>
</div>
<script type="application/javascript">
    var clock = $("#clock");
    var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=" + "6a450e4848c92eaf1d0d9c7fd313f05d";
    $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function (resp) {
            var img_url = 'http://openweathermap.org/img/wn/' + resp.weather[0].icon + '@2x.png';
            console.log(resp);
            console.log("현재온도 : " + (resp.main.temp - 273.15));
            console.log("현재습도 : " + resp.main.humidity);
            console.log("날씨 : " + resp.weather[0].main);
            console.log("상세날씨설명 : " + resp.weather[0].description);
            console.log("날씨 이미지 : " + resp.weather[0].icon);
            console.log("바람   : " + resp.wind.speed);
            console.log("나라   : " + resp.sys.country);
            console.log("도시이름  : " + resp.name);
            console.log("구름  : " + (resp.clouds.all) + "%");
            $("#weatherIcon").attr("src", img_url)
            $("#temp").html(Math.floor(resp.main.temp - 273.15) + " ℃");
            $("#weather").html(resp.weather[0].description);
            $("#city").html(resp.name + ", " + resp.sys.country);
            $("#windy").html(resp.wind.speed + " m/s");
            $("#waterDrop").html(resp.main.humidity + " %");
            $("#cloudy").html(resp.clouds.all + " %");

        }
    });
    function getTime(){
        const time = new Date();
        let hour = time.getHours();
        let minutes = time.getMinutes();
        let seconds = time.getSeconds();
        if (hour < 10){
            hour = "0" + hour;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }

        clock.html(hour +":" + minutes + ":"+seconds);
    }
    function init(){
        setInterval(getTime, 1000);
    }
    getTime();
    init();
</script>
<script src='https://unpkg.com/magic-snowflakes/dist/snowflakes.min.js'></script>
<script>

    var sf = new Snowflakes({
        color: '#372C81',
        count: 50, // 갯수
        container: document.querySelector('#snowBox'),
        minSize: 2,
        maxSize: 10,
        speed: 0.3,
        minOpacity: 1, // 최소 투명도 0: 투명 | 1: 불투명
        maxOpacity: 1, // 최대 투명도
        zIndex: 9999
    });
</script>
<!-- script -->
<jsp:include page="layout/script.jsp"/>
<!-- /script -->
</body>
</html>
