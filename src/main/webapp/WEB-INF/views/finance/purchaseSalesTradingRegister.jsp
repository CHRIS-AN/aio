<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>전표 등록</title>
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
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title cus-title">

                        <h2><i class="fa far fa-edit"></i> 전표 등록</h2>

                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a id="close" class=""><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row col-12">
                        <div class="col-lg-12 mb-5">
                            <form class="needs-validation form-horizontal"
                                  action="/finance/purchaseSalesTradingRegister" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <div class="row form-group">
                                    <div class="form-group col-md-5">
                                        <span class="fa fas fa-archive form-control-feedback left"></span>
                                        <select name="tradingType"  class="form-control has-feedback-left"
                                                id="tradingType" onchange="tradingTypeKindChange(this)" >
                                            <option disabled selected>전표 타입</option>
                                            <option value="지출 결과서">지출 결과서</option>
                                            <option value="입금 보고서">입금 보고서</option>
                                            <option value="매출 거래">매출 거래</option>
                                            <option value="매입 거래">매입 거래</option>
                                        </select>
                                        <small class="form-text text-danger">
                                            ${valid_tradingType}
                                        </small>
                                    </div>

                                    <div class="col-md-1"></div>
                                    <h4><strong> 작성자 : </strong></h4>
                                    <div class="form-group col-md-3">
                                        <span class="fa far fa-retweet form-control-feedback left"></span>
                                        <input name="slipWrite" type="text" readonly style="width: 194px"
                                               class="form-control has-feedback-left" value="${empl.emplId}">
                                        <small class="form-text text-danger">
                                                ${valid_slipWrite}
                                        </small>
                                    </div>
                                </div>

                                <div class="form-group row">
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
                                        <select name="slipCode" class="form-control has-feedback-left" id="slipCode">
                                            <option disabled selected>선택해주세요. (계정 과목)</option>
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
                                                <select name="corp" class="form-control has-feedback-left" style="width:300px">
                                                    <option disabled selected >거래처</option>
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
                                            <option selected disabled="">결제 수단</option>
                                            <option>현금</option>
                                            <option>신한은행 23123-144-993213 안정민</option>
                                            <option>하나은행 86391-11-7428321 안정민</option>
                                            <option>국민은행 2552125-9231111 안정민</option>
                                        </select>
                                        <small class="form-text text-danger">
                                            ${valid_paymentType}
                                        </small>
                                    </div>
                                </div>

                                <div> </div>
                                <div class="col-sm-12 text-right">
                                    <button type="submit" class="btn btn-primary" onclick="button_register()"><em>전표 등록</em></button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div>
        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->
    </div>
</div>
<!-- script -->
<script>
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

    function button_register(){
        if (confirm("정말 등록하시겠습니까??") == true){    //확인
            document.form.submit();
        }else if (confirm("정말 등록하시겠습니까??") == false){   //취소
            return;
        }
    }
</script>
<!-- script -->
<jsp:include page="../layout/script.jsp" />
<!-- /script -->
</body>
</html>