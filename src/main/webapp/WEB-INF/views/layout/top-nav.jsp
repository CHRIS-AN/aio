<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="cus-dropdown" aria-expanded="false">
                        <c:if test="${ not empty empl.photo}">
                            <img src="${empl.photo}" alt=""><span>${empl.name}</span>
                        </c:if>
                        <c:if test="${ empty empl.photo}">
                            <img src="/images/tiger.png" alt=""><span>${empl.name}</span>
                        </c:if>
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="/mypage"> 내 인사 정보 </a></li>
                        <li><a href="/searchCorwork"> 사원 검색하기 </a></li>
                        <li>
                            <a>
                                <form class="" action="/logout" method="post">
                                        <button type="submit" style="border: none; background: none; color: #5A738E">
                                            <i class="fa fa-sign-out pull-right"></i> 로그아웃
                                        </button>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </nav>
    </div>
</div>