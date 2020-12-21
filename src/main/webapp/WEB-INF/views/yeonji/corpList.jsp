<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>발주서 작성</title>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <![endif]-->


</head>
<body>
<h1>거래처 목록</h1>

<div class="container">

        <div>
            <label>거래처 검색 :</label>
            <input type="text" name="corpSearch">
        </div>
        <div>
            <button type="button" name="corpAdd" class="btn btn-primary" data-toggle="modal" data-target="#modal_1">+</button>
        </div>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>업체코드</th>
                <th>기업</th>
                <th>대표자</th>
                <th>연락처</th>
                <th>담당자(사원번호)</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="c" items="${corp}">
                <tr id="tr${c.corp_id}" data-toggle="modal" data-target="#modal_2"
                    onclick="modal2(${c.corp_id}, '${c.corp_name}', '${c.corp_num}', '${c.corp_ceo}', '${c.corp_call}', '${c.corp_address}'),update(${c.corp_id}, '${c.corp_name}', '${c.corp_num}', '${c.corp_ceo}', '${c.corp_call}', '${c.corp_address}')" >
                    <td>${c.corp_id}</td>
                    <td>${c.corp_name}</td>
                    <td>${c.corp_ceo}</td>
                    <td>${c.corp_call}</td>
                    <td>누구냐넌</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


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
                            <button name="corpDelete" class="btn btn-primary" data-toggle="modal" data-target="#Modal_4">삭제</button>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function modal2(corp_id,corp_name,corp_num,corp_ceo,corp_call,corp_address) {
            $("#modal2_1").html(corp_name);
            $("#modal2_2").html(corp_id);
            $("#modal2_3").html(corp_num);
            $("#modal2_4").html(corp_ceo);
            $("#modal2_5").html(corp_call);
            $("#modal2_6").html(corp_address);
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
                    <form action="corpUpdate" method="put">
                        <table class="table table-bordered">
                            <tr>
                                <th>상호</th>
                                <th><input type="text" class="form_control" id="modal3_1"/>(<input type="text" class="form_control"  id="modal3_2" />)</th>
                            </tr>
                            <tr>
                                <th>사업자 등록번호</th>
                                <th><span id="corp_num"></span></th>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <th><span id="modal3_4"></span></th>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <th><span id="modal3_5"></span></th>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <th><span id="modal3_6"></span></th>
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
        function update(corp_id,corp_name,corp_num,corp_ceo,corp_call,corp_address) {
            $('#modal_3').on('show.bs.modal', function (event) {
                var name = $(event.relatedTarget).data(corp_name);
                $("#modal3_1").val(name);
            })

            
            $("#modal3_2").val(corp_id);
            $("#modal3_3").val(corp_num);
            $("#modal3_4").val(corp_ceo);
            $("#modal3_5").val(corp_call);
            $("#modal3_6").val(corp_address);
        }

    </script>

</div> <!-- End container -->


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
