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
    <link href="../../../../resources/static/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
          rel="stylesheet">
    <link href="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
          rel="stylesheet">
    <link href="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
          rel="stylesheet">
    <link href="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
          rel="stylesheet">
    <link href="../../../../resources/static/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../../../resources/static/node_modules/gentelella/build/css/custom.css" rel="stylesheet">
    <%--    <link href="/css/manage.css" rel="stylesheet">--%>
    <script src="../../../../resources/static/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="../../../../resources/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../../../resources/static/css/dataTables.bootstrap4.min.css" rel="stylesheet">


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
            <h1 class="h3 mb-2 text-gray-800"  style="text-align: center" >제품 목록</h1>

            <div class="container">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">제품 목록</h6>
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
                                    <tr>
                                        <td>${vo.prod_id}</td>
                                        <td align="left"><a href="getProduct?prod_id=${vo.prod_id}">${vo.prodName}</a>
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
            <!-- footer  -->
            <jsp:include page="../layout/footer.jsp"/>
            <!-- /footer  -->
        </div>
    </div>
</div>

<!-- script -->
<jsp:include page="../layout/script.jsp"/>

<!-- Datatables -->
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/jszip/dist/jszip.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="../../../../resources/static/node_modules/gentelella/vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="../../../../resources/static/js/jquery.min.js"></script>
<script src="../../../../resources/static/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../../../resources/static/js/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../../../resources/static/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="../../../../resources/static/js/jquery.dataTables.min.js"></script>
<script src="../../../../resources/static/js/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts / 검색&페이징 등 -->
<script src="../../../../resources/static/js/datatables-demo.js"></script>

</body>
</html>

