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

function regist_deriv() {
    $('#modal_1').on('show.bs.modal', function (event) {
        var odersid = $(event.relatedTarget).data('odersid');
        var prodtitle = $(event.relatedTarget).data('prodtitle');
        var corpname = $(event.relatedTarget).data('corpname');
        var totcnt = $(event.relatedTarget).data('totcnt');
        $(this).find("#modal1_1").text(odersid);
        $(this).find("#modal1_2").text(prodtitle);
        $(this).find("#modal1_3").text(corpname);
        $(this).find("#modal1_4").text(totcnt);
        $(this).find("#modal1_4").text(totcnt);
        $(this).find("#ordersid").val(odersid);
    });
}

function confirm_deriv(derivid, emplId, emplDept) {

    $.ajax({
        url: "./derivChk/" + derivid,
        type: "GET",
        cache: false,
        success: function (data) {
            var contentW = "";
            var drafts = data.ordersid.draftseq;

            var derivid = data.derivid;
            var derividStr = "입고번호 : D" + derivid;
            var derivregdate = "입고일 : " + data.derivregdate;
            var derivcorpname = data.ordersid.crop;
            var derivtotcnt = data.ordersid.testorderscnt;
            var derivordersid = data.ordersid.testordersid;


            $("#modal_2_1").text(derividStr);
            $("#modal_2_2").text(derivregdate);
            $("#modal_2_3").text(derivordersid);
            $("#modal_2_4").text(derivcorpname);
            $("#modal_2_5").text(derivtotcnt);
            $("#derivid").val(derivid);
            $("#ordersidParam").val(derivordersid);


            if (emplDept.indexOf("물류") != -1 || emplId.indexOf("admin") != -1) {

                contentW += "<table class='table'><thead><tr class='prodHeader'>" +
                    "<th>번호</th>" +
                    "<th>제품코드</th>" +
                    "<th>입고품목</th>" +
                    "<th>발주 수량</th>" +
                    "<th>실입고 수량</th>" +
                    "</tr></thead>" +
                    "<tbody>"
                for (var i = 0; i < drafts.length; i++) {
                    contentW += "<tr>"
                    contentW += "<td>" + (1 + i) + "</td>"
                    contentW += "<td>" + drafts[i].product.prod_id + "</td>"
                    contentW += "<td>" + drafts[i].product.prodName + "</td>"
                    contentW += "<td>" + drafts[i].draft_cnt + "</td>"
                    contentW += "<td><input type='text' class='confirmCntLen' id='confirmCnt[" + i + "].derivokconfirmcnt' name='confirmCnt[" + i + "].derivokconfirmcnt'></td>"
                    contentW += "</tr>"
                }
            } else {
                contentW += "<table><thead><tr>" +
                    "<th>번호</th>" +
                    "<th>제품코드</th>" +
                    "<th>입고품목</th>" +
                    "<th>발주 수량</th>" +
                    "</tr></thead>" +
                    "<tbody>"
                for (var i = 0; i < data.length; i++) {
                    contentW += "<tr>"
                    contentW += "<td>" + i + "</td>"
                    contentW += "<td>" + data[i].ordersid.draftseq[i].product.prod_id + "</td>"
                    contentW += "<td>" + data[i].ordersid.draftseq[i].product.prodName + "</td>"
                    contentW += "<td>" + data[i].ordersid.testorderscnt + "</td>"
                    contentW += "</tr>"
                }
                contentW += "</tbody></table>"
            }
            $(".listTableProds").html(contentW);
        }
    })
}



// 부트스트랩 모달이 닫히면 안에 있는 값 리셋
$(".registCancle").on('click', function () {

    $("#derivregdate").val("");
});

function registChkSubmit() {

    var frm = document.forms["deirvRegist"];
    var regdate = frm["derivregdate"].value.trim();

    if (regdate == "") {
        alert("입고일을 입력해주세요.")
        return false;
    }

    var registOk = confirm("검수요청 하시겠습니까?")

    if (!registOk) {
        return false;
    }
    return true;
} // registChkSubmit() END


function confirmSubmit() {
    alert("이리오너라")
    // var frm = document.forms["deirvConfirm"];
    var confirmOk = confirm("입고확정 하시겠습니까?")

    if (!confirmOk) {
        return false;
    }

    var totalDerivCnt = $(".totalDerivCnt").val();
    $("#derivokconfirmtotcnt").val(totalDerivCnt);

    return false;
} // registChkSubmit() END


