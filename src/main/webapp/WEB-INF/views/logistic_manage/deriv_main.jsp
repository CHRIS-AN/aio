<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="kor">
<head>
    <title>물류관리 > 입고관리</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <link href="/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/build/css/custom.css" rel="stylesheet">
    <script src="/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/derivate_style.css">--%>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
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
                        <h6 class="m-0 font-weight-bold text-primary">물류관리 > 입고관리</h6>
                        <div>
                            <button type="button" name="corpAdd" class="btn btn-primary" data-toggle="modal"
                                    data-target="#modal_1">+
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>입고번호</th>
                                    <th>입고일</th>
                                    <th class="prods">입고품목</th>
                                    <th class="crops">회사명</th>
                                    <th>총수량</th>
                                </tr>
                                </thead>

                                <tfoot>
                                <tr>
                                    <th>입고번호</th>
                                    <th>입고일</th>
                                    <th class="prods">입고품목</th>
                                    <th class="crops">회사명</th>
                                    <th>총수량</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="c" items="${corp}">
                                    <tr id="tr${c.corp_id}" onclick="detail()" data-toggle="modal"
                                        data-target="#modal_2"
                                        data-corpid="${c.corp_id}" data-corpname='${c.corp_name}'
                                        data-corpnum='${c.corp_num}' data-corpceo='${c.corp_ceo}'
                                        data-corpcall='${c.corp_call}' data-corpaddress='${c.corp_address}'>
                                        <td>${c.corp_id}</td>
                                        <td>${c.corp_name}</td>
                                        <td>${c.corp_ceo}</td>
                                        <td>${c.corp_call}</td>
                                        <td>누구냐넌</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 아래 지우지마 -->
            </div>
        </div>
        <!-- content 내용 -->
    </div>
</div>
<!-- 모달까지 감싸는 -->


<!-- footer  -->
<jsp:include page="../layout/footer.jsp"/>
<!-- /footer  -->

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

<jsp:include page="../layout/script.jsp"/>

</body>
</html>
