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
                                    <tr>
                                        <td>${o.orders_id}</td>
                                        <td>${o.corp.corp_name}</td>
                                        <td>누구냐</td>
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
        <div class="modal" id="modal_1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">거래처 등록</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <form action="corpInsert" method="post">
                            <table class="table table-bordered">
                                <tr>
                                    <th>상호</th>
                                    <th><input type="text" name="corp_name" placeholder="내용을 입력해주세요" value="" autofocus>
                                    </th>
                                </tr>
                                <tr>
                                    <th>사업자 등록번호</th>
                                    <th><input type="text" name="corp_num" placeholder="ex)000-00-00000" value=""
                                               autofocus></th>
                                </tr>
                                <tr>
                                    <th>대표자</th>
                                    <th><input type="text" name="corp_ceo" placeholder="내용을 입력해주세요" value="" autofocus>
                                    </th>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <th><input type="text" name="corp_call" placeholder="연락처를 입력해주세요" value=""
                                               autofocus></th>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <th><input type="text" name="corp_address" placeholder="도로명 주소" value=""
                                               autofocus><input type="button" value="주소 검색"></th>
                                    <%--                <th><input type="text" name="corp_address" placeholder="상세정보" autofocus></th>--%>
                                </tr>
                            </table>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-primary" value="등록">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

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
