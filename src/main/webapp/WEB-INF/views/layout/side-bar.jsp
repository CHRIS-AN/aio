<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="">
            <a href="/" class="site_title"><i class="fa fa-moon-o"></i> <span> All In One</span></a>
        </div>

        <div class="clearfix"></div>

        <br />
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-home"></i> 내 인사 정보 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/mypage">인사 정보</a></li>
                            <li><a href="/mypage/myCalendar">내 근태관리</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-edit"></i> 인사관리 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/hr">인사관리</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-desktop"></i> 제품관리 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/product/productList">제품관리</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-table"></i> 영업관리 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/yeonji/corpList">거래처관리</a></li>
                            <li><a href="/yeonji/ordersList">발주관리</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-bar-chart-o"></i> 물류관리 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/logistics/derivative">입고관리</a></li>
                            <li><a href="/logistics/release">출고관리</a></li>
                            <li><a href="#">재고관리</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-clone"></i> 회계관리 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/finance/purchaseSalesTradingRegister">전표등록</a></li>
                            <li><a href="/finance/outstandingAuthorization">결제승인대기</a></li>
                            <li><a href="/finance/statementManagement/list">전표관리</a></li>
                            <li><a href="/finance/incomeStatement">손익계산서</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->
    </div>
</div>

