<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
    <title>매출 / 매입 거래서</title>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/node_modules/font-awesome/css/font-awesome.min.css"/>
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/node_modules/jdenticon/dist/jdenticon.min.js"></script>
</head>
<body>
<div class="container mt-5">
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
                                <input name="slip_write" type="text" class="form-control" placeholder="작성자"
                                       maxlength="20" value="${slip.slip_write}">
                                <small class="form-text text-danger">
                                    ${valid_slip_write}
                                </small>
                            </div>
                        </span>

                        <div class="form-group">
                            <i class="fa far fa-calendar"></i>
                            <input name="slip_date" type="date" class="form-control" id="date"
                                   placeholder="전표등록 일자" value="${slip.slip_date}" >
                            <small class="form-text text-danger">
                                ${valid_slip_date}
                            </small>
                        </div>

                        <div class="form-group">
                            <i class="fa fas fa-tasks"></i>
                            <input name="slip_code" type="text" class="form-control" id="slipCode"
                                   placeholder="계정 코드" value="${slip.slip_code}">
                            <small class="form-text text-danger">
                                ${valid_slip_code}
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
<script>
    function registerClick() {
        alert("확인하시겠습니까?")
    }
</script>
</body>
</html>
