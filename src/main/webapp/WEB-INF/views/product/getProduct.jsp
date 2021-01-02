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
            <h1 style="text-align: center">제품 상세</h1>
            <hr>
            <input name="prod_id" type="hidden" value="${product.prod_id}">
            <table class="table table-bordered" style="width: 50%; margin: auto;">
                <tr>
                    <td>제품명</td>
                    <td><input type="text" name="prodName" value="${product.prodName}" disabled/>${valid_prodName}</td>
                    <form:errors path="prodName"/>
                </tr>
                <tr>
                    <td>거래처</td>
                    <td><input type="text" name="empl" value="${product.corp.corpName}" disabled/></td>
                </tr>
                <tr>
                    <td>담당자</td>
                    <td><input type="text" name="empl" value="${product.empl.name}" disabled/></td>
                </tr>
                <tr>
                    <td>단위</td>
                    <td><input type="text" name="prod_bundle" value="${product.prod_bundle}"
                               disabled/>${valid_prod_bundle}
                    </td>
                </tr>
                <tr>
                    <td>판매가</td>
                    <td><input type="text" name="sell_price" value="${product.sell_price}" disabled/>${valid_sell_price}
                    </td>
                </tr>
                <tr>
                    <td>구매가</td>
                    <td><input type="text" name="buy_price" value="${product.buy_price}" disabled/>${valid_buy_price}
                    </td>
                </tr>
                <tr>
                    <td>카테고리</td>
                    <td><input type="text" name="prod_catag" value="${product.prod_catag}" disabled/>${valid_prod_catag}
                    </td>
                </tr>
                <tr>
                    <td>제품 상태</td>
                    <td>
                        <input type="text" name="prod_state" value="${product.prod_state}" disabled/>${valid_prod_state}</td>
                </tr>
                <tr>
                    <td>제품설명</td>
                    <td><textarea name="prod_explain" cols="40"
                                  rows="10" disabled>${product.prod_explain}</textarea></td>
                </tr>
                <tr>
                    <td>제품사진</td>
                    <td>
                        <img src="${product.prod_image}" id="profile-image" class="col-md-3 img img-responsive">
                        <input type="hidden" value="${product.prod_image}" id="photo" name="prod_image">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input class="btn btn-primary" type="button"
                               onclick="location.href='updateProduct?prod_id=${product.prod_id}'" value="수정하기"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </td>
                </tr>
            </table>
            <hr>
            <a class="btn btn-primary" href="deleteProduct?prod_id=${product.prod_id}">글 삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="btn btn-primary" href="productList">리스트</a>&nbsp;&nbsp;&nbsp;&nbsp;

        </div>
    </div><!-- End main_container -->
    <!-- footer -->
    <jsp:include page="../layout/footer.jsp"/>
    <!-- /footer -->
</div>

<!-- script -->
<jsp:include page="../layout/script.jsp"/>

<script>
    $("#image-input-file").change(function (e) {
        if (e.target.files.length === 1) {
            const reader = new FileReader();
            reader.onload = e => {
                if (e.target.result) {
                    console.log(e.target.result);
                    if (!e.target.result.startsWith("data:image")) {
                        alert("이미지 파일을 선택하세요.");
                        return;
                    }

                    $("#photo").attr("value", e.target.result);
                    $("#profile-image").attr("src", e.target.result);
                }
            };

            reader.readAsDataURL(e.target.files[0]);
        }
    });

</script>

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