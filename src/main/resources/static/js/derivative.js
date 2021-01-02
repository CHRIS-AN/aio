function addId(tableId) {

    var tableScript =
        "<script src='/js/jquery.easing.min.js'></script>" +
        "<script src='/js/sb-admin-2.min.js'></script>" +
        "<script src='/js/jquery.dataTables.min.js'></script>" +
        "<script src='/js/dataTables.bootstrap4.min.js'></script>" +
        "<script src='/js/datatables-demo.js'></script>"


    if (tableId == "derivChk") {
        $(".derivWaitT").removeAttr('id');
        $(".derivChkT").removeAttr('id');
        $(".derivOkT").removeAttr('id');
        $(".derivChkT").attr('id', 'dataTable');
    } else if (tableId == "derivOk") {
        $(".derivWaitT").removeAttr('id');
        $(".derivChkT").removeAttr('id');
        $(".derivOkT").removeAttr('id');
        $(".derivOkT").attr('id', 'dataTable');
    }
    $("#tableScript").html("");
    $("#tableScript").html(tableScript);
}

// ======= 입고대기 =======

function regist_deriv(ordersid, prodtitle) {

    $.ajax({
        url: "./getOrdersList/" + ordersid,
        type: "GET",
        cache: false,
        success: function (data) {

            var ordersId = data.ordersid;
            var regDate = data.orders_regdate;
            var prodTitle = prodtitle;
            var corpName = data.corp.corpName;
            var totcnt = data.orders_cnt
            // var addParam = "<input type='hidden' id='ordersid' name='ordersid' value='" + ordersid + "'>"

            $("#modal_1_1").text(ordersId);
            $("#modal_1_2").text(regDate);
            $("#modal_1_3").text(corpName);
            $("#modal_1_4").text(prodTitle);
            $("#modal_1_5").text(totcnt + "개");
            $("#ordersid").val(ordersId);
        }
    })
} // regist_deriv() END

function registChkSubmit() {

    var registOk = confirm("현재날짜로 검수요청 하시겠습니까?")

    if (!registOk) {
        return false;
    }
    return true;
} // registChkSubmit() END

// ======= 입고대기 END =======


// ======= 검수요청 =======

function confirm_deriv(derivid, emplId, emplDept) {

    $.ajax({
        url: "./getDerivList/" + derivid,
        type: "GET",
        cache: false,
        success: function (data) {
            derivChkList(data, emplId, emplDept)
        }
    })
} // confirm_deriv() END

function derivChkList(data, emplId, emplDept){

    var contentW = "";
    var drafts = data.ordersid.draft;

    var derivid = data.derivid;
    var derividStr = "입고번호 : D" + derivid;
    var derivregdate = "입고일 : " + data.derivregdate;
    var derivcorpname = data.ordersid.corp.corpName;
    var derivtotcnt = data.ordersid.orders_cnt;
    var derivordersid = data.ordersid.ordersid;

    $("#modal_2_1").text(derividStr);
    $("#modal_2_2").text(derivregdate);
    $("#modal_2_3").text(derivordersid);
    $("#modal_2_4").text(derivcorpname);
    $("#derivid").val(derivid);
    $("#ordersidParam").val(derivordersid);


    if (emplDept.indexOf("물류") != -1 || emplId.indexOf("admin") != -1) {

        contentW += "<table class='table'><thead><tr class='prodHeader'>" +
            "<th>번호</th>" +
            "<th>제품코드</th>" +
            "<th>입고품목</th>" +
            "<th>발주수량</th>" +
            "<th>실입고수량</th>" +
            "</tr></thead>" +
            "<tbody>"

        for (var i = 0; i < drafts.length; i++) {
            contentW += "<tr>"
            contentW += "<td>" + (1 + i) + "</td>"
            contentW += "<td>" + drafts[i].product.prod_id + "</td>"
            contentW += "<td>" + drafts[i].product.prodName + "</td>"
            contentW += "<td>" + drafts[i].draft_cnt + "</td>"
            contentW += "<td><input type='number' class='confirmCntLen' id='confirmCntD[" + i + "].derivokconfirmcnt'" +
                "name='confirmCntD[" + i + "].derivokconfirmcnt' onkeydown='onlyNum(event)' onkeyup='sum();'></td>"
            contentW += "</tr>"
        }
    } else {
        contentW += "<table class='table'><thead><tr tr class='prodHeader'>" +
            "<th>번호</th>" +
            "<th>제품코드</th>" +
            "<th>입고품목</th>" +
            "<th>발주수량</th>" +
            "</tr></thead>" +
            "<tbody>"
        for (var i = 0; i < drafts.length; i++) {
            contentW += "<tr>"
            contentW += "<td>" + (1 + i) + "</td>"
            contentW += "<td>" + drafts[i].product.prod_id + "</td>"
            contentW += "<td>" + drafts[i].product.prodName + "</td>"
            contentW += "<td>" + drafts[i].draft_cnt + "</td>"
            contentW += "</tr>"
        }
        contentW += "</tbody></table>"
    }
    $(".listTableProds").html(contentW);

    $(".totalProdCnt").text("총 " + drafts.length + "품목");
    $(".totalOrdersCnt").text(derivtotcnt);

    $(".totalDerivCnt").css("color", "#f57c32")
    $(".totalDerivCnt").eq('0').text("0")
} // derivChkList() END

