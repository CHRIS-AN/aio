<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
    <title>승인 요청 대기</title>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/node_modules/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/node_modules/@yaireo/tagify/dist/tagify.css">
    <link rel="stylesheet" href="/node_modules/summernote/dist/summernote-bs4.min.css">
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/node_modules/jdenticon/dist/jdenticon.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <div class="row mb-5">

        <span class="col-12 text-center">
            <h2>승인 요청 대기</h2>
            <span class="row form-group">
                <div class="col-6"></div>
                <h2><i class="fa fas fa-search col-1 mt-5"></i></h2>
                <span class="col-5 mt-5">
                    <form action="/finance/search/slip" class="form-inline" method="get">
                        <input type="search" class="form-control" placeholder="검색어를 입력해주세요." maxlength="20"
                                       aria-label="Search" name="keyword"/>
                    </form>
                </span>
            </span>

            <div class="col-3 mt-5">
<%--                <c:if test="${studyPage.getTotalElements() == 0}">--%>
<%--                     <strong id="keyword" class="context">${keyword}</strong>에 해당하는 전표가 없습니다.--%>
<%--                </c:if>--%>

<%--                <c:if test="${studyPage.getTotalElements() > 0}">${}">--%>
<%--                     <strong id="keyword" class="context">${keyword}</strong>에 해당하는 전표를 찾았습니다.--%>
<%--                </c:if>--%>
            </div>

            <div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>전표번호</th>
                        <th>등록날짜</th>
                        <th>거래유형</th>
                        <th>계정코드</th>
                        <th>금액</th>
                        <th>거래처명</th>
                        <th>적요</th>
                        <th>작성자명</th>
                        <th>결제승인</th>
                    </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${slipList}" var="slip">
                            <tr>
                                <td>${slip.slipId}</td>
                                <td>${slip.slip_date}</td>
                                <td>${slip.tradingType}</td>
                                <td>${slip.slip_code}</td>
                                <td>${slip.slip_account}</td>
                                <td>${slip.corp}</td>
                                <td>${slip.slip_summary}</td>
                                <td>${slip.slip_write}</td>

                                <td>
                                    <c:choose>
                                        <c:when test="${empty slipList || fn:length(slipList) != 0}">
                                            <a href="/finance/outstandingAuthorizationDetailView/${slip.slipId}/view"
                                            class="btn btn-primary" role="button">상세보기</a>
                                        </c:when>
                                        <c:otherwise>
<%--                                            <a href="" class="btn btn-primary"--%>
<%--                                               role="button">수정</a>--%>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </span>

        <div class="row justify-content-center">
            <div class="col-sm-10">
                <nav>
                    <ul class="pagination justify-content-center">
                        <!-- Previous -->
                        <li class="page-item" value="${!slipList.hasPrevious()}? disabled">
                            <a href="/finance/search/slip?keyword=${keword}&sort=${sortProperty}desc&page=${slipList.getNumber()-1}"
                                        class="page-link" tabindex="-1" aria-disabled="true">
                            </a>
                        </li>
                        <!-- Page -->
                        <li class="page-item" ${i == slipList.getNumber()}? active
                        </li>
                        <!-- Next -->
                        <li></li>
                    </ul>
                </nav>
            </div>

        </div>

    </div>
</div>


<script>

</script>
</body>
</html>
