<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <jsp:include page="../layout/header.jsp"/>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- sidebar -->
        <jsp:include page="../layout/side-bar.jsp"/>
        <!-- /sidebar -->

        <!-- top-nav -->
        <jsp:include page="../layout/top-nav.jsp"/>
        <!-- top-nav -->
        <div class="right_col" role="main">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title cus-title">

                        <h2><i class="fa far fa-edit"></i> 매출/매입 거래서</h2>

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
                                    <div class="form-group col-md-4">
                                        <span class="fa fas fa-archive form-control-feedback left"></span>
                                        <select name="tradingType" class="form-control has-feedback-left" id="trading">
                                            <option disabled selected>전표 타입</option>
                                            <option>매출 거래</option>
                                            <option>매입 거래</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-6">
                                        <span class="glyphicon glyphicon-user form-control-feedback left"></span>
                                        <input name="slipWrite" type="text" class="form-control has-feedback-left"
                                               placeholder="작성자"
                                               maxlength="20" value="${slip.slipWrite}">
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
                                        <select name="slip_code" class="form-control has-feedback-left" id="code">
                                            <option disabled selected>계정 과목</option>
                                            <option>상품 (701)</option>
                                            <option>외상매입금 (801)</option>
                                            <option>지급어음 (802)</option>
                                            <option>미지급금 (803)</option>
                                            <option>예수금 (804)</option>
                                            <option>선수수익 (805)</option>
                                        </select>

                                        <small class="form-text text-danger">
                                            ${valid_slip_code}
                                        </small>
                                    </div>
                                </div>

                                <!-- corp 연관관계 설정 -->
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <i class="fa far fa-retweet form-control-feedback left"></i>
                                        <input name="corp" type="text" class="form-control has-feedback-left" id="corp"
                                               placeholder="거래처" value="${slip.corp}">
                                        <small class="form-text text-danger">
                                            ${valid_corp}
                                        </small>
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
                                            <option disabled selected>결제 수단</option>
                                            <option>현금</option>
                                            <option>신한은행 213123-123-123213</option>
                                            <option>하나은행 86391-11-1123321</option>
                                            <option>국민은행 2552125-211221</option>
                                        </select>
                                    </div>
                                </div>

                                <div> </div>
                                <div class="col-sm-12 text-right">
                                    <button type="submit" class="btn btn-primary" onclick="registerClick()"><em>전표 등록</em></button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div>
    </div>
</div>
<!-- script -->
<jsp:include page="../layout/script.jsp"/>
<script>
    function registerClick() {
        alert("확인하시겠습니까?")
    }
    function numberWithCommas(x) {
        let y = "";
        x = x.replace(/[^0-9]/g,'');
        if(x != "") {
            y = parseInt(x)/10;
        }
        $("#money").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $("#moneyVAT").val((""+y).replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // NaN 뜸 !! , 을인식을 하니 수정해야함.

    }
</script>

</body>
</html>
