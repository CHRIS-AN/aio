<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/node_modules/gentelella/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/node_modules/gentelella/vendors/animate.css/animate.min.css" rel="stylesheet">

</head>
<body class="login">
    <div class="container">
        <div class="col-lg-4">

        </div>

        <div class="col-lg-8">
            <div class="login_wrapper animated">

                <form action="/login" method="post" class="needs-validation" novalidate>
                    <h1>로그인</h1>
                    <div class="form-group login_box">
                        <div>
                            <label for="empl_id">사원번호 </label>
                            <input type="text" name="username" class="form-control" placeholder="사원번호" required/>
                        </div>
                    </div>
                    <div class="form-group login_box">
                        <div>
                            <label for="password">비밀번호 </label>
                            <input type="password" name="password" class="form-control" placeholder="비밀번호" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-default col-sm-2" type="submit">
                            로그인
                        </button>
                        <a class="col-sm-10">비밀번호를 잊어버렸을시 여기를 클릭하세요.</a>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>


            </div>
            <br />
            <br />
            <c:if test="${param.error != null}">
                <div class="row">
                <div class="alert alert-danger" role="alert">
                    <p>사원번호 또는 패스워드가 일치하지 않습니다.</p>
                    <p>정확히 확인하시고 다시 입력해주세요.</p>
                </div>
                </div>
            </c:if>
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
</body>
</html>
