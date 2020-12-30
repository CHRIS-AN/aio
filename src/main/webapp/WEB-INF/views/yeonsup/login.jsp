<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/node_modules/gentelella/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/node_modules/gentelella/vendors/animate.css/animate.min.css" rel="stylesheet">
    <script src="/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>


    <style>
        html {
            overflow: hidden;
        }

        .body {
            overflow: auto;
            display: flex;
            align-items: center;
        }

        .body::before {
            background-image: url("/images/login_wolf2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;

            z-index: -1;
            filter: blur(5px);
            -webkit-filter: blur(5px);
            -moz-filter: blur(5px);
            -o-filter: blur(5px);
            transform: scale(1.02);

        }

        .gray-color {
            color: #515053;
        }

        .login-box {
            margin: auto;
            box-shadow: 0 0 10px #888888;
            border-radius: 15px;
            padding: 0;
            padding-right: 0;
            padding-left: 0;
            background: white;
        }

        .login-inner-box {
            padding: 3em;
        }

        #corp-details {
            padding-right: 0;
            padding-left: 0;
            overflow: hidden;
            background: #b8b7b7;
            border-radius: 15px 0 0 15px;
        }

        .image {
            width: 100%;
            height: auto;
            bottom: 0;
            position: absolute;
            opacity: 0.9888;
        }

        .hrNum {
            color: #16358d;
            font-weight: bold;
        }
    </style>
</head>
<body class="body">
<div class="container-fluid">
    <div class="container">
        <div class="row login-box col-md-11">
            <div id="corp-details" class="col-md-6">
                <div class="image"><img src="/images/login_winter.png" width="100%"></div>
            </div>
            <div class="col-md-6 login-inner-box">

                <h1 class="my-lg-4">AIO <small>All In One</small></h1>
                <small>AIO에 오신 것을 환영 합니다! 흰눈사이로~ 썰매를 타고~ 새해 복 많이 받으세요</small><br/>
                <small class="text-danger">비밀번호 초기 설정은 핸드폰 번호 뒤 4자리를 입력하시면 됩니다.</small>

                <form action="/login" method="post" class="needs-validation" novalidate>
                    <h3 class="my-5 gray-color">로그인</h3>
                    <div class="form-group my-lg-4">
                        <div>
                            <label>사원번호 </label>
                            <input type="text" name="username" class="form-control" placeholder="사원번호" required/>
                        </div>
                    </div>
                    <div class="form-group my-lg-4">
                        <div>
                            <label>비밀번호 </label>
                            <input type="password" name="password" class="form-control" placeholder="비밀번호" required/>
                        </div>
                    </div>
                    <div class="form-group my-lg-4">
                        <button class="btn btn-default col-sm-2 float-right" type="submit">
                            로그인
                        </button>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <br/>
                <hr>
                <a class="btn btn-link" onclick="showFGModal()">비밀번호를 잊어버렸을시 여기를 클릭하세요.</a>
                <c:if test="${param.error != null}">
                    <div class="row mx-auto my-4">
                        <div class="alert alert-danger" role="alert">
                            <p>사원번호 또는 패스워드가 일치하지 않습니다.</p>
                            <p>정확히 확인하시고 다시 입력해주세요.</p>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="col-md-1"></div>

    </div>
    <div class="modal" id="pwmodal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Forgot Password</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <p>비밀번호를 잊어버리셨나요?</p>
                    <p><span class="hrNum">0341</span> 여기로 전화주세요.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
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
    $(".close").click(function (){
        $("#pwmodal").hide();
    });
    function showFGModal() {
        $("#pwmodal").show();

    }
</script>
<script src='https://unpkg.com/magic-snowflakes/dist/snowflakes.min.js'></script>
<script>

    var sf = new Snowflakes({
        color: '#fff',
        count: 75, // 갯수
        container: document.querySelector('#corp-details'),
        minSize: 2,
        maxSize: 10,
        speed: 0.5,
        minOpacity: 1, // 최소 투명도 0: 투명 | 1: 불투명
        maxOpacity: 1, // 최대 투명도
        zIndex: 9999
    });
</script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>
