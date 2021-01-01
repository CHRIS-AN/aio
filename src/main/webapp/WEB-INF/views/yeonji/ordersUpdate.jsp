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
                            <h3 class="m-0 font-weight-bold text-primary">발주서 수정</h3>
                        </div>
                        <div style="float: right">
                            <button type="button" class="btn btn-primary" onclick="location.href='ordersList'">뒤로가기</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <form id="corpSelectForm" action="ordersInsert" method="post">
                            <%--     거래처 등록 row    --%>
                            <div class="row p-4 bg-gray-200 m-2">
                                <div class="col-md-3">
                                    <label>거래처</label>
                                </div>
                                <div class="col-md-7">
                                    <span id="corpname"> ${orders.corp.corpName} </span>
                                    <input type="hidden" name="corp_id" id="corp_id" value="${orders.corp.corpName}"/>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-primary" onclick="openWinCorp()">
                                        거래처 검색
                                    </button>
                                </div>
                            </div>
                            <%--     납기일 row    --%>
                            <div class="row p-3">
                                <div class="col-md-11">
                                    <div style="float:left" class="p-1">
                                        <label>납기일:</label>
                                        <input type="date" name="orders_regdate" id="orders_regdate" value="${orders.orders_regdate}"/>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div  style="float: right" class="p-1">
                                        <button type="button" name="registerModalBtn" class="btn btn-primary" data-toggle="modal"
                                                data-target="#registerModal">+</button>
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
                                        <c:forEach var="d" items="${nulldraft}">
                                            <tr id="tr${d.draft_seq}" onclick="update()" data-toggle="modal" data-target="#updateModal"
                                                data-draftseq='${d.draft_seq}' data-prodname='${d.product.prodName}' data-prodbundle='${d.product.prod_bundle}'
                                                data-sellprice='${d.product.sell_price}' data-draftcnt='${d.draft_cnt}' data-draftprodprice='${d.draft_prod_price}' >
                                                <td>${d.draft_seq}</td>
                                                <td>${d.product.prodName}</td>
                                                <td>${d.product.prod_bundle}</td>
                                                <td>${d.product.sell_price}</td>
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
                                            <th>총수량:<c:out value="${totcnt}"/> 개 <input type="hidden" name="orders_cnt" id="orders_cnt" value="${totcnt}"></th>
                                            <th>총합계:<c:out value="${totprice}"/> 원<input type="hidden" name="orders_totsum" id="orders_totsum" value="${totprice}"></th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <div class="row text-center">
                                    <input type="hidden" name="ordersstate" id="ordersstate" value="결제 대기">
                                <div class="col-md-12">
                                    <button type="submit"class="btn btn-primary" >발주요청수정</button>
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

        <%--  모달 1 : 발주 물품 등록  --%>
        <div class="modal" id="registerModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title cus-title">
                                    <h2> 발주 물품 등록 </h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form action="draftInsert" method="post" class="form needs-validation">
                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>발주 물품</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-6 com-sm-6">
                                                <span name="goods" id="goods" class="goods" >물품을 등록해주세요</span>
                                                <input type="hidden" id="prod_id" name="prod_id">
                                                <span>${valid_goods}</span>
                                            </div>
                                            <div class="form-group col-md-3 com-sm-3">
                                                <button type="button" class="btn btn-primary goodsSearch" onclick="openWin()">
                                                    물품 검색
                                                </button>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>단위</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsunit" id="goodsunit" class="goodsunit" >정보 없음</span>
                                                <span>${valid_goodsunit}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>가격</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsprice" id="goodsprice" class="goodsprice" >정보 없음</span>
                                                <span>${valid_goodsprice}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>수량</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <input type="text" name="draft_cnt" value="" class="form-control goodsnumber numkeyup" placeholder="수량을 입력해주세요" required>
                                                <span>${valid_goodsnumber}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>합계</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span class="goodssum" >0</span>
                                                <input type="hidden" name="draft_prod_price" value="" class="form-control goodssum" id="amount" >
                                                <span>${valid_amount}</span>
                                            </div>
                                        </div>

                                        <div class="form-group text-center has-feedback col-md-12 com-sm-12">
                                            <button type="submit"class="btn btn-primary">등록</button>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script>
            $('input.numkeyup').on('keyup',function(){
                var cnt = $("input.goodsnumber").length;
                console.log(cnt);

                for( var i=1; i< cnt; i++){
                    var sum = parseInt($(this).val() || 0 );
                    sum++
                    console.log(sum);
                }

                // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
                var sum1 = parseInt($("span.goodsprice").text() || 0);      // span으로 된 가격 값 가져오기
                var sum2 = parseInt($("input.goodsnumber").val() || 0);     // input으로 된 수량 값 가져오기
                console.log(sum1);
                console.log(sum2);

                var sum = sum1 * sum2;
                console.log(sum);

                $("span.goodssum").html(sum);
                $("input.goodssum").val(sum);
            });

            function openWin(){
                window.open("./productSearch", "물품 목록", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, left=400, top=100" );
            }

            function openWinCorp(){
                window.open("./corpSearch", "물품 목록", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, left=400, top=100" );
            }
        </script>


        <%--  모달 2 : 발주물품 수정  --%>
        <div class="modal" id="updateModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title cus-title">
                                    <h2> 발주 물품 수정 </h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form action="draftUpdate" method="post" class="form needs-validation">
                                        <input type="hidden" name="draft_seq" id="draftseq">
                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>발주 물품</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-6 com-sm-6">
                                                <span name="goods" class="goods" id="goodsup">물품을 등록해주세요</span>
                                                <input type="hidden" id="prod_idup" name="prod_id">
                                                <span>${valid_goods}</span>
                                            </div>
                                            <div class="form-group col-md-3 com-sm-3">
                                                <button type="button" class="btn btn-primary goodsSearch" onclick="openWin()">
                                                    물품 검색
                                                </button>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>단위</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsunit" class="goodsunit" id="goodsunitup">정보 없음</span>
                                                <span>${valid_goodsunit}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>가격</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsprice" class="goodsprice2" id="goodspriceup">정보 없음</span>
                                                <span>${valid_goodsprice}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>수량</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <input type="text" name="draft_cnt" id="draftcnt" class="form-control goodsnumber2 numkeyup2" placeholder="수량을 입력해주세요" required>
                                                <span>${valid_goodsnumber}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>합계</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span id="goodssum_1" class="goodssum2" placeholder="0"></span>
                                                <input type="hidden" name="draft_prod_price" id="goodssum_2"  class="form-control goodssum2">
                                                <span>${valid_amount}</span>
                                            </div>
                                        </div>

                                        <div class="form-group text-center has-feedback col-md-12 com-sm-12">
                                            <button type="button"class="btn btn-primary" data-toggle="modal"
                                                    data-target="#deleteModal" onclick="draftDelete()">삭제</button>
                                            <button type="submit"class="btn btn-primary">수정</button>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            //발주 물품 수정
            function update() {
                $('#updateModal').on('show.bs.modal', function (event) {
                    var draftseq = $(event.relatedTarget).data('draftseq');
                    var prodName = $(event.relatedTarget).data('prodname');
                    var prodbundle = $(event.relatedTarget).data('prodbundle');
                    var sellprice = $(event.relatedTarget).data('sellprice');
                    var draftcnt = $(event.relatedTarget).data('draftcnt');
                    var draftprodprice = $(event.relatedTarget).data('draftprodprice');

                    $(this).find("#draftseq").val(draftseq);
                    $(this).find("#goodsup").text(prodName);
                    $(this).find("#goodsunitup").text(prodbundle);
                    $(this).find("#goodspriceup").text(sellprice);
                    $(this).find("#draftcnt").val(draftcnt);
                    $(this).find("#goodssum_1").text(draftprodprice);
                    $(this).find("#goodssum_2").val(draftprodprice);
                });

                $('input.numkeyup2').on('keyup',function(){
                    var cnt = $("input.goodsnumber2").length;
                    console.log(cnt);

                    // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
                    var sum1 = parseInt($("span.goodsprice2").text() || 0);      // span으로 된 가격 값 가져오기
                    var sum2 = parseInt($("input.goodsnumber2").val() || 0);     // input으로 된 수량 값 가져오기
                    console.log(sum1);
                    console.log(sum2);

                    var sum = sum1 * sum2;
                    console.log(sum);

                    $("span.goodssum2").html(sum);
                    $("input.goodssum2").val(sum);
                });
            }
        </script>

        <%--  모달 4 : 발주 물품 삭제  --%>
        <div class="modal" id="deleteModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">발주 물품 삭제</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="draftDelete" method="post">
                            정말 삭제하시겠습니까?
                            <input type="hidden" id="deleteDraftId" name="draft_seq" value="">
                            <div class="modal-footer">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit"class="btn btn-primary">확인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            //삭제하기
            function draftDelete() {
                $('#deleteModal').on('show.bs.modal', function (event) {
                    var draftseq = $('#draftseq').val();
                    $(this).find("#deleteDraftId").val(draftseq);
                });
            }
        </script>

        <!-- script -->

        <jsp:include page="../layout/script.jsp" />
        <!-- /script -->
</body>
</html>
