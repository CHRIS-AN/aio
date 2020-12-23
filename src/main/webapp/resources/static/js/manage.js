
$(document).ready(function (){
    $("#resigBtn").click(function () {
        $("#resigDialog").show();
    });
    $("#close").click(function () {
        $("#resigDialog").hide();
    });
    $("#close1").click(function () {
        $("#detailDialog").hide()
    })
    $("#close2").click(function () {
        $("#updateDialog").hide()
    })
    $("#close3").click(function () {
        $("#resetpwDialog").hide()
    })
    $("#btnclose").click(function () {
        $("#updateDialog").hide()
    })

    $(function() {
        let csrfToken = $("meta[name='_csrf']").attr("content");
        let csrfHeader = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        });
    });
    $.ajax({
        dataType: "json",
        method: "GET",
        beforeSend:function (){
            console.log("호출전");
        },
        url: '/hr/read',
        success: function (data, status){
            if(status === "success") {
                console.log(data)
                listHumanResource(data);
            }
        },
        error: function (request, error){
            console.log("요청실패")
            console.log("message:" + error)
        }
    });



});
function showEmpldetailAjax(emplId) {
    console.log(emplId)
    $.ajax({
        dataType: "json",
        method: "POST",
        beforeSend:function (){
            console.log("호출전");
        },
        url: '/hr/read/' + emplId,
        success: function (data, status){
            if(status === "success") {
                console.log(data)
                showEmpldetail(data);
            }
        },
        error: function (request, error){
            console.log("요청실패")
            console.log("message:" + error)
        }
    });
}

function updateloadAjax(emplId) {
    console.log(emplId)
    $.ajax({
        dataType: "json",
        method: "POST",
        beforeSend:function (){
            console.log("호출전");
        },
        url: '/hr/read/' + emplId,
        success: function (data, status){
            if(status === "success") {
                console.log(data)
                clickupdate(data);
            }
        },
        error: function (request, error){
            console.log("요청실패")
            console.log("message:" + error)
        }
    });
}

function listHumanResource(data) {
    let html = "<table id='datatable' class='table table-striped table-bordered dataTable'>";
        html += "<thead><tr><th>사원번호</th> <th>이름</th> <th>부서명</th><th>입사일자</th>\<th>연락처</th></tr></thead>";
    for (let i = 0; i < data.length; i++) {
        html += "<tr>";
        html += "<td><a class='btn-link' onclick=\"showEmpldetailAjax('" + data[i].emplId + "')\">" + data[i].emplId + "</a></td>";
        html += "<td>" + data[i].name + "</td>";
        html += "<td>" + data[i].dept + "</td>";
        html += "<td>" + data[i].emplRegdate + "</td>";
        html += "<td>" + data[i].phone + "</td>";
        html += "</tr>";
    }
        html += "</table>";

    $("#hrm").html(html);
}

function showEmpldetail(data) {
    let detailContent = $("#detailContent");
    let html = "";
        html += "<div class='row profile_details'>";
        // html += "<img src='" + data[0].photo + "' alt=''>";
        html += "</div>";
        html += "<div class='row'>";
        html += "<div class=\"col-md-6 com-sm-6\">";
        html += "<label class='col-md-4'>사원번호</label>";
        html += "<span class='col-md-8'>" + data[0].emplId + "</span>";
        html += "</div>";
        html += "<div class=\"col-md-6 com-sm-6\">";
        html += "<label class='col-md-4'>성명</label>";
        html += "<span class='col-md-8'>" + data[0].name + "</span>";
        html += "</div>";
        html += "</div>";

    html += "<div class='row'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>주민등록 번호</label>";
    html += "<span class='col-md-8'>" + data[0].jumin + "</span>";
    html += "</div>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>입사일자</label>";
    html += "<span class='col-md-8'>" + data[0].emplRegdate + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class='row'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>부서명</label>";
    html += "<span class='col-md-8'>" + data[0].dept + "</span>";
    html += "</div>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>퇴사일자</label>";
    html += "<span class='col-md-8'>" + data[0].emplResigdate + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class='row'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>연락처</label>";
    html += "<span class='col-md-8'>" + data[0].phone + "</span>";
    html += "</div>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>사원번호</label>";
    html += "<span class='col-md-8'>" + data[0].email + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class='row'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>재직상태</label>";
    html += "<span class='col-md-8'>" + data[0].work_state + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class=\"col-md-5 com-sm-5\">";
    html += "<label class='col-md-12'>주소</label>";
    html += "<span class='col-md-9'>" + data[0].post_num + "</span>";
    html += "</div>"
    html += "<div class=\"col-md-12 com-sm-12\">";
    html += "<span class='col-md-9'>" + data[0].address + "</span>";
    html += "</div>";
    html += "<div class='col-md-12 text-right'>";
    html += "<button id='btnclose' type='button'>닫기</button>"
    html += "<button id='btnupdate' onclick='updateloadAjax(\"" + data[0].emplId + "\")' type='button'>수정</button>"
    html += "</div>"

    detailContent.html(html);
    $("#detailDialog").show();

}

