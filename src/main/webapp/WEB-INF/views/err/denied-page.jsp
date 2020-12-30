<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nextPage = (String) request.getAttribute("nextPage");
    String msg = (String) request.getAttribute("msg");
%>
<html>
<head>
    <title>AIO</title>
</head>
<body>
<script type="application/javascript">

    window.onload = function () {
        var nexPage = '${nextPage}';
        var msg = '${msg}';
        if(nexPage) {
            alert(msg);
            location.href = nexPage;
        } else {
            location.href = '${login}'
        }
    }

</script>
</body>
</html>
