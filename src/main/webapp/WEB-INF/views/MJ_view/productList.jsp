<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>글 목록</title>
</head>
<body>
<h1>제품 목록</h1>
<table style="text-align: center">
    <tr>
        <th bgcolor="#808080" width="100">번호</th>
        <th bgcolor="#808080" width="100">제품명</th>
        <th bgcolor="#808080" width="100">단위</th>
        <th bgcolor="#808080" width="100">카테고리</th>
    </tr>
    <c:forEach var="vo" items="${productList}">
        <tr>
            <td>${vo.prod_id}</td>
            <td align="left"><a href="getProduct?prod_id=${vo.prod_id}">${vo.prodName}</a></td>
            <td>${vo.prod_bundle}</td>
            <td>${vo.prod_catag}</td>
        </tr>
    </c:forEach>
</table>
    <a href="insertProduct" >제품 등록</a>
</body>
</html>