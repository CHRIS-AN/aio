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
    <link href="/css/logisticStyle.css" rel="stylesheet">


    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>

    <style>

        /* 리스트 - 탭 */
        .aio_maincolor {
            text-align: center;
            background-color: #f5f5f5;
            color: #6a5acd;
            height: 50px;
            font-size: 1.3em;
            font-weight: bold;
            border-top: 2px solid #eee;
            border-left: 2px solid #eee;
            border-right: 2px solid #eee;
        }

        .aio_maincolor:hover {
            background-color: #a69ce1 !important;
            color: #f5f5f5;
        }

        .aio_maincolor.active, .aio_maincolor.active:hover {
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
            font-size: 1.2em;
        }

        .tab-content .table-responsive input, .tab-content .table-responsive select {
            height: 25px;
        }

        #requestTable {
            font-size: 1.2em;
        }

        #requestTable tr {
            height: 25px;
        }

        #modal_1 .btn_aio {
            background-color: #6a5acd;
            color: #f5f5f5;
            width: 70px;
            height: 40px;
            font-size: 0.75em;
            font-weight: bold;
        }

        #modal_1 .btn_aio2 {
            background-color: #e0e0e0;
            color: #404040;
            width: 70px;
            height: 40px;
            font-size: 0.75em;
            font-weight: bold;
        }

        #modal_2 .btn_aio {
            background-color: #6a5acd;
            color: #f5f5f5;
            width: 70px;
            height: 40px;
            font-size: 1.05em;
            font-weight: bold;
        }

        #modal_2 .btn_aio2 {
            background-color: #e0e0e0;
            color: #404040;
            width: 70px;
            height: 40px;
            font-size: 1.05em;
            font-weight: bold;
        }

        #modal_3 .btn_aio {
            background-color: #6a5acd;
            color: #f5f5f5;
            width: 70px;
            height: 40px;
            font-size: 1.05em;
            font-weight: bold;
        }

        .dataTable td[id^=tr_title]:hover {
            color: #6a5acd;
            cursor: pointer;
        }

        .modalHeanderColor {
            background-color: #372c81;
        }

        .modalHeanderColor .close {
            color: #ddd;
        }

        .modal-footer {
            margin-top: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

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
            <jsp:param name="empl" value="${nowEmpl}"/>
        </jsp:include>
        <!-- Page Heading -->

        <div class="right_col" role="main">


            <div class="">

                <!-- DataTales Example -->
                <div class="card shadow mb-4">

                    <div class="card-header py-3">
                        <h2 class="m-0 font-weight-bold"
                            style="color: #372c81;">물류관리 &gt; 출고관리</h2>
                    </div>

                    <div class="card-body">

                        <!-- tab -->
                        <div class="listTabWrap">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="nav-item col-sm-4" style="margin: 0; padding: 0;">
                                    <a id="requestTab" class="nav-link aio_maincolor active" data-toggle="tab"
                                       href="#requestStore">출고요청</a>
                                </li>
                                <li class="nav-item col-sm-4" style="margin: 0; padding: 0;">
                                    <a id="releaWaitTab" class="nav-link aio_maincolor" data-toggle="tab"
                                       href="#releaWait" onclick="addId('releaWait'); this.onclick=null;">출고대기</a>
                                </li>
                                <li class="nav-item col-sm-4" style="margin: 0; padding: 0;">
                                    <a id="releaOkTab" class="nav-link aio_maincolor" data-toggle="tab"
                                       href="#releaOk" onclick="addId('releaOk'); this.onclick=null;">출고완료</a>
                                </li>
                            </ul>
                        </div>

                        <!-- content -->
                        <div class="tab-content">

                            <div id="requestStore" class="table-responsive tab-pane active">
                                <table id='dataTable' class='table table-bordered requestT' width='100%'
                                       cellpadding='0'>
                                    <thead>
                                    <tr>
                                        <th>출고요청번호</th>
                                        <th>출고요청품목</th>
                                        <th>지점명</th>
                                        <th>총수량</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>출고요청번호</th>
                                        <th>출고요청품목</th>
                                        <th>지점명</th>
                                        <th>총수량</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="reqList" items="${requestList}">
                                        <tr id='tr ${reqList.key.requestid}'>
                                            <td>Q${reqList.key.requestid}</td>
                                            <td id="tr_title${reqList.key.requestid}"
                                                onclick="regist_relea('${reqList.key.requestid}', '${nowEmpl.emplId}', '${nowEmpl.dept}')"
                                                data-toggle="modal" data-target="#modal_1">
                                                    ${reqList.value}</td>
                                            <td>${reqList.key.storename}</td>
                                            <td>${reqList.key.requesttotcnt}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- requestStore END -->


                            <div id="releaWait" class="table-responsive tab-pane">
                                <table class='table table-bordered releaWaitT' width='100%' cellpadding='0'>
                                    <thead>
                                    <tr>
                                        <th>출고번호</th>
                                        <th>출고대기일</th>
                                        <th>출고품목</th>
                                        <th>지점명</th>
                                        <th>총 수량</th>
                                        <th>작업자</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>출고번호</th>
                                        <th>출고대기일</th>
                                        <th>출고품목</th>
                                        <th>지점명</th>
                                        <th>총 수량</th>
                                        <th>작업자</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="waitList" items="${releaWaitList}">
                                        <tr id="tr${waitList.releaid}">
                                            <td>R${waitList.releaid}</td>
                                            <td>${waitList.relearegdate}</td>
                                            <td id="tr_title${waitList.releatitle}"
                                                onclick="confirm_relea()"
                                                data-toggle="modal" data-target="#modal_2"
                                                data-releaid="${waitList.releaid}"
                                                data-relearegdate='${waitList.relearegdate}'
                                                data-prodtitle='${waitList.releatitle}'
                                                data-storename='${waitList.requestid.storename}'
                                                data-totcnt='${waitList.releaOktotcnt}'>
                                                    ${waitList.releatitle}</td>
                                            <td>${waitList.requestid.storename}</td>
                                            <td>${waitList.releaOktotcnt}</td>
                                            <td>${waitList.emplid.name}(${waitList.emplid.emplId})</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- derivChk END -->


                            <div id="releaOk" class="table-responsive tab-pane">
                                <table class='table table-bordered releaOkT' width='100%' cellpadding='0'>
                                    <thead>
                                    <tr>
                                        <th>출고번호</th>
                                        <th>출고일</th>
                                        <th>출고품목</th>
                                        <th>지점명</th>
                                        <th>총 수량</th>
                                        <th>작업자</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>출고번호</th>
                                        <th>출고일</th>
                                        <th>출고품목</th>
                                        <th>지점명</th>
                                        <th>총 수량</th>
                                        <th>작업자</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="okList" items="${releaOkList}">
                                        <tr id='tr${okList.releaid}'>
                                            <td>R${okList.releaid}</td>
                                            <td>${okList.releaokconfirmdate}</td>
                                            <td id="tr_title${okList.releaid}"
                                                onclick="releaOkModal('${okList.releaid}')"
                                                data-toggle="modal" data-target="#modal_3">
                                                    ${okList.releatitle}</td>
                                            <td>${okList.requestid.storename}</td>
                                            <td>${okList.releaOktotcnt}</td>
                                            <td>${okList.emplid.name}(${okList.emplid.emplId})</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- releaOk END -->

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
                <div class="modal-header modalHeanderColor">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div id="requestTable" class="modal-body">
                    <form name="releaRegist" action="releaRegist" onsubmit="return reqConfirmSubmit()" method="post">
                        <input type="hidden" id="requestid" name="requestid">
                        <input type="hidden" id="releaOktotcnt" name="releaOktotcnt">
                        <input type="hidden" id="releastate" name="releastate" value="출고대기">
                        <input type="hidden" id="emplid" name="emplid" value="${nowEmpl.emplId}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div class="ListWrap">
                            <div class="modalTileTxt"><span>출고요청 리스트</span></div>

                            <div class="listTableTitle">
                                <table class="table">
                                    <tr>
                                        <th>출고요청번호</th>
                                        <td><span id="modal_1_1"></span></td>
                                    </tr><tr>
                                        <th>출고요청일</th>
                                        <td><span id="modal_1_2"></span></td>
                                    </tr><tr>
                                        <th>지점명</th>
                                        <td><span id="modal_1_3"></span></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="listTableProds"></div>

                            <c:choose>
                                <c:when test="${nowEmpl.dept eq '물류' || nowEmpl.emplId eq 'admin'}">
                                    <div>
                                        <div class="resultAll">
                                            <div><span class="totalProdCnt"></span></div>
                                            <div>
                                                <span class="totalReqCnt"></span>
                                                <span>&nbsp;/&nbsp;</span>
                                                <span class="totalReleaCnt"></span>
                                            </div>
                                        </div>

                                        <div class="inspectorName"><span>작업자&nbsp;:&nbsp;</span><span>${nowEmpl.name}(${nowEmpl.emplId})</span></div>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <div class="resultAll">
                                        <div><span class="totalProdCnt"></span></div>
                                        <div><span class="totalReqCnt"></span></div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!-- ListWrap END -->
                        <c:if test="${nowEmpl.dept eq '물류' || nowEmpl.emplId eq 'admin'}">
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="button" id="reqCancle" class="btn btn_aio2" data-dismiss="modal"
                                        value="취소"/>
                                <input type="submit" id="reqSubmit" class="btn btn_aio" value="출고대기"/>
                            </div>
                        </c:if>
                    </form>
                </div>
                <!-- modal body -->
            </div>
        </div>
    </div>
    <!-- modal_1 END -->

    <%--  modal_2  --%>
    <div class="modal" id="modal_2">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header modalHeanderColor">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div id="releaWaitTable" class="modal-body">
                    <form name="releaOk" action="releaOk" onsubmit="return releaOkSubmit()" method="post">
                        <input type="hidden" id="releaid" name="releaid"/>
                        <input type="hidden" id="releastate1" name="releastate" value="출고완료">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div class="ListWrap">
                            <div class="modalTileTxt"><span>출고요청</span></div>

                            <div class="listTableTitle">
                                <table class="table">
                                    <tr>
                                        <th>출고번호</th>
                                        <td><span id="modal_2_1"></span></td>
                                    </tr>
                                    <tr>
                                        <th>출고대기일</th>
                                        <td><span id="modal_2_2"></span></td>
                                    </tr>
                                    <tr>
                                        <th>지점명</th>
                                        <td><span id="modal_2_3"></span></td>
                                    </tr>
                                    <tr>
                                        <th>품목</th>
                                        <td><span id="modal_2_4"></span></td>
                                    </tr>
                                    <tr>
                                        <th>총수량</th>
                                        <td><span id="modal_2_5"></span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- ListWrap END -->
                        <c:if test="${nowEmpl.dept eq '물류' || nowEmpl.emplId eq 'admin'}">
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="button" class="btn btn_aio2" data-dismiss="modal" value="취소"/>
                                <input type="submit" class="btn btn_aio" value="출고완료"/>
                            </div>
                        </c:if>
                    </form>
                </div>
                <!-- modal body -->
            </div>
        </div>
    </div>
    <!-- modal_2 END -->

    <%--  modal_3  --%>
    <div class="modal" id="modal_3">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header modalHeanderColor">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                      <div class="ListWrap">
                            <div class="modalTileTxt"><span>출고완료 리스트</span></div>

                            <div class="listTableTitle">
                                <table class="table">
                                    <tr>
                                        <th>출고번호</th>
                                        <td><span id="modal_3_1"></span></td>
                                    </tr>
                                    <tr>
                                        <th>출고일</th>
                                        <td><span id="modal_3_2"></span></td>
                                    </tr>
                                    <tr>
                                        <th>출고지점</th>
                                        <td><span id="modal_3_3"></span></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="OkList"></div>

                          <div class="resultAll">
                              <div><span class="totalProdCnt"></span></div>
                              <div>
                                  <span class="totalReqCnt"></span>
                                  <span>&nbsp;/&nbsp;</span>
                                  <span class="totalReleaCnt"></span>
                              </div>
                          </div>

                          <div class="inspectorName"><span id="inspector"></span></div>

                          <!-- Modal footer -->
                          <div class="modal-footer">
                              <input type="button" class="btn btn_aio" data-dismiss="modal" value="확인"/>
                          </div>

                      </div>
                        <!-- ListWrap END -->
                </div>
                <!-- modal body -->
            </div>
        </div>
    </div>
    <!-- modal_3 END -->

</div>
<!-- 모달까지 감싸는 -->


<!-- footer  -->
<jsp:include page="../layout/footer.jsp"/>
<!-- /footer  -->

<!-- 출고관리 js -->
<script src="/js/release.js"></script>


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

<div id="tableScript">
    <!-- Core plugin JavaScript-->
    <script src="/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/js/jquery.dataTables.min.js"></script>
    <script src="/js/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts / 검색&페이징 등 -->
    <script src="/js/datatables-demo.js"></script>
</div>

<!-- Bootstrap -->
<script src="/node_modules/gentelella/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="/node_modules/gentelella/build/js/custom.min.js"></script>

</body>
</html>