// function clickupdate(data) {
//     console.log(data);
//     let select1 = data[0].dept === "인사" ? "selected" : "";
//     let select2 = data[0].dept === "제품" ? "selected" : "";
//     let select3 = data[0].dept === "영업" ? "selected" : "";
//     let select4 = data[0].dept === "물류" ? "selected" : "";
//     let select5 = data[0].dept === "회계" ? "selected" : "";
//
//     let html = "<form class=\"form\" enctype='multipart/form-data' method='post' id='forms' >\n" +
//         "                                <div class=\"row\">\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>사원번호</label>\n" +
//         "                                        <input type=\"text\" name=\"emplId\" value=\"" + data[0].emplId + "\" class=\"form-control\" id=\"empl-id\" placeholder=\"사원번호\" disabled/>\n" +
//         "                                    </div>\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>성명</label>\n" +
//         "                                        <input type=\"text\" name=\"name\" value=\"" + data[0].name + "\" class=\"form-control\" id=\"name\" placeholder=\"사원이름\">\n" +
//         "                                    </div>\n" +
//         "                                </div>\n" +
//         "                                <div class=\"row\">\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>주민등록 번호</label>\n" +
//         "                                        <input type=\"text\" name=\"jumin\" value=\"" + data[0].jumin + "\" class=\"form-control\" id=\"jumin\" placeholder=\"900000-1111111\">\n" +
//         "                                    </div>\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>입사일자</label>\n" +
//         "                                        <input class=\"date-picker form-control\"  name=\"emplRegdate\" value=\"" + data[0].emplRegdate + "\" placeholder=\"yyyy-mm-dd\" type=\"date\" required=\"required\"\n" +
//         "                                               onfocus=\"this.type='date'\" onmouseover=\"this.type='date'\" onclick=\"this.type='date'\" onblur=\"this.type='text'\"\n" +
//         "                                               onmouseout=\"timeFunctionLong(this)\" disabled>\n" +
//         "                                    </div>\n" +
//         "                                </div>\n" +
//         "                                <div class=\"row\">\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>부서명</label>\n" +
//         "                                        <select name=\"dept\"  class=\"form-control\">\n" +
//         "                                            <option value=\"인사\" " + select1 + ">인사</option>\n" +
//         "                                            <option value=\"제품\" " + select2 + ">제품</option>\n" +
//         "                                            <option value=\"영업\" " + select3 + ">영업</option>\n" +
//         "                                            <option value=\"물류\" " + select4 + ">물류</option>\n" +
//         "                                            <option value=\"회계\" " + select5 + ">회계</option>\n" +
//         "                                        </select>\n" +
//         "                                    </div>\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>퇴사일자</label>\n" +
//         "                                        <input class=\"date-picker form-control\" value='" + data[0].emplResigdate + "' name=\"emplResigdate\" placeholder=\"yyyy-mm-dd\" type=\"date\" required=\"required\"\n" +
//         "                                               onfocus=\"this.type='date'\" onmouseover=\"this.type='date'\" onclick=\"this.type='date'\" onblur=\"this.type='text'\"\n" +
//         "                                               onmouseout=\"timeFunctionLong(this)\">\n" +
//         "                                    </div>\n" +
//         "                                </div>\n" +
//         "                                <div class=\"row\">\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>연락처</label>\n" +
//         "                                        <input type=\"text\" name=\"phone\" value='" + data[0].phone + "' class=\"form-control\" id=\"phone\" placeholder=\"핸드폰 번호\">\n" +
//         "                                    </div>\n" +
//         "                                    <div class=\"form-group has-feedback col-md-6 com-sm-6\">\n" +
//         "                                        <label>Email</label>\n" +
//         "                                        <input type=\"text\" name=\"email\" value=\"" + data[0].email + "\" class=\"form-control\" id=\"email\" placeholder=\"Email\">\n" +
//         "                                    </div>\n" +
//         "                                </div>\n" +
//         "                                <div class=\"form-group has-feedback col-md-12 com-sm-12\">\n" +
//         "                                    <label class=\"col-md-12\">주소</label>\n" +
//         "                                    <div class=\"col-md-5 col-sm-5\">\n" +
//         "                                        <input type=\"text\" name=\"post_num\" value=\"" + data[0].post_num + "\" class=\"form-control\" id=\"postnum\" placeholder=\"우편번호\">\n" +
//         "                                    </div>\n" +
//         "                                    <button id=\"postnumBtn\" class=\"btn btn-default\">검색</button>\n" +
//         "                                </div>\n" +
//         "                                <div class=\"form-group has-feedback col-md-12 com-sm-12\">\n" +
//         "                                    <div class=\"col-md-12\">\n" +
//         "                                        <input type=\"text\" name=\"address\" value=\"" + data[0].address + "\" class=\"form-control\" id=\"address\" placeholder=\"주소\">\n" +
//         "                                    </div>\n" +
//         "                                </div>\n" +
//         "                                <div class=\"form-group has-feedback col-md-12 com-sm-12\">\n" +
//         "                                    <label class=\"col-md-12\">사진</label>\n" +
//         "                                    <div class=\"col-md-12\">\n" +
//         "                                        <input type=\"file\" name=\"photo\" class=\"form-control\" id=\"photo\">\n" +
//         "                                    </div>\n" +
//         "                                </div>" +
//         "                                <div class=\"form-group text-right has-feedback col-md-12 com-sm-12\">\n" +
//         "                                    <button type=\"button\" onclick='showresetpwModal(\"" + data[0].emplId + "\")' id=\"resetBtn\" class=\"btn btn-default\">비빌번호 초기화</button>\n" +
//         "                                </div>\n" +
//         "                                <div class=\"form-group text-right has-feedback col-md-12 com-sm-12\">\n" +
//         "                                    <button type=\"button\" onclick='updateAjax()' id=\"updateEmplBtn\" class=\"btn btn-default\">등록</button>\n" +
//         "                                </div>\n" +
//         "                            </form>";
//     $("#updateContent").html(html);
//     $("#detailDialog").hide();
//     $("#updateDialog").show();
// }
function updateAjax () {
    let data = $("#forms")[0];
    var formData = new FormData(data);

    $.ajax({
        dataType: "json",
        method: "POST",
        processData: false,
        contentType: false,
        cache: false,
        data: formData,
        beforeSend:function (){
            console.log("호출전");
        },
        url: '/hr/update',
        success: function (data, status){
            if(status === "success") {
                console.log(data)
                if(data.state === "fail") {
                    updateAjaxError(data.data, data.errors);
                } else {
                    $("#updateDialog").hide();
                    listHumanResource(data.data);
                    alert("수정 완료 되었습니다.");
                }
            }
        },
        error: function (request, error){
            console.log("요청실패")
            console.log("message:" + error)
        }
    });
}

