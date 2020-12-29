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
    <title>발주서</title>
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
<div class="nav-md">

    <div class="container body">
        <div class="main_container">

            <div class="right_col" role="main">

                <div class="">

                    <div class="row">
                        <div class="modal-header">
                            <h4 class="modal-title">발주서</h4>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="col-sm-12">
                                <div class="text-center">
                                    <h1>발주서</h1>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered" width="80%" cellspacing="0">
                                        <tr>
                                            <td>발주번호</td>
                                            <td colspan="2"></td>
                                            <td>납기일</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">발주처</td>
                                            <td>회사명</td>
                                            <td></td>
                                            <td>전화</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>대표자</td>
                                            <td></td>
                                            <td>주소</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">수주처</td>
                                            <td>회사명</td>
                                            <td></td>
                                            <td>전화</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>담당자</td>
                                            <td></td>
                                            <td>주소</td>
                                            <td></td>
                                        </tr>
                                    </table>
                                    <table class="table table-bordered" width="80%" cellspacing="0">
                                        <tr>
                                            <td>No.</td>
                                            <td colspan="2">품명</td>
                                            <td>단위</td>
                                            <td>단가</td>
                                            <td>수량</td>
                                            <td>금액</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td colspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">합계</td>
                                            <td></td>
                                            <td></td>
                                            <td>총합계</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div>

                        </div>
                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->
        </div>

        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->
    </div> <!-- End container -->
</div>
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

