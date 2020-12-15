<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- head -->
<jsp:include page="layout/header.jsp" />
</head>
<!-- head -->
<body class="nav-md">
    <div class="container body">
        <div class="main_container">

            <!-- sidebar -->
            <jsp:include page="layout/side-bar.jsp" />
            <!-- /sidebar -->

            <!-- top-nav -->
            <jsp:include page="layout/top-nav.jsp" />
            <!-- top-nav -->


            <!-- content -->
            <div class="right_col" role="main">

                <!-- footer  -->
                <jsp:include page="layout/footer.jsp" />
                <!-- /footer  -->
            </div>
            <!-- /content -->


        </div>
    </div>
<!-- script -->
    <jsp:include page="layout/script.jsp" />
<!-- /script -->
</body>
</html>
