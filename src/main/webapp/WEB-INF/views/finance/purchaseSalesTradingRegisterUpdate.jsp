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
           <h2><i class="fa far fa-edit">${title}</i></h2>
        </span>
    </div>
    <c:forEach items="${slipList}" var="slip">

        <div class="row justify-content-center">
            <div class="col-lg-7 mb-5">
                <form class="needs-validation form-horizontal"
                      action="/finance/outstandingAuthorizationDetailView/${slip.slipId}/edit" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="container ">
                        <div class="form-group">
                            <div class="col-md-5">
                                <span class="fa fas fa-archive form-control-feedback left"></span>
                                <select name="tradingType"  class="form-control has-feedback-left"
                                        id="tradingType" onchange="tradingTypeKindChange(this)" >
<%--                                    <option disabled selected>${slip.tradingType}&nbsp;&nbsp;&nbsp;*수정전</option>--%>
                                    <option value="지출 결과서" ${slip.tradingType == '지출 결과서'? 'selected' : ''} >지출 결과서</option>
                                    <option value="입금 보고서" ${slip.tradingType == '입금 보고서'? 'selected' : ''} >입금 보고서</option>
                                    <option value="매출 거래" ${slip.tradingType == '매출 거래'? 'selected' : ''} >매출 거래</option>
                                    <option value="매입 거래" ${slip.tradingType == '매입 거래'? 'selected' : ''} >매입 거래</option>
                                </select>
                                <small class="form-text text-danger">
                                        ${valid_tradingType}
                                </small>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="form-group col-md-5">
                                <span class="glyphicon glyphicon-user form-control-feedback left"></span>
                                <input name="slipWrite" type="text" class="form-control has-feedback-left"
                                       placeholder="작성자" readonly
                                       maxlength="20" value="${slip.slipWrite}">
                                <small class="form-text text-danger">
                                        ${valid_slipWrite}
                                </small>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <span class="fa far fa-calendar form-control-feedback left"></span>
                                <input name="slipDate" type="date" class="form-control has-feedback-left"
                                       id="date"
                                       placeholder="전표등록 일자" value="${slip.slipDate}">
                                <small class="form-text text-danger">
                                        ${valid_slipDate}
                                </small>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <span class="fa fas fa-tasks form-control-feedback left"></span>
                                <select name="slipCode" class="form-control has-feedback-left"
                                        id="slipCode">
                                    <option readonly selected>${slip.slipCode}</option>
                                </select>

                                <small class="form-text text-danger">
                                        ${valid_slipCode}
                                </small>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-group col-md-4">
                                <span class="fa far fa-retweet form-control-feedback left"></span>
                                <c:choose>
                                    <c:when test="${empty slip.corp}">
                                        <select name="corp" class="form-control has-feedback-left">
                                            <option disabled selected>거래처를 입력하세요</option>
                                            <c:forEach items="${corpList}" var="corp">
                                                <option value="${corp.corp_id}">${corp.corpName}</option>
                                            </c:forEach>
                                        </select>
                                        <small class="form-text text-danger">
                                                ${valid_corp}
                                        </small>
                                    </c:when>

                                    <c:when test="${not empty slip.corp}">
                                        <select name="corp" class="form-control has-feedback-left">
                                            <c:forEach items="${corpList}" var="corp">
                                                <option value="${corp.corp_id}">${corp.corpName}</option>
                                            </c:forEach>
                                        </select>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <i class="fa fas fa-dollar form-control-feedback left"></i>
                                <input name="slip_account" type="text" class="form-control has-feedback-left"
                                       id="money" onkeyup="numberWithCommas(this.value)"
                                       placeholder="거래 금액" value="${slip.slip_account}">
                                <small class="form-text text-danger">
                                        ${valid_slip_account}
                                </small>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <i class="fa far fa-plus form-control-feedback left"></i>
                                <input name="slip_vat" type="text" class="form-control has-feedback-left"
                                       id="moneyVAT" onkeyup="numberWithCommas(this.value)"
                                       placeholder="부가세" value="${slip.slip_vat}">
                                <small class="form-text text-danger">
                                        ${valid_slip_vat}
                                </small>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <i class="fa fas fa-pencil form-control-feedback left"></i>
                                <input name="slip_summary" type="text" class="form-control has-feedback-left"
                                       id="summary"
                                       placeholder="적요" value="${slip.slip_summary}">
                                <small class="form-text text-danger">
                                        ${valid_slip_summary}
                                </small>
                            </div>
                        </div>

                        <div>
                            <div class="col-md-12">
                                <i class="fa far fa-credit-card"></i>
                                <select name="paymentType" class="form-control" id="paymentType">
<%--                                    <option disabled selected>${slip.paymentType}&nbsp;&nbsp;&nbsp;*수정전</option>--%>
                                    <option ${slip.paymentType == '현금'? 'selected' : ''}>현금</option>
                                    <option ${slip.paymentType == '신한은행 23123-144-993213 안정민'? 'selected' : ''}>신한은행 23123-144-993213 안정민</option>
                                    <option ${slip.paymentType == '하나은행 86391-11-7428321 안정민'? 'selected' : ''}>하나은행 86391-11-7428321 안정민</option>
                                    <option ${slip.paymentType == '국민은행 2552125-9231111 안정민'? 'selected' : ''}>국민은행 2552125-9231111 안정민</option>
                                </select>
                                <small class="form-text text-danger">
                                        ${valid_paymentType}
                                </small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-12"></div>
                        <div>
                        <button type="submit" class="right btn btn-primary" onclick=""><em>수정</em></button>
                        </div>
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

    function numberWithCommas(x) {
        let y = "";
        x = x.replace(/[^0-9]/g,'');
        if(x != "") {
            y = parseInt(x)/10;
            y = Math.ceil(y);
        }
        $("#money").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $("#moneyVAT").val((""+y).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }


    function tradingTypeKindChange(e) {
        var expenditure = ["계정과목을 선택해주세요.", "소모품비", "회의비", "복리후생비", "여비교통비", "접대비", "통신비", "인쇄비",
            "교육훈련비", "원재료비", "급여", "잡금", "기부금", "잡손실", "법인세"];
        var deposit = ["계정과목을 선택해주세요.", "이자수익", "관세환급금", "임대료", "잡이익", "국고보조금"];
        var salesSlip = ["계정과목을 선택해주세요.", "외상매입금", "지급어음", "미지급금", "선수수익"];
        var purchaseSlip = ["계정과목을 선택해주세요.", "상품(화장품)"];
        var target = document.getElementById("slipCode");

        if(e.value == "지출 결과서") var type = expenditure;
        else if(e.value == "입금 보고서") var type = deposit;
        else if(e.value == "매출 거래") var type = salesSlip;
        else if(e.value == "매입 거래") var type = purchaseSlip;

        target.options.length = 0;

        for (typeChoice in type) {
            var opt = document.createElement("option");
            opt.value = type[typeChoice];
            opt.innerHTML = type[typeChoice];
            target.appendChild(opt);
        }
    }

</script>
<!-- script -->
<jsp:include page="../layout/script.jsp" />
<!-- /script -->
</body>
</html>
