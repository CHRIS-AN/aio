<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>매출 / 매입 거래서</title>
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
           <h2><i class="fa far fa-edit"> 매출/매입 거래서</i></h2>
        </span>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-7 mb-5">
            <form action="#">
                <div class="container ">
                    <span class="row form-group">
                        <div class="col-4" style="">
                            <i class="fa fas fa-archive"></i>
                            <select class="form-control" id="trading">
                                <option>매출 거래</option>
                                <option>매입 거래</option>
                            </select>
                        </div>
                        <div class="col-2"></div>
                        <div class="form-group col-6">
                            <i class="fa far fa-id-badge"></i>
                            <input type="text" class="form-control" placeholder="작성자" maxlength="20">
                        </div>
                    </span>

                    <div class="form-group">
                        <i class="fa far fa-calendar"></i>
                        <input type="date" class="form-control" id="date" placeholder="전표등록 일자">
                    </div>

                    <div class="form-group">
                        <i class="fa fas fa-tasks"></i>
                        <input type="text" class="form-control" id="slipCode" placeholder="계정 코드">
                    </div>

                    <div class="form-group">
                        <i class="fa far fa-retweet"></i>
                        <input type="text" class="form-control" id="corp" placeholder="거래처">
                    </div>

                    <div class="form-group">
                        <i class="fa fas fa-dollar"></i>
                        <input type="text" class="form-control" id="slipPrice" placeholder="거래 금액">
                    </div>

                    <div class="form-group">
                        <i class="fa far fa-plus"></i> VAT(10%)
                        <input type="text" class="form-control" id="vax" placeholder="부가세">
                    </div>

                    <div class="form-group">
                        <i class="fa fas fa-pencil"></i>
                        <input type="text" class="form-control" id="summary" placeholder="적요">
                    </div>

                    <div>
                        <i class="fa far fa-credit-card"></i>
                        <input type="text" class="form-control" id="payMethod" placeholder="매출 계정">
                    </div>


                    <button type="submit" class="btn btn-outline-info mt-5" style="">전표 등록</button>
                </div>

            </form>
        </div>
    </div>
</div>
</form>
</body>
</html>
