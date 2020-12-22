<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>거래처 조회</title>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!--[endif]-->

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom styles for this template -->
    <link href="../../../resources/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../../resources/static/css/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">거래처</h1>

<div class="container">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">거래처 조회</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>업체코드</th>
                        <th>기업</th>
                        <th>대표자</th>
                        <th>연락처</th>
                        <th>담당자(사원번호)</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>업체코드</th>
                        <th>기업</th>
                        <th>대표자</th>
                        <th>연락처</th>
                        <th>담당자(사원번호)</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="c" items="${corp}">
                        <tr id="tr${c.corp_id}" onclick="detail()" data-toggle="modal" data-target="#modal_2"
                            data-corpid="${c.corp_id}" data-corpname='${c.corp_name}' data-corpnum='${c.corp_num}' data-corpceo='${c.corp_ceo}' data-corpcall='${c.corp_call}' data-corpaddress='${c.corp_address}' >
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

</div>
<!-- /.container-fluid -->














    <%--  모달 1 : 거래처 등록록  --%>
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
                                <th><input type="text" name="corp_name" placeholder="내용을 입력해주세요" value="" autofocus></th>
                            </tr>
                            <tr>
                                <th>사업자 등록번호</th>
                                <th><input type="text" name="corp_num" placeholder="ex)000-00-00000" value="" autofocus></th>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <th><input type="text" name="corp_ceo" placeholder="내용을 입력해주세요" value="" autofocus></th>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <th><input type="text" name="corp_call" placeholder="연락처를 입력해주세요" value="" autofocus></th>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <th><input type="text" name="corp_address" placeholder="도로명 주소" value="" autofocus><input type="button" value="주소 검색"></th>
                                <%--                <th><input type="text" name="corp_address" placeholder="상세정보" autofocus></th>--%>
                            </tr>
                        </table>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-primary" value="등록" >
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>


    <%--  모달 2 : 거래처 상세정보  --%>
    <div class="modal" id="modal_2">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">거래처 등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                        <table class="table table-bordered">
                            <tr>
                                <th>상호</th>
                                <th><span id="modal2_1"></span>(<span id="modal2_2"></span>)</th>
                            </tr>
                            <tr>
                                <th>사업자 등록번호</th>
                                <th><span id="modal2_3"></span></th>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <th><span id="modal2_4"></span></th>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <th><span id="modal2_5"></span></th>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <th><span id="modal2_6"></span></th>
                            </tr>
                            <tr>
                                <th>담당자</th>
                                <th>누구냐넌</th>
                            </tr>
                            <tr>
                                <th>발주 품목</th>
                                <th>할수잇냐</th>
                            </tr>
                        </table>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button name="corpUpdate" value="modal2_2" class="btn btn-warning" data-toggle="modal" data-target="#modal_3" data-dismiss="modal" onclick="update()">수정</button>
                            <button name="corpDelete" class="btn btn-primary" data-toggle="modal" data-target="#modal_4">삭제</button>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    //거래처 상세정보
    function detail() {
        $('#modal_2').on('show.bs.modal', function (event) {
            var corpid = $(event.relatedTarget).data('corpid');
            var corpname = $(event.relatedTarget).data('corpname');
            var corpnum = $(event.relatedTarget).data('corpnum');
            var corpceo = $(event.relatedTarget).data('corpceo');
            var corpcall = $(event.relatedTarget).data('corpcall');
            var corpaddress = $(event.relatedTarget).data('corpaddress');

            $(this).find("#modal2_1").text(corpname);
            $(this).find("#modal2_2").text(corpid);
            $(this).find("#modal2_3").text(corpnum);
            $(this).find("#modal2_4").text(corpceo);
            $(this).find("#modal2_5").text(corpcall);
            $(this).find("#modal2_6").text(corpaddress);
        });
    }

    </script>

    <%--  모달 3 : 거래처 수정  --%>
    <div class="modal" id="modal_3">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">거래처 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="corpUpdate" method="post">
                        <table class="table table-bordered">
                            <tr>
                                <th>상호</th>
                                <th><input type="text" id="modal3_1"/>(<input type="text" id="modal3_2"/>)</th>
                            </tr>
                            <tr>
                                <th>사업자 등록번호</th>
                                <th><input type="text" id="modal3_3"/></th>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <th><input type="text" id="modal3_4"/></th>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <th><input type="text" id="modal3_5"/></th>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <th><input type="text" id="modal3_6"/></th>
                            </tr>
                            <tr>
                                <th>담당자</th>
                                <th>누구냐넌</th>
                            </tr>
                            <tr>
                                <th>발주 품목</th>
                                <th>할수잇냐</th>
                            </tr>
                        </table>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-primary" data-dismiss="modal" value="취소" >
                            <input type="submit" class="btn btn-primary" value="확인" >
                        </div>

                    </form>
                    <!-- Modal footer -->
                </div>
            </div>
        </div>
    </div>
    <script>
        //수정하기
        function update() {
            $('#modal_3').on('show.bs.modal', function (event) {
                var corpname = $('#modal2_1').text();
                var corpid = $('#modal2_2').text();
                var corpnum = $('#modal2_3').text();
                var corpceo = $('#modal2_4').text();
                var corpcall = $('#modal2_5').text();
                var corpaddress = $('#modal2_6').text();

                $(this).find("#modal3_1").val(corpname);
                $(this).find("#modal3_2").val(corpid);
                $(this).find("#modal3_3").val(corpnum);
                $(this).find("#modal3_4").val(corpceo);
                $(this).find("#modal3_5").val(corpcall);
                $(this).find("#modal3_6").val(corpaddress);
            });

        }
    </script>

    <%--  모달 4 : 거래처 삭제  --%>
    <div class="modal fade" id="modal_4">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">거래처 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    거래처를 정말로 삭제하시겠습니까?
                    <div class="modal-footer">
                        <form action="corpDelete" method="delete">
                            <input type="hidden" id="modal4_2">
                            <input type="button" class="btn btn-primary" data-dismiss="modal" value="취소" >
                            <input type="submit" class="btn btn-primary" value="확인"  onclick="corpDelete()">
                        </form>
                    </div>
                    <!-- Modal footer -->
                </div>
            </div>
        </div>
    </div>
    <script>
        //수정하기
        function corpDelete() {
            $('#modal_3').on('show.bs.modal', function (event) {
                var corpid = $('#modal2_2').text();
                $(this).find("#modal4_2").val(corpid);
            });
        }

    </script>
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
<script src="../../../resources/static/js/jquery.min.js"></script>
<script src="../../../resources/static/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../../resources/static/js/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../../resources/static/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="../../../resources/static/js/jquery.dataTables.min.js"></script>
<script src="../../../resources/static/js/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts / 검색&페이징 등 -->
<script src="../../../resources/static/js/datatables-demo.js"></script>

</body>
</html>
