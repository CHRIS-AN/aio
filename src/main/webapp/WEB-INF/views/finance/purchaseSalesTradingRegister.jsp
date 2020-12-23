<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <%--    <title>매출 / 매입 거래서</title>--%>
    <%--    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500&display=swap" rel="stylesheet">--%>
    <%--    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css"/>--%>
    <%--    <link rel="stylesheet" href="/node_modules/font-awesome/css/font-awesome.min.css"/>--%>
    <%--    <script src="/node_modules/jquery/dist/jquery.min.js"></script>--%>
    <%--    <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>--%>
    <%--    <script src="/node_modules/jdenticon/dist/jdenticon.min.js"></script>--%>
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
                                    <div class="form-group col-md-4" style="">
                                        <span class="fa fas fa-archive form-control-feedback left"></span>
                                        <select name="tradingType" class="form-control has-feedback-left" id="trading">
                                            <option>매출 거래</option>
                                            <option>매입 거래</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-6">
                                        <span class="glyphicon glyphicon-user form-control-feedback left"></span>
                                        <input name="slip_write" type="text" class="form-control has-feedback-left"
                                               placeholder="작성자"
                                               maxlength="20" value="${slip.slip_write}">
                                        <small class="form-text text-danger">
                                            ${valid_slip_write}
                                        </small>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <span class="fa far fa-calendar form-control-feedback left"></span>
                                        <input name="slip_date" type="date" class="form-control has-feedback-left"
                                               id="date"
                                               placeholder="전표등록 일자" value="${slip.slip_date}">
                                        <small class="form-text text-danger">
                                            ${valid_slip_date}
                                        </small>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-12">
                                        <i class="fa fas fa-tasks form-control-feedback left"></i>
                                        <input name="slip_code" type="text" class="form-control has-feedback-left"
                                               id="slipCode"
                                               placeholder="계정 코드" value="${slip.slip_code}">
                                        <small class="form-text text-danger">
                                            ${valid_slip_code}
                                        </small>
                                    </div>
                                </div>

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
                                               id="slipPrice"
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
                                               id="vax"
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
                                            <option>현금</option>
                                            <option>신한은행 213123-123-123213</option>
                                            <option>하나은행 86391-11-1123321</option>
                                            <option>국민은행 2552125-211221</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <button type="submit" class="btn btn-default" style="" onclick="registerClick()">전표
                                        등록
                                    </button>
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
</script>

</body>
</html>
