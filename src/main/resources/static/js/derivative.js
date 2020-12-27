loadList("derivWait");

// list load
function loadList(state) {

    var url;

    if (state == "derivWait") {
        url = "./derivWait";
    } else {
        url = "./" + state;
    }

    $.ajax({
        url: url,
        type: "GET",
        cache: false,
        success: function (data) {
            derivList(data, state);
        }
    })
}

function derivList(jsonObj, state) {

    var data = jsonObj;
    var target = "#" + state;
    var state_kor;

    var contentW = "";
    var column = [[""]];

    if (state == "derivWait") {
        state_kor = "입고대기"
        column = [["발주번호"], ["발주품목"], ["회사명"], ["총수량"]]
    } else if (state == "derivChk") {
        state_kor = "검수요청"
        column = [["입고번호"], ["입고일"], ["입고품목"], ["회사명"], ["총수량"]]
    } else if (state == "derivOk") {
        state_kor = "입고완료"
        column = [["입고번호"], ["입고확정일"], ["입고품목"], ["회사명"], ["총수량"], ["검수자"]]
    }

    contentW += "<table class='table table-bordered' id='dataTable' width='100%' cellpadding='0'>"

    contentW += "<thead><tr>"
    for (var i = 0; i < column.length; i++) {
        contentW += "<th>" + column[i] + "</th>"
    }
    contentW += "</tr></thead>"

    contentW += "<tfoot><tr>"
    for (var i = 0; i < column.length; i++) {
        contentW += "<th>" + column[i] + "</th>"
    }
    contentW += "</tr></tfoot>"

    contentW += "<tbody>"

    if (data == null) {
        contentW += "<tr><td class='font-weight-bold'>" +
            state_kor + "(중)인 목록이 없습니다.</td></tr>";

    } else if (data != null) {

        if (state == "derivWait") {
            for (var i = 0; i < data.length; i++) {
                contentW += "<tr id='tr" + data[i].testordersid + "' >"
                contentW += "<td>" + data[i].testordersid + "</td>"
                contentW += "<td id='tr_title" + i + "' onclick='regist_deriv()' data-toggle='modal' data-target='#modal_1'" +
                    " data-odersid='" + data[i].testordersid + "' data-prodtitle='" + data[i].testtitle +
                    "' data-corpname='" + data[i].crop + "' data-totcnt='" + data[i].testorderscnt + "'>"
                    + data[i].testtitle + "</td>"
                contentW += "<td>" + data[i].crop + "</td>"
                contentW += "<td>" + data[i].testorderscnt + "</td>"
                contentW += "</tr>";
            } // end for
        }
    } // if END
    contentW += "</tbody></table>"
    $(target).html(contentW);

} // derivList END

function regist_deriv(){
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

$("#registCancle").on("click", function (){
    $("#derivregdate").val("");
})

function registChkSubmit() {
    frm = document.forms["deirvRegist"];

    var regdate = frm["derivregdate"].value.trim();

    if (regdate == "") {
        alert("입고일을 입력해주세요.")
        return false;
    }
    return true;
} // registChkSubmit() END



