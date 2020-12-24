<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- head -->
<jsp:include page="layout/header.jsp" />
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
            </div>
            <!-- /content -->

            <!-- footer  -->
            <jsp:include page="layout/footer.jsp" />
            <!-- /footer  -->

        </div>
    </div>
<!-- script -->
    <jsp:include page="layout/script.jsp" />
<!-- /script -->
</body>
</html>
