<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>손익계산서</title>
    <link href="/node_modules/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/nprogress/nprogress.css" rel="stylesheet">
    <link href="/node_modules/gentelella/vendors/animate.css/animate.min.css" rel="stylesheet">
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="/node_modules/gentelella/vendors/jquery/dist/jquery.min.js"></script>
    <jsp:include page="../layout/header.jsp" />
</head>
<body class="nav-md">

<div class="container body">
    <div class="main_container">

        <jsp:include page="../layout/side-bar.jsp" />
        <jsp:include page="../layout/top-nav.jsp" >
            <jsp:param name="empl" value="${empl}"/>
        </jsp:include>
        <!-- content -->
        <div class="right_col" role="main">
            <div class="row">
                <span class="col-12 text-center mt-5">
                   <h2>손익계산서</h2>
                </span>
                <div class="col-5 mt-5">
                    <div>&nbsp;</div>
                    <select name="months" class="form-control" id="months" onchange="selectMonth()">
                        <option disabled selected>조회기간 설정</option>
                        <option value="1">1개월</option>
                        <option value="2">2개월</option>
                        <option value="3">3개월</option>
                        <option value="4">4개월</option>
                        <option value="5">5개월</option>
                        <option value="6">6개월</option>
                        <option value="7">7개월</option>
                        <option value="8">8개월</option>
                        <option value="9">9개월</option>
                        <option value="10">10개월</option>
                        <option value="11">11개월</option>
                        <option value="12">12개월</option>
                    </select>

                    <em>${searchDate}</em> <strong>~</strong> <em>${nowDate}</em>
                </div>
            </div>
            <!-- http://localhost:7942/finance/incomeStatement# -->
            <form method="post" action="/finance/excelDown">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div>
                    <table class="table table-striped">
                        <thead class="table table-striped">
                            <tr>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th>과목</th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th>금액</th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                            </tr>  <!-- 과목/금액 -->
                        </thead>
                        <tbody>
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>Ⅰ. 매출액(take)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${take}
                                    <input type="hidden" name="take" value="${take}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 매출액 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>Ⅱ. 매출원가(costOfSales)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${costOfSales}
                                        <input type="hidden" name="costOfSales" value="${costOfSales}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 매출원가 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>Ⅲ. 매출 총이익(grossProfit)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${grossProfit}
                                        <input type="hidden" name="grossProfit" value="${grossProfit}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 매출총이익 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매비와 관리비(maintenanceSales)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${maintenanceSales}
                                        <input type="hidden" name="maintenanceSales" value="${maintenanceSales}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 판매비와 관리비 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>Ⅳ. 영업이익(salesIncome)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${salesIncome}
                                        <input type="hidden" name="salesIncome" value="${salesIncome}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 영업이익 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기타수익(otherIncome)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${otherIncome}
                                        <input type="hidden" name="otherIncome" value="${otherIncome}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 기타수익 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기타비용(otherExpenses)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${otherExpenses}
                                        <input type="hidden" name="otherExpenses" value="${otherExpenses}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 기타비용 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>Ⅵ. 법인세비용(incomeTaxExpense)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${incomeTaxExpense}
                                        <input type="hidden" name="incomeTaxExpense" value="${incomeTaxExpense}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 법인세비용 -->
                            <tr>
                                <th>-</th>
                                <th>-</th>
                                <th>-</th>
                                <th>-</th>
                                <th>-</th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th> </th>
                                <th>-</th>
                                <th>-</th>
                                <th>-</th>
                                <th>-</th>
                                <th>-</th>
                            </tr> <!-- 여백 -->
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <th>Ⅶ. 당기순이익(netIncome)</th>
                                <td></td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td>
                                    ${netIncome}
                                        <input type="hidden" name="netIncome" value="${netIncome}">
                                </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr> <!-- 당기순이익 -->
                        </tbody>
                    </table>
                </div>

                <div style="text-align: right;">
                    Excel :
                    <button class="btnMyself info">download</button>
                </div>
            </form>
        </div>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>

<script>
    function selectMonth() {
        var monthSelect = document.getElementById("months");
        var months = monthSelect.options[document.getElementById("months").selectedIndex].value;
        location.href = "/finance/incomeStatement?months=" + months
    }
</script>
<!-- script -->
<jsp:include page="../layout/script.jsp" />
<!-- /script -->

</body>
</html>
