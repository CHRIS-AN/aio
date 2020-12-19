<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta content="text/html" charset="UTF-8" http-equiv="Content-Type">
    <title>발주 목록</title>
</head>
<body>
<h2>발주 목록</h2>
<table style="text-align: center">
    <tr>
        <th bgcolor="aqua" width="100">업체코드</th>
        <th bgcolor="aqua" width="100">거래처</th>
        <th bgcolor="aqua" width="100">담당자</th>
        <th bgcolor="aqua" width="100">품목</th>
        <th bgcolor="aqua" width="100">납기일자</th>
        <th bgcolor="aqua" width="100">총수량</th>
        <th bgcolor="aqua" width="100">총금액</th>
        <th bgcolor="aqua" width="100">상태</th>
    </tr>
    <jsp:useBean id="ordersList" scope="request" type="java.util.List"/>
    <c:forEach var="odL" items="${ordersList}">
        <tr>
            <td>${odL.orders_id}</td>
            <td>어디냐</td>
            <td>누구냐</td>
            <td>어떤거냐</td>
            <td>${odL.orders_regdate}</td>
            <td>${odL.orders_cnt}</td>
            <td>${odL.orders_totsum}</td>
            <td>${odL.orders_state}</td>
        </tr>
    </c:forEach>

</table>
<br>
</body>
</html>











