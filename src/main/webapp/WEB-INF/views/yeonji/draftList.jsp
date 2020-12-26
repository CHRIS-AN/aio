<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<!-- head -->
<jsp:include page="../layout/header.jsp" />

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
                <div class="page-title">
                    <div class="title_left">
                        <h3>발주서 작성</h3>
                    </div>
                </div>
                <div id="datatable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
                    <form id="corpSelectForm">
                        <%--     거래처 등록 row    --%>
                        <div class="row p-4 bg-white ">
                            <div class="col-md-3">
                                거래처
                            </div>
                            <div class="col-md-7">
                                <span> 거래처를 등록해주세요.</span>
                                <input type="hidden" value="" />
                            </div>
                            <div class="col-md-2">
                                <input type="button" value="거래처 검색" />
                            </div>
                        </div>
                        <%--     납기일 row    --%>
                        <div class="row">
                            <label>납기일:</label>
                            <input type="date" name="orders_regdate"/>
                            <button type="button" name="registerModalBtn" class="btn btn-primary" data-toggle="modal"
                                    data-target="#registerModal">+
                            </button>
                        </div>
                        <%--     발주물품 테이블 row    --%>
                        <div class="row">
                            <table id="" class="table table-striped table-bordered dataTable">
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

                        <div class="row">
                            <input type="submit" value="발주요청">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </div>
                    </form>
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
                                                <span name="goods" class="goods" placeholder="물품을 등록해주세요">스킨</span>
                                                <span>${valid_goods}</span>
                                            </div>
                                            <div class="form-group col-md-3 com-sm-3">
                                                <button class="goodsSearch">물품 검색</button>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>단위</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsunit" class="goodsunit" placeholder="정보 없음" >5</span>
                                                <span>${valid_goodsunit}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>가격</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsprice" class="goodsprice" placeholder="정보 없음">10</span>
                                                <span>${valid_goodsprice}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>수량</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <input type="text" name="draft_cnt" value="" class="form-control goodsnumber numkeyup" placeholder="수량을 입력해주세요">
                                                <span>${valid_goodsnumber}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>합계</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span class="goodssum" placeholder="0"></span>
                                                <input type="hidden" name="draft_prod_price" value="" class="form-control goodssum" id="amount" >
                                                <span>${valid_amount}</span>
                                            </div>
                                        </div>

                                        <div class="form-group text-center has-feedback col-md-12 com-sm-12">
                                            <input type="submit" id="newGoodsBtn" class="btn btn-default" value="등록"/>
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
                                                <span name="goods" class="goods" placeholder="물품을 등록해주세요">스킨</span>
                                                <span>${valid_goods}</span>
                                            </div>
                                            <div class="form-group col-md-3 com-sm-3">
                                                <button class="goodsSearch">물품 검색</button>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>단위</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsunit" class="goodsunit" placeholder="정보 없음" >5</span>
                                                <span>${valid_goodsunit}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>가격</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <span name="goodsprice" class="goodsprice2" placeholder="정보 없음">1000</span>
                                                <span>${valid_goodsprice}</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group has-feedback col-md-3 com-sm-3">
                                                <label>수량</label>
                                            </div>
                                            <div class="form-group has-feedback col-md-9 com-sm-9">
                                                <input type="text" name="draft_cnt" id="draftcnt" class="form-control goodsnumber2 numkeyup2" placeholder="수량을 입력해주세요">
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
                                            <input type="button" id="deleteBtn" class="btn btn-default" value="삭제" data-toggle="modal"
                                                   data-target="#deleteModal" onclick="draftDelete()"/>
                                            <input type="submit" id="updateBtn" class="btn btn-default" value="수정"/>
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
                    var draftcnt = $(event.relatedTarget).data('draftcnt');
                    var draftprodprice = $(event.relatedTarget).data('draftprodprice');

                    $(this).find("#draftseq").val(draftseq);
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
                                <input type="submit" class="btn btn-primary" value="확인" />
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