function updateAjaxError(data, errors) {

    let select1 = data.dept === "인사" ? "selected" : "";
    let select2 = data.dept === "제품" ? "selected" : "";
    let select3 = data.dept === "영업" ? "selected" : "";
    let select4 = data.dept === "물류" ? "selected" : "";
    let select5 = data.dept === "회계" ? "selected" : "";

    let html = "<form id='forms' enctype='multipart/form-data' method='post' class=\"form\">";
    html += "<div class=\"row\">";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>사원번호</label>";
    html += "<input type=\"text\" name='emplId' value=\"" + data[0].emplId + "\" class=\"form-control\" id=\"empl-id\" placeholder=\"사원번호\"/ disabled>";
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>성명</label>";
    html += "<input type=\"text\" name=\"name\" value=\"" + data[0].name + "\" class=\"form-control\" min=\"2\" max=\"8\" id=\"name\" placeholder=\"사원이름\" required>"
    if(errors.valid_name != undefined) {
        html += "<sapn>" + errors.valid_name + "</span>";
    }
    html += "</div>";
    html += "</div>";
    html += "<div class=\"row\">";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>주민등록 번호</label>";
    html += "<input type=\"text\" name=\"jumin\" value=\"" + data[0].jumin + "\" class=\"form-control\" min=\"12\" max=\"12\" id=\"jumin\" placeholder=\"900000-1111111\" required>";
    if(errors.valid_jumin != undefined) {
        html += "<sapn>" + errors.valid_jumin + "</span>";
    }
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>입사일자</label>";
    html += "<input class=\"date-picker form-control\"  name=\"emplRegdate\" value=\"" + data[0].emplRegdate + "\" placeholder=\"yyyy-mm-dd\" type=\"date\" required=\"required\"\n" +
            "onfocus=\"this.type='date'\" onmouseover=\"this.type='date'\" onclick=\"this.type='date'\" onblur=\"this.type='text'\"\n" +
            "onmouseout=\"timeFunctionLong(this)\" disabled>";
    html += "</div>";
    html += "</div>";
    html += "<div class=\"row\">";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>부서명</label>";
    html += "<select name=\"dept\" class=\"form-control\">";
    html += "<option value=\"인사\"" + select1 + ">인사</option>";
    html += "<option value=\"제품\"" + select2 + ">제품</option>";
    html += "<option value=\"영업\"" + select3 + ">영업</option>";
    html += "<option value=\"물류\"" + select4 + ">물류</option>";
    html += "<option value=\"회계\"" + select5 + ">회계</option>";
    html += "</select>";
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>퇴사일자</label>";
    html += "<input class=\"date-picker form-control\" value='" + data[0].emplResigdate + "' name=\"emplResigdate\" placeholder=\"yyyy-mm-dd\" type=\"date\" required=\"required\"" +
            "onfocus=\"this.type='date'\" onmouseover=\"this.type='date'\" onclick=\"this.type='date'\" onblur=\"this.type='text'\"" +
            "onmouseout=\"timeFunctionLong(this)\">";
    html += "</div>";
    html += "</div>";
    html += "<div class=\"row\">";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>연락처</label>";
    html += "<input type=\"text\" name=\"phone\" value='" + data[0].phone + "' class=\"form-control\" min=\"10\" max=\"11\" id=\"phone\" placeholder=\"핸드폰 번호\" required>";
    if(errors.valid_phone != undefined) {
        html += "<sapn>" + errors.valid_phone + "</span>";
    }
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>Email</label>";
    html += "<input type=\"text\" name=\"email\" value=\"" + data[0].email + "\" class=\"form-control\" id=\"email\" placeholder=\"Email\" required>;"
    if(errors.valid_email != undefined) {
        html += "<sapn>" + errors.valid_email + "</span>";
    }
    html += "</div>";
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-12 com-sm-12\">";
    html += "<label class=\"col-md-12\">주소</label>";
    html += "<div class=\"col-md-5 col-sm-5\">";
    html += "<input type=\"text\" name=\"post_num\" value=\"" + data[0].post_num + "\" min=\"5\" max=\"5\"  class=\"form-control\" id=\"postnum\" placeholder=\"우편번호\" required>";
    html += "</div>";
    html += "<button id=\"postnumBtn\" class=\"btn btn-default\">검색</button>";
    if(errors.valid_post_num != undefined) {
        html += "<sapn>" + errors.valid_post_num + "</span>";
    }
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-12 com-sm-12\">";
    html += "<div class=\"col-md-12\">";
    html += "<input type=\"text\" name=\"address\" value=\"" + data[0].address + "\" class=\"form-control\" id=\"address\" placeholder=\"주소\" required>";
    if(errors.valid_address != undefined) {
        html += "<sapn>" + errors.valid_address + "</span>";
    }
    html += "</div>";
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-12 com-sm-12\">";
    html += "<label class=\"col-md-12\">사진</label>";
    html += "<div class=\"col-md-12\">";
    html += "<input type=\"file\" name=\"photo\" class=\"form-control\" id=\"photo\">";
    html += "</div>";
    html += "</div>";
    html += "<div class=\"form-group text-right has-feedback col-md-12 com-sm-12\">";
    html += "<button type=\"button\" onclick='showresetpwModal(\"" + data[0].emplId + "\")' id=\"resetBtn\" class=\"btn btn-default\">비빌번호 초기화</button>"
    html += "</div>";
    html += "<div class=\"form-group text-right has-feedback col-md-12 com-sm-12\">";
    html += "<button type=\"button\" onclick='updateAjax()' id=\"updateEmplBtn\" class=\"btn btn-default\">등록</button>";
    html += "</div>";
    html += "</form>";

    $("#updateContent").html(html);
    $("#detailDialog").hide();
    $("#updateDialog").show();
}

