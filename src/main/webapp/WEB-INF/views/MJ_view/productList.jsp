<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
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
</head>
<!-- head -->
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- side-nav -->
        <jsp:include page="../layout/side-bar.jsp"/>

        <!-- top-nav -->
        <jsp:include page="../layout/top-nav.jsp"/>


        <!-- content -->
        <div class="right_col" role="main">
            <h1 style="text-align: center">제품 목록</h1>
            <div style="text-align: right">
                <label>제품 검색 :</label>
                <input type="text" name="prodSearch">
            </div>
            <div style="text-align: right">
                <a href="insertProduct">
                    <button type="button" class="btn btn-primary" href="insertProduct">제품 등록</button>
                </a>


            </div>

            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제품명</th>
                    <th>단위</th>
                    <th>카테고리</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="vo" items="${productList}">
                    <tr>
                        <td>${vo.prod_id}</td>
                        <td align="left"><a href="getProduct?prod_id=${vo.prod_id}">${vo.prodName}</a></td>
                        <td>${vo.prod_bundle}</td>
                        <td>${vo.prod_catag}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp"/>
        <!-- /footer  -->
    </div>
</div>

<!-- script -->
<jsp:include page="../layout/script.jsp"/>

<!-- Datatables -->
<script src="/node_modules/gentelella/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="/node_modules/gentelella/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="/node_modules/gentelella/vendors/jszip/dist/jszip.min.js"></script>
<script src="/node_modules/gentelella/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="/node_modules/gentelella/vendors/pdfmake/build/vfs_fonts.js"></script>


<!-- /script -->
</body>
</html>

