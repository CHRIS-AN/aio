<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

    <title>AIO</title>

    <!-- 부트스트랩 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Custom styles for this page -->
    <link href="/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->

    <link href="/node_modules/gentelella/build/css/custom.css" rel="stylesheet">
    <script src="/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<!-- head -->
<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <!-- sidebar -->
        <jsp:include page="../layout/side-bar.jsp"/>
        <!-- /sidebar -->

        <!-- top-nav -->
        <jsp:include page="../layout/top-nav.jsp" />
        <!-- top-nav -->


        <!-- content -->
        <div class="right_col" role="main">

            <div class="">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div style="float:left">
                            <h3 class="m-0 font-weight-bold text-primary">발주 목록</h3>
                        </div>
                    </div>
                    <div class="card-body">
                        <form id="corpSelectForm">
                            <%--     거래처 등록 row    --%>
                            <div class="row p-4 bg-gray-200 m-2">
                                <div class="col-md-3">
                                    거래처
                                </div>
                                <div class="col-md-7">
                                    <span> 거래처를 등록해주세요.</span>
                                    <input type="hidden" value="" />
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-primary" >
                                        거래처 검색
                                    </button>
                                </div>
                            </div>
                            <%--     납기일 row    --%>
                            <div class="row p-3">
                                <div class="col-md-11">
                                    <div style="float:left" class="p-1">
                                        <label>납기일:</label>
                                        <input type="date" name="orders_regdate"/>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div  style="float: right" class="p-1">
                                        <button type="button" name="registerModalBtn" class="btn btn-primary" data-toggle="modal"
                                                data-target="#registerModal">+
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <%--     발주물품 테이블 row    --%>
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>상품명</th>
                                            <th>단위</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                            <th>합계</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:set var = "totcnt" value = "0" />
                                        <c:set var = "totprice" value = "0" />
                                        <c:forEach var="d" items="${draft}">
                                            <tr id="tr${d.draft_seq}" onclick="update()" data-toggle="modal" data-target="#updateModal"
                                                data-draftseq='${d.draft_seq}' data-draftcnt='${d.draft_cnt}' data-draftprodprice='${d.draft_prod_price}' >
                                                <td>${d.draft_seq}</td>
                                                <td>어떤 물건이냐?</td>
                                                <td>단위는?</td>
                                                <td>가격은?</td>
                                                <td>${d.draft_cnt}</td>
                                                <td>${d.draft_prod_price}</td>
                                                <c:set var= "totcnt" value="${totcnt + d.draft_cnt}"/>
                                                <c:set var= "totprice" value="${totprice + d.draft_prod_price}"/>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th>총수량:<c:out value="${totcnt}"/> 개</th>
                                            <th>총합계:<c:out value="${totprice}"/> 원</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <div class="row text-center">
                                <div class="col-md-12">
                                    <input type="submit" class="btn bg-gradient-primary" value="발주요청">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->

        <!-- script -->
        <jsp:include page="../layout/script.jsp" />


        <!-- /script -->
</body>
</html>
