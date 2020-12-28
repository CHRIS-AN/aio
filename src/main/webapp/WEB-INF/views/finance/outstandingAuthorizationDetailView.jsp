<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>결제 대기 승인 상세보기</title>

    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/node_modules/gentelella/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/node_modules/gentelella/vendors/animate.css/animate.min.css" rel="stylesheet">
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>
    <jsp:include page="../layout/header.jsp" />

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- sidebar -->
        <jsp:include page="../layout/side-bar.jsp"/>
        <!-- /sidebar -->

        <!-- top-nav -->
        <jsp:include page="../layout/top-nav.jsp">
            <jsp:param name="empl" value="${empl}"/>
        </jsp:include>
        <!-- top-nav -->
        <div class="right_col" role="main">
            <a onclick="history.back()"><h1><i class="fa far fa-reply-all"></i></h1></a>
            <div class="row">
        <span class="col-12 text-center">
           <h2>${title}</h2>
        </span>
            </div>
            <hr>
            <c:forEach items="${slipList}" var="slip">

                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <form class="needs-validation" action="" method="get">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="container ">
                    <span class="row form-group">
                        <div class="col-4 mt-3" style="">
                            <i class="fa fas fa-archive"></i>
                            <label>거래타입</label><br>
                            :${slip.tradingType}
                        </div>
                        <div class="col-4"></div>
                        <div class="form-group col-4 mt-3">
                            <i class="fa far fa-id-badge"></i>
                            <label>작성자</label><br>
                            :  ${slip.slipWrite}
                        </div>
                    </span>

                                <div class="form-group mt-2">
                                    <i class="fa far fa-calendar"></i>
                                    <label>전표 등록 일자</label><br>
                                    : ${slip.slipDate}
                                </div>

                                <div class="form-group mt-2">
                                    <i class="fa fas fa-tasks"></i>
                                    <label>계정 과목</label><br>
                                    : ${slip.slipCode}
                                </div>

                                <div class="form-group mt-2">
                                    <i class="fa far fa-retweet"></i>
                                    <label>거래처</label><br>
                                    : ${slip.corp}
                                </div>

                                <span class="row form-group">
                        <div class="col-4 mt-2" style="">
                           <i class="fa fas fa-dollar"></i>
                            <label>거래 금액</label><br>
                            :  ${slip.slip_account}
                        </div>
                        <div class="col-4"></div>
                        <div class="form-group col-4 mt-2">
                           <i class="fa far fa-plus"></i>
                            <label>부가세</label><br>
                            :${slip.slip_vat}
                        </div>
                    </span>

                                <div class="form-group mt-1">
                                    <i class="fa fas fa-pencil"></i>
                                    <label>적요</label><br>
                                    : ${slip.slip_summary}
                                </div>
                                <div>
                                    <i class="fa far fa-credit-card"></i>
                                    <label>결제 방식</label><br>
                                    : ${slip.paymentType}
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </c:forEach>

            <c:forEach items="${slipList}" var="slip">
                <div class="container mt-5">
            <span class="row justify-content-center">

                <div class="col-3"></div>

                <div class="form-group col-4">
                    <a href="/finance/outstandingAuthorizationDetailView/${slip.slipId}/edit"
                       class="btn btn-primary" role="button">eidt</a>
                </div>


                <div class="form-group col-4">
                    <form id="delete-form" action="/finance/outstandingAuthorizationDetailView/delete" method="post">
                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                         <span class="row form-group">
                            <div class="col-6" style="">
                                <button type="submit" class="btn btn-primary">delete</button>
                                <input type="hidden" value="${slip.slipId}" name="slipId">
                            </div>
                            <div class="col-3"></div>
                         </span>
                    </form>
                </div>
            </span>
                </div>
            </c:forEach>
        </div>
        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->
    </div>
</div>
</div>
<!-- script -->
<jsp:include page="../layout/script.jsp" />
<!-- /script -->
</body>
</html>
