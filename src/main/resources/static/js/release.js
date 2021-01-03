function addId(tableId) {

    var tableScript =
        "<script src='/js/jquery.easing.min.js'></script>" +
        "<script src='/js/sb-admin-2.min.js'></script>" +
        "<script src='/js/jquery.dataTables.min.js'></script>" +
        "<script src='/js/dataTables.bootstrap4.min.js'></script>" +
        "<script src='/js/datatables-demo.js'></script>"


    if (tableId == "releaWait") {
        $(".requestT").removeAttr('id');
        $(".releaWaitT").removeAttr('id');
        $(".releaOkT").removeAttr('id');
        $(".releaWaitT").attr('id', 'dataTable');
    } else if (tableId == "releaOk") {
        $(".requestT").removeAttr('id');
        $(".releaWaitT").removeAttr('id');
        $(".releaOkT").removeAttr('id');
        $(".releaOkT").attr('id', 'dataTable');
    }
    $("#tableScript").html("");
    $("#tableScript").html(tableScript);
}

// ======= 출고요청 =======

function regist_relea(requestid, emplId, emplDept) {

    $.ajax({
        url: "./getReqList/" + requestid,
        type: "GET",
        cache: false,
        success: function (data) {
            reqList(data, emplId, emplDept)
        }
    })
} // regist_relea() END

function reqList(data, emplId, emplDept){

    console.log(data)
    var contentW = "";
    var reqList = data.dummyLists;

    var requestid = data.requestid;
    var requestidStr = "S" + requestid;
    var requestregdate = data.requestregdate;
    var storename = data.storename;
    var requesttotcnt = data.requesttotcnt;

    $("#modal_1_1").text(requestidStr);
    $("#modal_1_2").text(requestregdate);
    $("#modal_1_3").text(storename);
    $("#requestid").val(requestid);


    if (emplDept.indexOf("물류") != -1 || emplId.indexOf("admin") != -1) {

        contentW += "<table class='table'><thead><tr class='prodHeader'>" +
            "<th>번호</th>" +
            "<th>제품코드</th>" +
            "<th>출고요청품목</th>" +
            "<th>출고요청수량</th>" +
            "<th>실출고수량</th>" +
            "</tr></thead>" +
            "<tbody>"

        for (var i = 0; i < reqList.length; i++) {
            contentW += "<tr>"
            contentW += "<td>" + (1 + i) + "</td>"
            contentW += "<td>" + reqList[i].prodid.prod_id+ "</td>"
            contentW += "<td>" + reqList[i].prodid.prodName + "</td>"
            contentW += "<td>" + reqList[i].requestcnt + "</td>"
            contentW += "<td><input type='number' class='confirmCntLen' id='confirmCntR[" + i + "].releaokconfirmcnt'" +
                "name='confirmCntR[" + i + "].releaokconfirmcnt' onkeydown='onlyNum(event)' onkeyup='sum();'></td>"
            contentW += "</tr>"
        }
    } else {
        contentW += "<table class='table'><thead><tr tr class='prodHeader'>" +
            "<th>번호</th>" +
            "<th>제품코드</th>" +
            "<th>출고요청 품목</th>" +
            "<th>출고요청 수량</th>" +
            "<th>실출고 수량</th>" +
            "<tbody>"
        for (var i = 0; i < reqList.length; i++) {
            contentW += "<tr>"
            contentW += "<td>" + (1 + i) + "</td>"
            contentW += "<td>" + reqList[i].product.prod_id + "</td>"
            contentW += "<td>" + reqList[i].product.prodName + "</td>"
            contentW += "<td>" + reqList[i].draft_cnt + "</td>"
            contentW += "</tr>"
        }
        contentW += "</tbody></table>"
    }
    $(".listTableProds").html(contentW);

    $(".totalProdCnt").text("총 " + reqList.length + "품목");
    $(".totalReqCnt").text(requesttotcnt);

    $(".totalReleaCnt").css("color", "#f57c32")
    $(".totalReleaCnt").eq('0').text("0")
} // reqList() END

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
    var reqCnt = $(".totalReqCnt").eq('0').text();

    for (var i = 0; i <cnt.length; i++){

        if (cnt.eq(i).val() == ""){
            totCnt = totCnt + parseInt(0)
        } else if (cnt.eq(i).val() != ""){
            totCnt = totCnt + parseInt(cnt.eq(i).val())
        }
    }
    if (totCnt < reqCnt || totCnt > reqCnt){
        $(".totalReleaCnt").css("color", "#f57c32")
    } else if (totCnt == reqCnt){
        $(".totalReleaCnt").css("color", "#372c81")
    }

    $(".totalReleaCnt").eq('0').text(totCnt)
} // sum() END

