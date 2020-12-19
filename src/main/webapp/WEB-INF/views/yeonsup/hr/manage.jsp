<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<!-- head -->
<jsp:include page="../../layout/header.jsp" />
<!-- Datatables -->
<link href="/node_modules/gentelella/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="/node_modules/gentelella/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<link href="/css/manage.css" rel="stylesheet">
</head>
<!-- head -->
<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <!-- sidebar -->
        <jsp:include page="../../layout/side-bar.jsp" />
        <!-- /sidebar -->

        <!-- top-nav -->
        <jsp:include page="../../layout/top-nav.jsp" />
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
        <jsp:include page="../../layout/footer.jsp" />
        <!-- /footer  -->

        <div id="resigDialog">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title cus-title">
                            <h2> 사원 등록 <small>different form elements</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li><a id="close" class=""><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <form action="/hr" method="post" class="form">
                                <div class="form-group has-feedback col-md-12 com-sm-12">
                                    <label class="col-md-12">사진</label>
                                    <img src="${emplForm.photo}" id="profile-image" class="col-md-3 img img-responsive">
                                    <div class="col-md-7">
                                        <input type="file" class="form-control" id="image-input-file">
                                        <input type="hidden" id="photo" name="photo">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>사원번호</label>
                                        <input type="text" name="emplId" value="${emplForm.emplId}" class="form-control" id="empl-id" placeholder="사원번호"/>
                                        <span>${valid_emplId}</span>
                                    </div>
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>성명</label>
                                        <input type="text" name="name" value="${emplForm.name}" class="form-control" id="name" placeholder="사원이름">
                                        <span>${valid_name}</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>주민등록 번호</label>
                                        <input type="text" name="jumin" value="${emplForm.jumin}" class="form-control" id="jumin" placeholder="900000-1111111">
                                        <span>${valid_jumin}</span>
                                    </div>
                                    <div class="form-group has-feedback col-md-6 com-sm-6">
                                        <label>입사일자</label>
                                        <input class="date-picker form-control"  name="emplRegdate" value="${emplForm.emplRegdate}" placeholder="yyyy-mm-dd" type="date" required="required"
                                               onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'"
                                               onmouseout="timeFunctionLong(this)">
                                    </div>
                                </div>
                                <div class="row">
                                <div class="form-group has-feedback col-md-6 com-sm-6">
                                    <label>부서명</label>
                                    <select name="dept" class="form-control">
                                        <option value="인사" selected="${emplForm.dept eq "인사"}">인사</option>
                                        <option value="제품" selected="${emplForm.dept eq "제품"}">제품</option>
                                        <option value="영업" selected="${emplForm.dept eq "영업"}">영업</option>
                                        <option value="물류" selected="${emplForm.dept eq "물류"}">물류</option>
                                        <option value="회계" selected="${emplForm.dept eq "회계"}">회계</option>
                                    </select>
                                </div>
                                <div class="form-group has-feedback col-md-6 com-sm-6">
                                    <label>퇴사일자</label>
                                    <input class="date-picker form-control" name="emplResigdate" placeholder="yyyy-mm-dd" type="date" required="required"
                                           onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'"
                                           onmouseout="timeFunctionLong(this)" disabled>
                                </div>
                                </div>
                                <div class="row">
                                <div class="form-group has-feedback col-md-6 com-sm-6">
                                    <label>연락처</label>
                                    <input type="text" name="phone" value="${emplForm.phone}" class="form-control" id="phone" placeholder="핸드폰 번호">
                                    <span>${valid_phone}</span>
                                </div>
                                <div class="form-group has-feedback col-md-6 com-sm-6">
                                    <label>Email</label>
                                    <input type="text" name="email" value="${emplForm.email}" class="form-control" id="email" placeholder="Email">
                                    <span>${valid_email}</span>
                                </div>
                                </div>
                                <div class="form-group has-feedback col-md-12 com-sm-12">
                                    <label class="col-md-12">주소</label>
                                    <div class="col-md-5 col-sm-5">
                                        <input type="text" name="post_num" value="${emplForm.post_num}" class="form-control" id="postnum" placeholder="우편번호">
                                        <span>${valid_post_num}</span>
                                    </div>
                                    <button id="postnumBtn" class="btn btn-default">검색</button>
                                </div>
                                <div class="form-group has-feedback col-md-12 com-sm-12">
                                    <div class="col-md-12">
                                        <input type="text" name="address" value="${emplForm.address}" class="form-control" id="address" placeholder="주소">
                                        <span>${valid_address}</span>
                                    </div>
                                </div>
                                <div class="form-group text-right has-feedback col-md-12 com-sm-12">
                                    <button type="submit" id="newEmplBtn" class="btn btn-default">등록</button>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
                            <h2> 사원 등록 <small>different form elements</small></h2>
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
                            <h2> 사원 수정 <small>different form elements</small></h2>
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
    if(${not empty error}) {
        $("#resigDialog").show();
    }
</script>
<script src="/js/manage.js"></script>
<!-- script -->
<jsp:include page="../../layout/script.jsp" />
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