function onlyNum(event) {
    if(!((event.keyCode > 95 && event.keyCode < 106)
        || (event.keyCode > 47 && event.keyCode < 58)
        || event.keyCode == 8)) {
        return false;
    }
} // onlyNum() END

function sum(){

    var cnt = $(".confirmCntLen")
    var totCnt = parseInt(0)
    var orderCnt = $(".totalOrdersCnt").eq('0').text();

    for (var i = 0; i <cnt.length; i++){

        if (cnt.eq(i).val() == ""){
            totCnt = totCnt + parseInt(0)
        } else if (cnt.eq(i).val() != ""){
            totCnt = totCnt + parseInt(cnt.eq(i).val())
        }
    }
    if (totCnt < orderCnt || totCnt > orderCnt){
        $(".totalDerivCnt").css("color", "#f57c32")
    } else if (totCnt == orderCnt){
        $(".totalDerivCnt").css("color", "#372c81")
    }

    $(".totalDerivCnt").eq('0').text(totCnt)
} // sum() END

function confirmOnSubmit() {

    var inputChk = $(".confirmCntLen")
    var confirmTotCnt = $(".totalDerivCnt").eq('0').text()
    var orderCnt = $(".totalOrdersCnt").eq('0').text()

    for (var i = 0; i <inputChk.length; i++){
        if (inputChk.eq(i).val() == ""){

            alert("검수수량을 입력해주세요")
            inputChk.eq(i).focus();
            return false;
        }
    }

    if (confirmTotCnt != orderCnt){
        alert("총 발주수량과 실제 총 입고수량과 다릅니다.\n"+
            "입고수량을 다시 확인해주세요. ")
        inputChk.eq(0).focus();
        return false;
    }

    var confirmOk = confirm("입고확정 하시겠습니까?")

    if (!confirmOk) {
        return false;
    }

    var totalDerivCnt = $(".totalDerivCnt").eq('0').text();
    $("#derivokconfirmtotcnt").val(totalDerivCnt);

    return true;
} // registChkSubmit() END

// ======= 검수요청 END =======


// ======= 입고완료 =======

function derivOkModal(derivid) {

    $.ajax({
        url: "./getDerivList/" + derivid,
        type: "GET",
        cache: false,
        success: function (data) {
            derivOkList(data)
        }
    })
} // derivOkModal

function derivOkList(data){

    var contentW = "";
    var drafts = data.ordersid.draft;

    var derivid = data.derivid;
    var derividStr = "입고번호 : D" + derivid;
    var derivregdate = "입고일 : " + data.derivregdate;
    var derivcorpname = data.ordersid.corp.corpName;
    var derivtotcnt = data.ordersid.orders_totsum;
    var derivordersid = data.ordersid.ordersid;
    var derivConfirmCnt = data.derivlistid;
    var derivConfirmTotCnt = data.derivokconfirmtotcnt;
    var derivInspector = data.emplid.name + "(" + data.emplid.emplId + ")"

    $("#modal_3_1").text(derividStr);
    $("#modal_3_2").text(derivregdate);
    $("#modal_3_3").text(derivordersid);
    $("#modal_3_4").text(derivcorpname);

    contentW += "<table class='table'><thead><tr class='prodHeader'>" +
        "<th>번호</th>" +
        "<th>제품코드</th>" +
        "<th>입고품목</th>" +
        "<th>발주수량</th>" +
        "<th>실입고수량</th>" +
        "</tr></thead>" +
        "<tbody>"

    for (var i = 0; i < drafts.length; i++) {
        contentW += "<tr>"
        contentW += "<td>" + (1 + i) + "</td>"
        contentW += "<td>" + drafts[i].product.prod_id + "</td>"
        contentW += "<td>" + drafts[i].product.prodName + "</td>"
        contentW += "<td>" + drafts[i].draft_cnt + "</td>"
        contentW += "<td>" + derivConfirmCnt[i].derivokconfirmcnt + "</td>"
        contentW += "</tr>"
    }
    contentW += "</tbody></table>"

    $(".OkList").html(contentW);

    $(".totalProdCnt").text("총 " + drafts.length + "품목");
    $(".totalOrdersCnt").text(derivtotcnt);

    $(".totalDerivCnt").css("color", "#372c81")
    $(".totalDerivCnt").eq('1').text(derivConfirmTotCnt)

    $("#inspector").text(derivInspector)
} // derivChkList() END





