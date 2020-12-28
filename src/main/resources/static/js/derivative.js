function addId(tableId){

    var tableScript =
        "<script src='/js/bootstrap.bundle.min.js'></script>" +
        "<script src='/js/jquery.easing.min.js'></script>" +
        "<script src='/js/sb-admin-2.min.js'></script>" +
        "<script src='/js/jquery.dataTables.min.js'></script>" +
        "<script src='/js/dataTables.bootstrap4.min.js'></script>" +
        "<script src='/js/datatables-demo.js'></script>"

    if (tableId == "derivWait") {
        $(".derivWaitT").removeAttr('id');
        $(".derivChkT").removeAttr('id');
        $(".derivOkT").removeAttr('id');

    } else if (tableId == "derivChk") {
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

function confirm_deriv(){
    $('#modal_2').on('show.bs.modal', function (event) {
        var odersid = $(event.relatedTarget).data('odersid');
        var prodtitle = $(event.relatedTarget).data('prodtitle');
        var corpname = $(event.relatedTarget).data('corpname');
        var totcnt = $(event.relatedTarget).data('totcnt');
        $(this).find("#modal_2").text(odersid);
        $(this).find("#modal_2").text(prodtitle);
        $(this).find("#modal_2").text(corpname);
        $(this).find("#modal_2").text(totcnt);
        $(this).find("#modal_2").text(totcnt);
    });
}

// 부트스트랩 모달이 닫히면 안에 있는 값 리셋
$("#modal_1").on('hide.bs.modal', function(e){

    $("#derivregdate").val("");
    e.stopImmediatePropagation();
});

function registChkSubmit() {

    var frm = document.forms["deirvRegist"];
    var regdate = frm["derivregdate"].value.trim();

    if (regdate == "") {
        alert("입고일을 입력해주세요.")
        return false;
    }

    var registOk = confirm("검수요청 하시겠습니까?")

    if(!registOk){
        return false;
    }
        return true;
} // registChkSubmit() END


function confirmSubmit() {

    var frm = document.forms["deirvConfirm"];
    var confirmDate = frm["derivOkConfirmDate"].value.trim();

    if (confirmDate == "") {
        alert("입고확정일을 입력해주세요.")
        return false;
    }

    var confirmOk = confirm("입고확정 하시겠습니까?")

    if(!confirmOk){
        return false;
    }
    return true;
} // registChkSubmit() END


