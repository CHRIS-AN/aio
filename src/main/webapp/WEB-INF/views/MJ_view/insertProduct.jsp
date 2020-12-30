<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <h1 style="text-align: center">제품 등록</h1>
            <form action="insertProduct" method="post">
                <table class="table table-bordered" style="width: 50%; margin: auto;">
                    <tr>
                        <td>제품명</td>
                        <td><input type="text" name="prodName" value="${product.prodName}"/>${valid_prodName}</td>
                        <form:errors path="prodName"/>
                    </tr>
                    <tr>
                        <td>담당자</td>
                        <td><input type="text" value="${empl.name}" name="name" disabled/></td>
                    </tr>
                    <tr>
                        <td>거래처</td>
                        <td>
                            <input type="hidden" id="corp_id" name="corp_id">
                            <span name="corps" id="corps" class="corps" >거래처를 등록해주세요</span>
                            <button type="button" class="btn btn-primary" onclick="openWin()">거래처 검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>단위</td>
                        <td><input type="text" name="prod_bundle" value="${product.prod_bundle}"/>${valid_prod_bundle}</td>
                    </tr>
                    <tr>
                        <td>판매가</td>
                        <td><input type="text" name="sell_price" value="${product.sell_price}"/>${valid_sell_price}</td>
                    </tr>
                    <tr>
                        <td>구매가</td>
                        <td><input type="text" name="buy_price" value="${product.buy_price}"/>${valid_buy_price}</td>
                    </tr>
                    <tr>
                        <td>카테고리</td>
                        <td><input type="text" name="prod_catag" value="${product.prod_catag}"/>${valid_prod_catag}</td>
                    </tr>
                    <tr>
                        <td>제품 설명</td>
                        <td><textarea name="prod_explain" cols="40" rows="10" ></textarea></td>
                    </tr>
                    <tr>
                        <td>제품 사진</td>
                        <td>
                            <input type="file" class="form-control" id="image-input-file" >
                            <input type="hidden" id="photo" name="prod_image" >
                            <img id="profile-image" class="col-md-3 img img-responsive">
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input class="btn btn-primary" type="submit" value="등록하기">
                            <button type="reset" class="btn btn-primary" onclick="history.back()">돌아가기</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        </td>
                    </tr>
                </table>
            </form>
        </div>

    </div> <!-- End main_container -->
    <!-- footer  -->
    <jsp:include page="../layout/footer.jsp"/>
    <!-- /footer  -->
</div>
</div>
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

    function openWin() {
        window.open("./searchCorp", "거래처 목록", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, left=400, top=100");
    }


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

