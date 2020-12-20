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
<h1>거래처 등록</h1>

<div class="container">
    <form action="corpInsert" method="post">
        <table class="table table-bordered">
            <tr>
                <th>상호</th>
                <th><input type="text" name="corp_name" placeholder="내용을 입력해주세요" value="" autofocus></th>
            </tr>
            <tr>
                <th>사업자 등록번호</th>
                <th><input type="text" name="corp_num" placeholder="ex)000-00-00000" value="" autofocus></th>
            </tr>
            <tr>
                <th>대표자</th>
                <th><input type="text" name="corp_ceo" placeholder="내용을 입력해주세요" value="" autofocus></th>
            </tr>
            <tr>
                <th>연락처</th>
                <th><input type="text" name="corp_call" placeholder="연락처를 입력해주세요" value="" autofocus></th>
            </tr>
            <tr>
                <th>주소</th>
                <th><input type="text" name="corp_address" placeholder="도로명 주소" value="" autofocus><input type="button" value="주소 검색"></th>
<%--                <th><input type="text" name="corp_address" placeholder="상세정보" autofocus></th>--%>
            </tr>
        </table>
        <div>
            <input type="submit" value="등록" >
        </div>
    </form>
</div>


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
