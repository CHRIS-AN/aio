<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<!-- head -->
<jsp:include page="../../layout/header.jsp"/>
<!-- Datatables -->
<link href="/node_modules/gentelella/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
      rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
      rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
      rel="stylesheet">
<link href="/css/manage.css" rel="stylesheet">
</head>
<!-- head -->
<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <!-- sidebar -->
        <jsp:include page="../../layout/side-bar.jsp"/>
        <!-- /sidebar -->

        <!-- top-nav -->
        <jsp:include page="../../layout/top-nav.jsp"/>
        <!-- top-nav -->


        <!-- content -->
        <div class="right_col" role="main">

            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>인사 관리</h3>
                    </div>
                </div>
                <div id="datatable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
                    <form id="searchfrm">
                        <div class="row">
                            <div class="col-md-2">
                                <select id="cnt" class="">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                                <select id="dept" class="">
                                    <option value="부서명">부서명</option>
                                    <option value="인사">인사</option>
                                    <option value="제품">제품</option>
                                    <option value="영업">영업</option>
                                    <option value="물류">물류</option>
                                    <option value="회계">회계</option>
                                </select>
                            </div>
                            <div class="text-right col-md-10">
                                <input type="text" id="keyword"/>
                                <button type="button" id="searchBtn">검색</button>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row" id="hrm">

                            </div>
                            <div class="row text-right">
                                <div class="col-md-12">
                                    <btn id="resigBtn" class="btn btn-default">
                                        사원등록
                                    </btn>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer  -->
        <jsp:include page="../../layout/footer.jsp"/>
        <!-- /footer  -->

        <div id="resigDialog">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title cus-title">
                            <h2> 사원 등록 <small>Employee registration</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a id="close" class=""><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <form action="/hr" method="post" class="form needs-validation">
                                <div class="form-group has-feedback col-md-4 com-sm-4">
                                    <div class="row text-center">
                                        <img src="${emplForm.photo}" id="profile-image" class="img col-md-12 img-responsive">
                                    </div>
                                    <div class="filebox my-form">
                                        <label for="image-input-file">이미지 첨부</label>
                                        <input type="file" class="" id="image-input-file">
                                        <button type="button" class="btn btn-default btn-100" onclick="clearImg()">이미지 삭제</button>
                                    </div>
                                    <input type="hidden" value="${emplForm.photo}" id="photo" name="photo">
                                </div>
                                <div class="col-md-8">
                                <div class="row">
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>사원번호</label>
                                        <input type="text" name="emplId" value="${emplForm.emplId}" class="form-control"
                                               id="empl-id" placeholder="사원번호"/>
                                        <span>${valid_emplId}</span>
                                    </div>
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>성명</label>
                                        <input type="text" name="name" value="${emplForm.name}" class="form-control"
                                               id="name" placeholder="사원이름">
                                        <span>${valid_name}</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>주민등록 번호</label>
                                        <input type="text" name="jumin" value="${emplForm.jumin}" class="form-control"
                                               id="jumin" placeholder="900000-1111111">
                                        <span>${valid_jumin}</span>
                                    </div>
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>입사일자</label>
                                        <input class="date-picker form-control" name="emplRegdate"
                                               value="${emplForm.emplRegdate}" placeholder="yyyy-mm-dd" type="date"
                                               required="required"
                                               onfocus="this.type='date'" onmouseover="this.type='date'"
                                               onclick="this.type='date'" onblur="this.type='text'"
                                               onmouseout="timeFunctionLong(this)">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>부서명</label>
                                        <select name="dept" class="form-control">
                                            <option value="인사" ${emplForm.dept == '인사'? 'selected' : ''}>인사</option>
                                            <option value="제품" ${emplForm.dept == "제품"? 'selected' : ''}>제품</option>
                                            <option value="영업" ${emplForm.dept == "영업"? 'selected' : ''}>영업</option>
                                            <option value="물류" ${emplForm.dept == "물류"? 'selected' : ''}>물류</option>
                                            <option value="회계" ${emplForm.dept == "회계"? 'selected' : ''}>회계</option>
                                        </select>
                                    </div>
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>퇴사일자</label>
                                        <input class="date-picker form-control" name="emplResigdate"
                                               placeholder="yyyy-mm-dd" type="date" required="required"
                                               onfocus="this.type='date'" onmouseover="this.type='date'"
                                               onclick="this.type='date'" onblur="this.type='text'"
                                               onmouseout="timeFunctionLong(this)" disabled>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>연락처</label>
                                        <input type="text" name="phone" value="${emplForm.phone}" class="form-control"
                                               id="phone" placeholder="핸드폰 번호">
                                        <span>${valid_phone}</span>
                                    </div>
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>Email</label>
                                        <input type="text" name="email" value="${emplForm.email}" class="form-control"
                                               id="email" placeholder="Email">
                                        <span>${valid_email}</span>
                                    </div>
                                </div>
                                <div class="form-group has-feedback col-md-12 com-sm-12">
                                    <label class="col-md-12">주소</label>
                                    <div class="col-md-5 col-sm-5">
                                        <input type="text" name="post_num" value="${emplForm.post_num}"
                                               class="form-control" id="postnum" placeholder="우편번호" readonly>
                                        <span>${valid_post_num}</span>
                                    </div>
                                    <button type="button" id="postnumBtn" onclick="showjusoPopup('등록')"
                                            class="btn btn-default">검색
                                    </button>
                                </div>
                                <div class="form-group has-feedback col-md-12 com-sm-12">
                                    <div class="col-md-12">
                                        <input type="text" name="address" value="${emplForm.address}"
                                               class="form-control" id="address" placeholder="주소">
                                        <span>${valid_address}</span>
                                    </div>
                                </div>
                                <div class="form-group text-right has-feedback col-md-12 com-sm-12">
                                    <button type="submit" id="newEmplBtn" class="btn btn-default">등록</button>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="detailDialog">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title cus-title">
                            <h2> 사원 상세정보 <small>Details Employee</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a id="close1" class=""><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div id="detailContent" class="x_content">

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="updateDialog">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title cus-title">
                            <h2> 사원 수정 <small>Employee Modification</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a id="close2" class=""><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div id="updateContent" class="x_content">

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="resetpwDialog">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title cus-title">
                            <h2> 비밀번호 초기화</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a id="close3" class=""><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>

                        <div id="resetpwContent" class="x_content">

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    if (${not empty error}) {
        $("#resigDialog").show();
    }

</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    (function () {
        'use strict';

        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');

            // Loop over them and prevent submission
            Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        }, false)
    }())
    var type = ""

    function showjusoPopup(type1) {
        type = type1;
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.


                if (type == "등록") {
                    $("#postnum").val(data.zonecode);
                    $("#address").val(addr);
                    $("#address").focus();
                    // var extraAddr = ''; // 참고항목 변수
                } else if (type == "수정") {
                    $("#pdtnum").val(data.zonecode);
                    $("#updateAddr").val(addr);
                    $("#updateAddr").focus();
                }
                // 커서를 상세주소 필드로 이동한다.

            }
        }).open({autoClose: true});
    }
</script>
<script src="/js/manage.js"></script>
<!-- script -->
<jsp:include page="../../layout/script.jsp"/>
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
