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
           <a href="corpInsert">
               <button type="button" name="corpAdd" class="btn btn-primary" data-toggle="modal" data-target="#Modal_1">+</button>
           </a>
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
                <tr>
                    <td>${c.corp_id}</td>
                    <td>${c.corp_name}</td>
                    <td>${c.corp_ceo}</td>
                    <td>${c.corp_call}</td>
                    <td>누구냐넌</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    <!-- -->
    <%--  모달 1 : 거래처 등록록  --%>
    <div class="modal" id="Modal_1">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Modal body..
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

</div> <!-- End container -->




<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
