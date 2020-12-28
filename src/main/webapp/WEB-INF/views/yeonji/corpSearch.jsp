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
    <title>거래처 검색</title>

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

        <div class="right_col" role="main">

            <div class="">

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div style="float:left">
                            <h3 class="m-0 font-weight-bold text-primary">거래처 검색</h3>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable example-table-1" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>거래처코드</th>
                                    <th>거래처명</th>
                                    <th>사업자등록번호</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>거래처코드</th>
                                    <th>거래처명</th>
                                    <th>사업자등록번호</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="p" items="${corpsList}">
                                    <tr>
                                        <td><input type="radio" name="corp"></td>
                                        <td>${p.corp_id}</td>
                                        <td>${p.corp_name}</td>
                                        <td>${p.corp_num}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row text-center">
                            <div class="col-md-12">
                                <button type="button"class="btn btn-primary" onclick="chkSelect()">선택</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
        </div>

        <script>
            var corp_id;
            var corp_name;
            var td;
            $("input:radio[name='corp']").click(function() {
                var checkBtn = $(this);
                // checkBtn.parent() : checkBtn의 부모는 <td>이다.
                // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
                var tr = checkBtn.parent().parent();
                td = tr.children();
                console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            })
            function chkSelect(){
                var corp_id = td.eq(1).text();
                var corp_name = td.eq(2).text();
                opener.document.getElementById("corp_id").value = corp_id;
                opener.document.getElementById("corps").innerText = corp_name;
                window.close();
            }
        </script>

        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->
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
