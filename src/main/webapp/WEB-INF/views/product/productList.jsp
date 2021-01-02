<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

    <title>제품 조회</title>

    <!-- head -->
    <!-- Datatables -->
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
          rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
          rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
          rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
          rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/node_modules/gentelella/build/css/custom.css" rel="stylesheet">
    <%--    <link href="/css/manage.css" rel="stylesheet">--%>
    <script src="/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/css/dataTables.bootstrap4.min.css" rel="stylesheet">

    <style>
        .btn-primary{
            position: absolute;
            right: 0;
            top: 0px;
            font-size: 27px;
        }

    </style>
</head>


<!-- Page Heading -->
<body class="nav-md">
<div class="container body">

    <div class="main_container">
        <!-- side-nav -->
        <jsp:include page="../layout/side-bar.jsp"/>

        <!-- top-nav -->
        <jsp:include page="../layout/top-nav.jsp"/>

        <!-- content -->
        <div class="right_col" role="main">

            <div class="container">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h1 class="m-0 font-weight-bold text-primary">제품 목록</h1>
                        <button type="button" class="btn btn-primary" onclick="location.href='insertProduct'">제품 추가</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제품명</th>
                                    <th>단위</th>
                                    <th>카테고리</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>번호</th>
                                    <th>제품명</th>
                                    <th>단위</th>
                                    <th>카테고리</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="vo" items="${productList}">
                                    <tr onclick="location.href='getProduct?prod_id=${vo.prod_id}'" style="cursor:hand">
                                        <td>${vo.prod_id}</td>
                                        <td align="left">${vo.prodName}
                                        </td>
                                        <td>${vo.prod_bundle}</td>
                                        <td>${vo.prod_catag}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
    <!-- footer  -->

    <!-- /footer  -->
</div>

<!-- script -->


<!-- Datatables -->
<%--<script src="/node_modules/gentelella/vendors/datatables.net/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/jszip/dist/jszip.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/pdfmake/build/pdfmake.min.js"></script>--%>
<%--<script src="/node_modules/gentelella/vendors/pdfmake/build/vfs_fonts.js"></script>--%>

<!-- Bootstrap core JavaScript-->
<%--<script src="/js/jquery.min.js"></script>--%>
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

