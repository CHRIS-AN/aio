<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta content="text/html; charset=UFT-8" http-equiv="Content-Type">
    <title>제품 등록 form</title>
</head>
<body>
<h3>제품 등록</h3>
<hr>

<form action="insertProduct" method="post">
    <table border="1" cellpadding="0" cellspacing="0" style="text-align: center;">
            <tr>
                <td bgcolor="#e3e3e3" width="70">제품명</td>
                <td align="left"><input type="text" name="prodName"/></td>
                <td>${valid_prodName}</td>
                <form:errors path="prodName"/>
            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">단위</td>
                <td align="left"><input type="text" name="prod_bundle" size="10"/></td>
                <td>${valid_prod_bundle}</td>
            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">판매가</td>
                <td align="left"><input type="text" name="sell_price" size="10"/></td>
                <td>${valid_sell_price}</td>
            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">구매가</td>
                <td align="left"><input type="text" name="buy_price" size="10"/></td>
                <td>${valid_buy_price}</td>
            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">카테고리</td>
                <td align="left"><input type="text" name="prod_catag" size="10"/></td>
                <td>${valid_prod_catag}</td>
            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">제품 설명</td>
                <td align="left"><textarea name="prod_explain" cols="40" rows="10"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="등록하기"/>
                </td>
            </tr>
    </table>
</form>

</body>
</html>
