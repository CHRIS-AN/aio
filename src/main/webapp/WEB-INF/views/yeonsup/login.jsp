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
        .default-color {
            color: #372c81;
        }
        .login-box {
            margin: auto;
            margin-top: 20%;
            box-shadow: 0 0 10px #777777;
            border-radius: 15px;
        }
    </style>
</head>
<body class="body">
<div class="container-fluid">
    <div class="container">
        <div class="col-md-1"></div>
        <div class="row login-box col-md-10 p-lg-5">
            <div class="col-md-6">

            </div>
            <div class="col-md-6">
                <div class="row my-5">

                </div>
                <form action="/login" method="post" class="needs-validation" novalidate>
                    <h3 class="mb-5 default-color">로그인</h3>
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
                        <button class="btn btn-default col-sm-2" type="submit">
                            로그인
                        </button>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <br/>
                <br/>
                <hr>
                <a href="">비밀번호를 잊어버렸을시 여기를 클릭하세요.</a>
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
</div>
<script type="application/javascript" th:fragment="form-validation">
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
</script>
<script src='https://unpkg.com/magic-snowflakes/dist/snowflakes.min.js'></script>
<script>
    var sf = new Snowflakes({
        count: 75, // 갯수
        minOpacity: 0.0, // 최소 투명도 0: 투명 | 1: 불투명
        maxOpacity: 0.6 // 최대 투명도
    });
</script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>
