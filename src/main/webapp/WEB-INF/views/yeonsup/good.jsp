<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AIO</title>
</head>
<body>
<script>
    <% String good = (String) request.getAttribute("good"); %>
    <% if(good.equals("1")) { %>
        alert("비밀번호 변경이 완료되었습니다.<br /> 다시 로그인해 주세요.")
        location.href = "/logout"
    <% } else { %>
        alert("비밀번호 변경 실패하였습니다. 다시 시도해 주세요");
        location.href = "/mypage"
    <% } %>
</script>
</body>
</html>