function reqConfirmSubmit() {

    var inputChk = $(".confirmCntLen")
    var releaCnt = $(".totalReleaCnt").eq('0').text()
    var reqCnt = $(".totalReqCnt").eq('0').text()

    for (var i = 0; i <inputChk.length; i++){
        if (inputChk.eq(i).val() == ""){

            alert("출고수량을 입력해주세요")
            inputChk.eq(i).focus();
            return false;
        }
    }

    if (releaCnt != reqCnt){
        alert("총 출고요청수량과 실제 총 출고수량과 다릅니다.\n"+
            "출고수량을 다시 확인해주세요. ")
        inputChk.eq(0).focus();
        return false;
    }

    var confirmOk = confirm("출고대기 하시겠습니까?")

    if (!confirmOk) {
        return false;
    }

    $("#releaOktotcnt").val(releaCnt);

    return true; // 완성되면 바꾸기
} // reqChkSubmit() END

// ======= 출고요청 END =======


// ======= 출고대기 =======

function confirm_relea() {

    $('#modal_2').on('show.bs.modal', function (event) {
        var releaid = $(event.relatedTarget).data('releaid');
        var releaidStr = "R" + $(event.relatedTarget).data('releaid');
        var relearegdate = $(event.relatedTarget).data('relearegdate');
        var prodtitle = $(event.relatedTarget).data('prodtitle');
        var storename = $(event.relatedTarget).data('storename');
        var totcnt = $(event.relatedTarget).data('totcnt');

        $(this).find("#modal_2_1").text(releaidStr);
        $(this).find("#modal_2_2").text(relearegdate);
        $(this).find("#modal_2_3").text(storename);
        $(this).find("#modal_2_4").text(prodtitle);
        $(this).find("#modal_2_5").text(totcnt + "개");
        $(this).find("#releaid").val(releaid);
    });
} // confirm_relea() END

function releaOkSubmit() {

    var confirmOk = confirm("현재날짜로 출고완료 하시겠습니까?")

    if (!confirmOk) {
        return false;
    }
    return true;
} // releaOkSubmit() END

// ======= 검수요청 END =======


// ======= 입고완료 =======

function releaOkModal(releaid) {

    $.ajax({
        url: "./getReleaList/" + releaid,
        type: "GET",
        cache: false,
        success: function (data) {
            releaOkList(data)
        }
    })
} // derivOkModal

function releaOkList(data){

    var contentW = "";
    console.log(data)
    var reqList = data.requestid.dummyLists;
    var releaList = data.releaselists;

    var releaid = data.releaid;
    var releaidStr = "R" + releaid;
    var releaokconfirmdate = "출고일 : " + data.releaokconfirmdate;
    var storename = data.requestid.storename;
    var reqtotcnt = data.requestid.requesttotcnt;
    var releaOktotcnt = data.releaOktotcnt;
    var releaInspector = data.emplid.name + "(" + data.emplid.emplId + ")"

    $("#modal_3_1").text(releaidStr);
    $("#modal_3_2").text(releaokconfirmdate);
    $("#modal_3_3").text(storename);

    contentW += "<table class='table'><thead><tr class='prodHeader'>" +
        "<th>번호</th>" +
        "<th>제품코드</th>" +
        "<th>출고요청품목</th>" +
        "<th>출고요청수량</th>" +
        "<th>실출고수량</th>" +
        "</tr></thead>" +
        "<tbody>"

    for (var i = 0; i < reqList.length; i++) {
        contentW += "<tr>"
        contentW += "<td>" + (1 + i) + "</td>"
        contentW += "<td>" + reqList[i].prodid.prod_id + "</td>"
        contentW += "<td>" + reqList[i].prodid.prodName + "</td>"
        contentW += "<td>" + reqList[i].requestcnt + "</td>"
        contentW += "<td>" + releaList[i].releaokconfirmcnt + "</td>"
        contentW += "</tr>"
    }
    contentW += "</tbody></table>"

    $(".OkList").html(contentW);

    $(".totalProdCnt").text("총 " + reqList.length + "품목");
    $(".totalReqCnt").text(reqtotcnt);

    $(".totalReleaCnt1").css("color", "#372c81")
    $(".totalReleaCnt1").eq('0').text(releaOktotcnt)

    $("#inspector").text(releaInspector)
} // releaOkList() END





