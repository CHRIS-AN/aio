<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <title>물류관리 > 입고관리</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <link href="/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/build/css/custom.css" rel="stylesheet">
    <script src="/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>

    <style>

        /* 리스트 - 탭 */
        .nav-link {
            text-align: center;
            background-color: #f5f5f5;
            color: #6a5acd;
            height: 50px;
            font-size: 1.5em;
            font-weight: bold;
            border-top: 2px solid #eee;
            border-left: 2px solid #eee;
            border-right: 2px solid #eee;
        }

        .nav-link:hover {
            background-color: #a69ce1 !important;
            color: #f5f5f5;
        }

        .active, .active:hover {
            background-color: #6a5acd !important;
            color: #f5f5f5 !important;
        }

        /* 리스트 - content */
        .tab-content .table-responsive {
            padding: 30px 10px;
            background-color: #fff !important;
            border-bottom: solid 1px #ccc;
            border-left: solid 1px #ddd;
            border-right: solid 1px #ddd;
            border-radius: 0 0 20px 20px;
            color: #A69CE1 !important;
            font-size: 1.4em;
        }

        .tab-content .table-responsive input, .tab-content .table-responsive select {
            height: 25px;
        }

        #derivWaitTable{ font-size: 1.35em; }
        #derivWaitTable tr{ height: 25px; }

        .btn_aio {background-color: #6a5acd; color: #f5f5f5; width: 65px; height: 35px; font-size: 1em; font-weight: bold;}

    </style>
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
                        <h2 class="m-0 font-weight-bold"
                            style="color: #372c81;">물류관리 &gt; 입고관리</h2>
                    </div>

                    <div class="card-body">

                        <!-- tab -->
                        <div class="listTabWrap">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="nav-item col-sm-4" style="margin: 0; padding: 0;">
                                    <a id="derivWaitTab" class="nav-link active" data-toggle="tab" href="#derivWait">입고대기</a>
                                </li>
                                <li class="nav-item col-sm-4" style="margin: 0; padding: 0;">
                                    <a id="derivChkTab" class="nav-link" data-toggle="tab" href="#derivChk">검수대기</a>
                                </li>
                                <li class="nav-item col-sm-4" style="margin: 0; padding: 0;">
                                    <a id="derivOkTab" class="nav-link" data-toggle="tab" href="#derivOk">입고완료</a>
                                </li>
                            </ul>
                        </div>

                        <!-- content -->
                        <div class="tab-content">
                            <div id="derivWait" class="table-responsive tab-pane active">

                            </div>
                            <!-- derivWait END -->

                            <div id="derivChk" class="table-responsive tab-pane"></div>
                            <!-- derivChk END -->

                            <div id="derivOk" class="table-responsive tab-pane"></div>
                            <!-- derivOk -->

                        </div>
                        <!-- tab content END -->
                    </div>

                </div>
                <!-- card-body END -->

                <!-- 아래 지우지마 -->
            </div>
        </div>
        <!-- content 내용 -->
    </div>

    <%--  modal_1  --%>
    <div class="modal" id="modal_1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title font-weight-bold" style="color: #372c81;">검수요청 등록</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div id="derivWaitTable" class="modal-body">
                    <form name="deirvRegist" action="deirvRegist" onsubmit="return registChkSubmit()" method="post">
                    <table class="table table-bordered ">
                        <tr>
                            <th>발주번호</th>
                            <td><span id="modal1_1"></span></td>
                        </tr>
                        <tr>
                            <th>회사명</th>
                            <td><span id="modal1_3"></span></td>
                        </tr>
                        <tr>
                            <th>입고품목</th>
                            <td><span id="modal1_2"></span></td>
                        </tr>
                        <tr>
                            <th>총수량</th>
                            <td><span id="modal1_4"></span></td>
                        </tr>
                        <tr>
                            <th>입고일</th>
                            <td><input type="date" id="derivregdate" class="short-input" name="derivregdate" placeholder="yyyy-mm-dd"/></td>
                        </tr>
                    </table>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <input type="button" id="registCancle" class="btn btn_aio" data-dismiss="modal" value="취소">
                        <input type="submit" id="registsubmit" class="btn btn_aio" value="등록">
                        <input type="hidden" id="ordersid" name="ordersid">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- modal_1 END -->
</div>
<!-- 모달까지 감싸는 -->


<!-- footer  -->
<jsp:include page="../layout/footer.jsp"/>
<!-- /footer  -->

<!-- 입고관리 js -->
<script src="/js/derivative.js"></script>

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

<!-- Bootstrap -->
<script src="/node_modules/gentelella/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="/node_modules/gentelella/build/js/custom.min.js"></script>

</body>
</html>
