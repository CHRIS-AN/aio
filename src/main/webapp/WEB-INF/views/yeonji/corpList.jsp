<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>AIO</title>

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
    <link href="/css/corporder.css" rel="stylesheet">

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
                    <div style="float:left">
                    <h1 class="m-0 font-weight-bold text-primary pl-3">거래처 조회</h1>
                    </div>
                    <div style="float: right">
                        <button type="button" id="corpAdd" name="corpAdd" class="btn btn-primary" data-toggle="modal"
                                data-target="#modal_1">+
                        </button>
                    </div>
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
                                    data-corpid="${c.corp_id}" data-corpname='${c.corpName}'
                                    data-corpnum='${c.corp_num}' data-corpceo='${c.corp_ceo}'
                                    data-corpcall='${c.corp_call}' data-corpaddress='${c.corp_address}'
                                    data-emplname='${c.empl.name}'>
                                    <td>${c.corp_id}</td>
                                    <td>${c.corpName}</td>
                                    <td>${c.corp_ceo}</td>
                                    <td>${c.corp_call}</td>
                                    <td>${c.empl.name}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
        </div>

        <!-- footer  -->
        <jsp:include page="../layout/footer.jsp" />
        <!-- /footer  -->


        <%--  모달 1 : 거래처 등록  --%>
        <div class="modal" id="modal_1">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h1 class="modal-title font-weight-bold text-primary pl-3">거래처 등록</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <form action="corpInsert" method="post" >
                            <table class="table">
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>상호</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" name="corpName" value="${corpError.corpName}" placeholder="내용을 입력해주세요" autofocus required/></th>
                                    <th style="border-style: none"> <p class="h5 font-weight-normal">한글과 영어 특수문자(<small> _ : , . ' ' ( ) </small>)만 가능</p> </th>
                                    <form:errors path="corpName"/>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corpName}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>사업자 등록번호</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" name="corp_num" placeholder="'-'를 포함해서 작성해주세요." value="${corpError.corp_num}"
                                               autofocus required/></th>
                                    <th style="border-style: none"> <p class="h5 font-weight-normal">ex)111-22-33333 </p></th>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corp_num}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>대표자</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" name="corp_ceo" placeholder="내용을 입력해주세요"  value="${corpError.corp_ceo}" autofocus required/></th>
                                    <th style="border-style: none"> <p class="h5 font-weight-normal">한글과 영어만 가능</p> </th>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corp_ceo}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>연락처</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" name="corp_call" placeholder="'-'를 포함해서 작성해주세요." value="${corpError.corp_call}"
                                               autofocus required/></th>
                                    <th style="border-style: none"><p class="h5 font-weight-normal"> ex)1588-1111</p> </th>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corp_call}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>주소</dt>   </th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" name="corp_address" placeholder="주소를 입력해주세요"
                                               autofocus required></th>
                                    <th style="border-style: none"> </th>
                                </tr>
                            </table>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-primary h4 p-2" value="등록" size="30">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>


        <%--  모달 2 : 거래처 상세정보  --%>
        <div class="modal" id="modal_2">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h2 class="modal-title font-weight-bold text-primary pl-3">거래처 상세정보</h2>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>상호(업체코드)</dt></th>
                                <th style="border-style: none"><span id="modal2_1"></span>(<span id="modal2_2"></span>)</th>
                            </tr>
                            <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>사업자 등록번호</dt></th>
                                <th style="border-style: none"><span id="modal2_3"></span></th>
                            </tr>
                            <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>대표자</dt></th>
                                <th style="border-style: none"><span id="modal2_4"></span></th>
                            </tr>
                            <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>연락처</dt></th>
                                <th style="border-style: none"><span id="modal2_5"></span></th>
                            </tr>
                            <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>주소</dt></th>
                                <th style="border-style: none"><span id="modal2_6"></span></th>
                            </tr>
                            <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>담당자</dt></th>
                                <th style="border-style: none"><span id="modal2_7"></span></th>
                            </tr>
                        </table>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button name="corpUpdate" value="modal2_2" class="btn btn-warning" data-toggle="modal"
                                    data-target="#modal_3" data-dismiss="modal" onclick="update()">수정
                            </button>
                            <button name="corpDelete" class="btn btn-danger" data-toggle="modal"
                                    data-target="#modal_4" onclick="corpDelete()">삭제
                            </button>
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
                    var emplname = $(event.relatedTarget).data('emplname');
                    $(this).find("#modal2_1").text(corpname);
                    $(this).find("#modal2_2").text(corpid);
                    $(this).find("#modal2_3").text(corpnum);
                    $(this).find("#modal2_4").text(corpceo);
                    $(this).find("#modal2_5").text(corpcall);
                    $(this).find("#modal2_6").text(corpaddress);
                    $(this).find("#modal2_7").text(emplname);
                });
            }
        </script>

        <%--  모달 3 : 거래처 수정  --%>
        <div class="modal" id="modal_3">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h1 class="modal-title font-weight-bold text-primary pl-3">거래처 수정</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="corpUpdate" method="post">
                            <table class="table">
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>상호</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" id="modal3_1" name="corpName" value="${corpError2.corpName}" placeholder="내용을 입력해주세요" autofocus required/>
                                        <input type="hidden" name="corp_id" id="modal3_2_2" ></th>
                                    <th style="border-style: none"> <p class="h5 font-weight-normal">한글과 영어 특수문자(<small> _ : , . ' ' ( ) </small>)만 가능</p> </th>
                                    <form:errors path="corpName"/>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corpName}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>사업자 등록번호</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" id="modal3_3" name="corp_num" value="${corpError2.corp_num}" placeholder="'-'를 포함해서 작성해주세요." autofocus required/>
                                    <th style="border-style: none"> <p class="h5 font-weight-normal">ex)111-22-33333 </p></th>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corp_num}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>대표자</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" id="modal3_4" name="corp_ceo" placeholder="내용을 입력해주세요" value="${corpError2.corp_ceo}" autofocus required/></th>
                                    <th style="border-style: none"> <p class="h5 font-weight-normal">한글과 영어만 가능</p> </th>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corp_ceo}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>연락처</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" id="modal3_5" name="corp_call" value="${corpError2.corp_call}" placeholder="'-'를 포함해서 작성해주세요." autofocus required/></th>
                                    <th style="border-style: none"><p class="h5 font-weight-normal"> ex)1588-1111</p> </th>
                                </tr>
                                <tr>
                                    <th style="border-style: none"></th>
                                    <th style="border-style: none; color: red;" colspan="2">${valid_corp_call}</th>
                                </tr>
                                <tr>
                                    <th class="h3 text-dark" style="border-style: none"><dt>주소</dt></th>
                                    <th style="border-style: none"><input type="text" class="p-1" style="width:100%" id="modal3_6" name="corp_address" value="${corpError2.corp_address}" placeholder="도로명 주소" autofocus required/></th>
                                    <th style="border-style: none">  </th>
                                </tr>
                            </table>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-primary" data-dismiss="modal" value="취소">
                                <input type="submit" class="btn btn-primary" value="확인">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
                    $(this).find("#modal3_2_1").html(corpid);
                    $(this).find("#modal3_2_2").val(corpid);
                    $(this).find("#modal3_3").val(corpnum);
                    $(this).find("#modal3_4").val(corpceo);
                    $(this).find("#modal3_5").val(corpcall);
                    $(this).find("#modal3_6").val(corpaddress);
                });
            }
        </script>

        <%--  모달 4 : 거래처 삭제  --%>
        <div class="modal" id="modal_4">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h2 class="modal-title font-weight-bold text-primary pl-3">거래처 삭제</h2>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="corpDelete" method="post">
                            <p class="h3 text-dark pl-3">거래처 <strong>" <span id="deleteCorpName"></span> "</strong> 을(를) 정말 삭제하시겠습니까?</p>
                            <input type="hidden" id="deleteCorpId" name="corp_id" value="">
                            <div class="modal-footer">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="submit" class="btn btn-primary" value="확인" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            //유효성 검사 에러 시 바로 모달 창 띄우기
                if(${not empty error}){
                    $( document ).ready(function() {
                        $("#modal_1").modal('show');
                    });

                }

                if(${not empty error2}){
                    $( document ).ready(function() {
                        $("#modal_3").modal('show');
                    });
                }

            //삭제하기
            function corpDelete() {
                $('#modal_4').on('show.bs.modal', function (event) {
                    var corpname = $('#modal2_1').text();
                    var corpid = $('#modal2_2').text();
                    $(this).find("#deleteCorpName").html(corpname);
                    $(this).find("#deleteCorpId").val(corpid);
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
