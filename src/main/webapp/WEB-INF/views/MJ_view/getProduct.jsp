<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta content="text/html" charset="UTF-8" http-equiv="Content-Type">
    <title>제품 상세</title>
</head>
<body>
    <h3>제품 상세</h3>
    <hr>
    <form action="updateProduct" method="post">
        <input name="prod_id" type="hidden" value="${product.prod_id}">
        <table border="1" cellpadding="0" cellspacing="0" style="text-align: center;">
            <tr>
                <td bgcolor="#e3e3e3" width="70">제품명</td>
                <td align="left"><input type="text" name="prodName" value="${product.prodName}"/></td>
                <td>${valid_prodName}</td>
                <form:errors path="prodName"/>
            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">단위</td>
                <td align="left"><input type="text" name="prod_bundle" value="${product.prod_bundle}"/></td>
                <td>${valid_prod_bundle}</td>

            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">판매가</td>
                <td align="left"><input type="text" name="sell_price" value="${product.sell_price}"/></td>
                <td>${valid_sell_price}</td>

            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">구매가</td>
                <td align="left"><input type="text" name="buy_price" value="${product.buy_price}"/></td>
                <td>${valid_buy_price}</td>

            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">카테고리</td>
                <td align="left"><input type="text" name="prod_catag" value="${product.prod_catag}"/></td>
                <td>${valid_prod_catag}</td>

            </tr>
            <tr>
                <td bgcolor="#e3e3e3" width="70">제품설명</td>
                <td align="left"><textarea name="prod_explain" cols="40" rows="10">${product.prod_explain}</textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="수정하기"/>
                </td>
            </tr>
        </table>
    </form>
    <hr>
    <a href="deleteProduct?prod_id=${product.prod_id}">글 삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="getProductList">리스트</a>&nbsp;&nbsp;&nbsp;&nbsp;
</body>
</html>
