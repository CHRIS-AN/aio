<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>매출 / 매입 거래서</title>
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
    <div class="row mb-5">
        <span class="col-12 text-center">
           <h2><i class="fa far fa-edit"> 매출/매입 거래서</i></h2>
        </span>
    </div>
    <c:forEach items="${slipList}" var="slip">

        <div class="row justify-content-center">
            <div class="col-lg-7 mb-5">
                <form class="needs-validation" action="/finance/outstandingAuthorizationDetailView/${slip.slipId}/edit" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="container ">
                        <span class="row form-group">
                            <div class="col-4" style="">
                                <i class="fa fas fa-archive"></i>
                                <select name="tradingType" class="form-control" id="trading">
                                    <option>매출 거래</option>
                                    <option>매입 거래</option>
                                </select>
                            </div>
                            <div class="col-2"></div>
                            <div class="form-group col-6">
                                <i class="fa far fa-id-badge"></i>
                                <input name="slipWrite" type="text" class="form-control" placeholder="작성자"
                                       maxlength="20" value="${slip.slipWrite}">
                                <small class="form-text text-danger">
                                    ${valid_slipWrite}
                                </small>
                            </div>
                        </span>

                        <div class="form-group">
                            <i class="fa far fa-calendar"></i>
                            <input name="slipDate" type="date" class="form-control" id="date"
                                   placeholder="전표등록 일자" value="${slip.slipDate}" >
                            <small class="form-text text-danger">
                                ${valid_slipDate}
                            </small>
                        </div>

                        <div class="form-group">
                            <i class="fa fas fa-tasks"></i>
                            <input name="slipCode" type="text" class="form-control" id="slipCode"
                                   placeholder="계정 코드" value="${slip.slipCode}">
                            <small class="form-text text-danger">
                                ${valid_slipCode}
                            </small>
                        </div>

                        <div class="form-group">
                            <i class="fa far fa-retweet"></i>
                            <input name="corp" type="text" class="form-control" id="corp"
                                   placeholder="거래처" value="${slip.corp}">
                            <small class="form-text text-danger">
                                ${valid_corp}
                            </small>
                        </div>

                        <div class="form-group">
                            <i class="fa fas fa-dollar"></i>
                            <input name="slip_account" type="text" class="form-control" id="slipPrice"
                                   placeholder="거래 금액" value="${slip.slip_account}">
                            <small class="form-text text-danger">
                                ${valid_slip_account}
                            </small>
                        </div>

                        <div class="form-group">
                            <h6><i class="fa far fa-plus"></i>&nbsp; fees</h6>
                            <input name="slip_vat" type="text" class="form-control" id="vax"
                                   placeholder="부가세" value="${slip.slip_vat}">
                            <small class="form-text text-danger">
                                ${valid_slip_vat}
                            </small>
                        </div>

                        <div class="form-group">
                            <i class="fa fas fa-pencil"></i>
                            <input name="slip_summary" type="text" class="form-control" id="summary"
                                   placeholder="적요" value="${slip.slip_summary}">
                            <small class="form-text text-danger">
                                ${valid_slip_summary}
                            </small>
                        </div>
                        <div>
                            <i class="fa far fa-credit-card"></i>
                            <select name="paymentType" class="form-control" id="paymentType">
                                <option>현금</option>
                                <option>신한은행 213123-123-123213</option>
                                <option>하나은행 86391-11-1123321</option>
                                <option>국민은행 2552125-211221</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-outline-info mt-5" style="" onclick="registerClick()">전표 수정</button>
                    </div>
                </form>
            </div>
        </div>
    </c:forEach>
    </div>
        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->
    </div>
</div>
<script>
    function registerClick() {
        alert("확인하시겠습니까?")
    }
</script>
<!-- script -->
<jsp:include page="../layout/script.jsp" />
<!-- /script -->
</body>
</html>
