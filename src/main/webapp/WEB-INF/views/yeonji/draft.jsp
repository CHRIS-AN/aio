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
<h1>발주서 작성</h1>

<div class="container">
    <form action="draft" method="post">
        <div>
            <label>거래처 :</label>
            <input type="text" name="corp">
        </div>
        <div>
            <label>희망일시:</label>
            <input type="date" name="orders_regdate">
            <input type="button" name="prodadd" value="+" >
            <input type="button" name="prodremove" value="-">
        </div>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>No</th>
                <th>상품명</th>
                <th>단위</th>
                <th>수량</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="d" items="${}">
                <tr>
                    <td>${d.draft_seq}</td>
                    <td>로션</td>
                    <td>6개</td>
                    <td>${d.draft_cnt}</td>
                    <td>${d.draft_prod_price}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div>
            <span>총수량 :<input type="text" value="0"><label>개</label></span>
            <span>총금액 :<input type="text" value="0"><label>원</label></span>
        </div>
        <input type="submit" value="발주요청">
    </form>
</div>


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