function showresetpwModal(emplId, errors) {


    let $resetpwContent = $("#resetpwContent");
    let id = emplId;
    let html = "<div>"
    html += "<div class='row'>";
    html += "<div class='col-md-4'>";
    html += "<small>비밀번호</small>"
    html += "</div>";
    html += "<div class='col-md-8'>";
    html += "<form id='resetform'>";
    html += "<input id='resetpwinput' type='password' class='col-md-8' name='password'/>";
    html += "<button type='button' class='btn btn-default col-md-4' onclick='showreset(\"" + id + "\")'>확인</button>"
    html += "</form>";
    html += "</div>"
    html += "</div>"
    html += "</div>"


    $("#resetpwDialog").show();
    $resetpwContent.html(html);

}

function showreset(emplId, event) {
    let val = $("#resetpwinput").val();

    $.ajax({
        dataType: "json",
        method: "POST",
        cache: false,
        data: {"password" : val,
                "emplId" : emplId},
        beforeSend:function (){
            console.log("호출전");
        },
        url: '/hr/update/reset',
        success: function (data, status){
            if(status === "success") {
                if(data.state === "fail") {
                    alert("비밀번호가 일치하지 않습니다.");
                } else {
                    $("#resetpwDialog").hide();
                    alert("비밀번호가 초기화 되었습니다.");
                }
            }
        },
        error: function (request, error){
            console.log("요청실패")
            console.log("message:" + error)
        }
    })
}