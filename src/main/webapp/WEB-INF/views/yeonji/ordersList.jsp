<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
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
        <!-- Page Heading -->

        <div class="right_col" role="main">

            <div class="">

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div style="float:left">
                            <h3 class="m-0 font-weight-bold text-primary">발주 조회</h3>
                        </div>
                        <div style="float: right">
                            <button type="button" class="btn btn-primary" onclick="location.href='draftList'">발주서 작성</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>발주번호</th>
                                    <th>거래처명</th>
                                    <th>담당자</th>
                                    <th>납기일자</th>
                                    <th>총수량</th>
                                    <th>총합계</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>발주번호</th>
                                    <th>거래처명</th>
                                    <th>담당자</th>
                                    <th>납기일자</th>
                                    <th>총수량</th>
                                    <th>총합계</th>
                                    <th>상태</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="o" items="${orders}">
                                    <tr  id="tr${o.orders_id}"  data-toggle="modal" data-target="#detailModal"
                                        onclick="detail('${o.orders_id}','${o.corp.corp_name}','${o.empl.name}','${o.orders_regdate}',
                                                '${o.orders_cnt}','${o.orders_totsum}','${o.corp.corp_ceo}','${o.corp.corp_call}',
                                                '${o.corp.corp_address}')">
                                        <td>${o.orders_id}</td>
                                        <td>${o.corp.corp_name}</td>
                                        <td>${o.empl.name}</td>
                                        <td>${o.orders_regdate}</td>
                                        <td>${o.orders_cnt}</td>
                                        <td>${o.orders_totsum}</td>
                                        <td>${o.orders_state}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
        </div>

        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->


        <%--  모달 1 : 발주 상세보기  --%>
        <div class="modal" id="detailModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <div class="col-sm-12">
                            <div style="float:left">
                                <h4 class="modal-title">발주서</h4>
                            </div>
                            <div style="float: right">
                                <button type="button" class="btn btn-primary" onclick="print(document.getElementById('modalbody').innerHTML)">인쇄</button>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                    </div>

                    <!-- Modal body -->
                    <div id="modalbody" class="modal-body">
                        <div id="printArea">
                        <div class="col-sm-12">
                            <div class="text-center">
                                <h1>발주서</h1>
                                <p></p>
                                <p></p>
                            </div>
                            <div class="row">
                                <table class="table table-bordered" width="80%" cellspacing="0" style="text-align: center">
                                    <tr>
                                        <td>발주번호</td>
                                        <td colspan="2"><span id="orders_id"></span></td>
                                        <td>납기일</td>
                                        <td><span id="orders_regdate"></span></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">발주처</td>
                                        <td>회사명</td>
                                        <td><span id="corp_name"></span></td>
                                        <td>전화</td>
                                        <td><span id="corp_call"></span></td>
                                    </tr>
                                    <tr>
                                        <td>대표자</td>
                                        <td><span id="corp_ceo"></span></td>
                                        <td>주소</td>
                                        <td><span id="corp_address"></span></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">수주처</td>
                                        <td>회사명</td>
                                        <td>AIO</td>
                                        <td>전화</td>
                                        <td>1588-1004</td>
                                    </tr>
                                    <tr>
                                        <td>담당자</td>
                                        <td><span id="empl_name"></span></td>
                                        <td>주소</td>
                                        <td>서울특별시 강남구 테헤란로 146</td>
                                    </tr>
                                </table>
                                <table class="table table-bordered" width="80%" cellspacing="0" style="text-align: center">
                                    <tr>
                                        <td>No.</td>
                                        <td colspan="2">품명</td>
                                        <td>단위</td>
                                        <td>단가</td>
                                        <td>수량</td>
                                        <td>금액</td>
                                    </tr>
                                    <c:forEach var="d" items="${draft}">
                                        <tr>
                                            <td>${d.draft_seq}</td>
                                            <td colspan="2">${d.product.prodName}</td>
                                            <td>${d.product.prod_bundle}</td>
                                            <td>${d.product.buy_price}</td>
                                            <td>${d.orders.orders_cnt}</td>
                                            <td>${d.orders.orders_totsum}</td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="4">합계</td>
                                        <td></td>
                                        <td></td>
                                        <td><span id="orders_totsum"></span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="form-group text-center has-feedback col-md-12 com-sm-12">
                        <input type="button" class="btn btn-primary" value="삭제" id="ordersDelete"  data-toggle="modal"
                               data-target="#deleteModal" onclick="ordersDelete()">
                        <input type="button" class="btn btn-primary" value="수정" onclick="updateorders()">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                    <p></p>
                    <p></p>
                </div>
            </div>
        </div>

        <script>
            var updatelink;
            function detail(orders_id,corp_name,empl_name,orders_regdate,orders_cnt,orders_totsum,corp_ceo,corp_call,corp_address){
                updatelink = orders_id;
                $('#detailModal').on('show.bs.modal', function (event) {
                    $(this).find("#orders_id").text(orders_id);
                    $(this).find("#corp_name").text(corp_name);
                    $(this).find("#empl_name").text(empl_name);
                    $(this).find("#orders_regdate").text(orders_regdate);
                    $(this).find("#orders_cnt").text(orders_cnt);
                    $(this).find("#orders_totsum").text(orders_totsum);
                    $(this).find("#corp_ceo").text(corp_ceo);
                    $(this).find("#corp_call").text(corp_call);
                    $(this).find("#corp_address").text(corp_address);
                });
            }

            function updateorders(){
                location.href = "ordersUpdate?orders_id="+updatelink;

            }

            function print(printArea){
                var win;
                win = window.open();
                self.focus();
                win.document.open();

                win.document.write('<html lang="ko"><head>');
                win.document.write('<meta charset="utf-8">');
                win.document.write('<title>발주서 인쇄</title>');
                win.document.write('<link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">\n');
                win.document.write('<link href="/css/sb-admin-2.min.css" rel="stylesheet"></head>');
                win.document.write('<body class="nav-md modal-open" cz-shortcut-listen="true">');
                win.document.write(printArea);
                win.document.write('</body></html>');

                win.document.close();

                setTimeout(function (){
                    win.print();
                    win.close();
                },300);
            }
        </script>

        <%--  모달 4 : 발주 물품 삭제  --%>
        <div class="modal" id="deleteModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">발주 삭제</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="ordersDelete" method="post">
                            정말 삭제하시겠습니까?
                            <input type="hidden" id="deleteOrdersId" name="orders_id" value="">
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
            function ordersDelete() {
                $('#deleteModal').on('show.bs.modal', function (event) {
                    var orders_id = $('#orders_id').text();
                    $(this).find("#deleteOrdersId").val(orders_id);
                });
            }
        </script>

    </div> <!-- End container -->

    <!-- autocomplete from jQuery Ui -->

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/js/jquery.dataTables.min.js"></script>
    <script src="/js/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts / 검색&페이징 등 -->
    <script src="/js/datatables-demo.js"></script>

    <jsp:include page="../layout/script.jsp" />

</body>
</html>
