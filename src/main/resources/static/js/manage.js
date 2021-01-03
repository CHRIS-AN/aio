var page = 0;

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

    search()

    $("#image-input-file").change(function (e) {
        if (e.target.files.length === 1) {
            const reader = new FileReader();
            reader.onload = e => {
                if (e.target.result) {
                    console.log(e.target.result);
                    if (!e.target.result.startsWith("data:image")) {
                        alert("이미지 파일을 선택하세요.");
                        return;
                    }

                    $("#photo").attr("value", e.target.result);
                    $("#profile-image").attr("src", e.target.result);
                }
            };

            reader.readAsDataURL(e.target.files[0]);
        }
    });

    $("#image-input-file2").change(function (e) {
        if (e.target.files.length === 1) {
            const reader = new FileReader();
            reader.onload = e => {
                if (e.target.result) {
                    console.log(e.target.result);
                    if (!e.target.result.startsWith("data:image")) {
                        alert("이미지 파일을 선택하세요.");
                        return;
                    }

                    $("#photo2").attr("value", e.target.result);
                    $("#profile-image2").attr("src", e.target.result);
                }
            };

            reader.readAsDataURL(e.target.files[0]);
        }
    });


    $("#cnt").change(function (){
       search();
    });

    $("#dept").change(function (){
        search();
    });

    $("#searchBtn").click(function (){
        search();
    });

});

function clearImg() {
    $("#photo").val("")
    $("#profile-image").attr("src", "");
    $("#image-input-file").val("");
}

function clearImg2() {
    $("#photo2").val("")
    $("#profile-image2").attr("src", "");
    $("#image-input-file2").val("");
}

function changePage(pageNum) {
    page = pageNum;
    search();
}

function search() {

    let cntVal = $("#cnt").val();
    let deptVal = $("#dept").val();
    let keywordVal = $("#keyword").val();

    let url = "";
    console.log(keywordVal)
    if(keywordVal === "") {
        url = "/hr/read/" + deptVal + "?size=" + cntVal + "&page=" + page;
    } else {
        url = "/hr/read/" + deptVal + "/" + keywordVal + "?size=" + cntVal + "&page=" + page;
    }
    console.log("url" + url)

    $.ajax({
        dataType: "json",
        method: "GET",
        beforeSend:function (){
            console.log("호출전");
        },
        url: url,
        success: function (data, status){
            console.log(data);
            if(status === "success") {
                listHumanResource(data.data);
            }
        },
        error: function (request, error){
            console.log("요청실패")
            console.log("message:" + error)
        }
    })
}


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
    let first = 0;
    let curPage = data.pageable.pageNumber;

    if(curPage < 0) curPage = 0;
    if(curPage > data.totalPages) curPage = data.totalPages;

    let nextPage = curPage + 1;
    let previousPage = curPage - 1;
    if(nextPage >= data.totalPages) nextPage = data.totalPages-1;
    if(previousPage < 0) previousPage = 0;


    if(data.number - data.pageable.pageSize < 0) {
        first = 0
    } else {
        first = data.pageable.pageNumber - data.number;
    }

    let html = "<table id='datatable' class='table table-striped table-bordered dataTable'>";
        html += "<thead><tr><th>사원번호</th> <th>이름</th> <th>부서명</th><th>입사일자</th>\<th>연락처</th></tr></thead>";
    for (let i = 0; i < data.content.length; i++) {
        html += "<tr>";
        html += "<td><a class='btn-link' style='cursor: pointer;' onclick=\"showEmpldetailAjax('" + data.content[i].emplId + "')\">" + data.content[i].emplId + "</a></td>";
        html += "<td>" + data.content[i].name + "</td>";
        html += "<td>" + data.content[i].dept + "</td>";
        html += "<td>" + data.content[i].emplRegdate + "</td>";
        html += "<td>" + data.content[i].phone + "</td>";
        html += "</tr>";
    }
        html += "</table>";
        html += "<div>";
        html += "<a class='btn btn-default' onclick='changePage(" + 0 + ")'>&lt;&lt;</a>";
        html += "<a class='btn btn-default' onclick='changePage(" + previousPage + ")'>Previous</a>";
        for(let i = first; i < data.totalPages; i++) {
            html += "<a onclick='changePage(" + i + ")' class='btn btn-default text-center linkpage'>"
            html += i+1 + ""
            html += "</a>"
        }
        html += "<a class='btn btn-default' onclick='changePage(" + nextPage + ")'>Next</a>";
        html += "<a class='btn btn-default' onclick='changePage(" + (data.totalPages - 1) + ")'>&gt;&gt;</a>";
        html += "</div>";

    $("#hrm").html(html);
}

function showEmpldetail(data) {
    let detailContent = $("#detailContent");
    let html = "";
        html += "<div class='col-md-3'>";
        html += "<div class='col-lg-12'>"
        html += "<img src='" + data[0].photo + "' alt='' class='img-responsive'/>";
        html += "</div>";
        html += "</div>"
        html += "<div class='col-md-9'>";
        html += "<div class='row m-div'>";
        html += "<div class=\"col-md-6 com-sm-6\">";
        html += "<label class='col-md-5'>사원번호</label>";
        html += "<span class='col-md-7'>" + data[0].emplId + "</span>";
        html += "</div>";
        html += "<div class=\"col-md-6 com-sm-6\">";
        html += "<label class='col-md-4'>성명</label>";
        html += "<span class='col-md-8'>" + data[0].name + "</span>";
        html += "</div>";
        html += "</div>";

    html += "<div class='row m-div'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-5'>주민등록 번호</label>";
    html += "<span class='col-md-7'>" + data[0].jumin + "</span>";
    html += "</div>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>입사일자</label>";
    html += "<span class='col-md-8'>" + data[0].emplRegdate + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class='row m-div'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-5'>부서명</label>";
    html += "<span class='col-md-7'>" + data[0].dept + "</span>";
    html += "</div>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>퇴사일자</label>";
    html += "<span class='col-md-8'>" + data[0].emplResigdate + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class='row m-div'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-5'>연락처</label>";
    html += "<span class='col-md-7'>" + data[0].phone + "</span>";
    html += "</div>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-4'>사원번호</label>";
    html += "<span class='col-md-8'>" + data[0].email + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class='row m-div'>";
    html += "<div class=\"col-md-6 com-sm-6\">";
    html += "<label class='col-md-5'>재직상태</label>";
    html += "<span class='col-md-7'>" + data[0].work_state + "</span>";
    html += "</div>";
    html += "</div>";

    html += "<div class='row m-div'>";
    html += "<div class=\"col-md-12 com-sm-5\">";
    html += "<label class='col-md-5'>주소</label>";
    html += "<span class='col-md-9'>(우편번호) " + data[0].post_num + "</span>";
    html += "</div>"
    html += "<div class=\"col-md-12 com-sm-12\">";
    html += "<label class='col-md-5'></label>";
    html += "<span class='col-md-9'>" + data[0].address + "</span>";
    html += "</div>";
    html += "<div class='col-md-12 text-right'>";
    html += "<button id='btnupdate' class='btn btn-default' onclick='updateloadAjax(\"" + data[0].emplId + "\")' type='button'>수정</button>"
    html += "</div>"
    html += "</div>"
    html += "</div>";
    detailContent.html(html);
    $("#detailDialog").css("display","block")

}

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
                    clickupdate(data.data, data.errors);
                } else {
                    $("#updateDialog").hide();
                    alert("수정 완료 되었습니다.");
                    search();
                }
            }
        },
        error: function (request, error){
            console.log("요청실패")
            console.log("message:" + error)
        }
    });
}

function clickupdate(data, errors) {
    let html = "";
    let select1 = data.dept === "인사" ? "selected" : "";
    let select2 = data.dept === "제품" ? "selected" : "";
    let select3 = data.dept === "영업" ? "selected" : "";
    let select4 = data.dept === "물류" ? "selected" : "";
    let select5 = data.dept === "회계" ? "selected" : "";

    $("#photo2").val(data[0].photo);
    $("#profile-image2").attr("src", data[0].photo);

    if(errors != undefined && errors.valid_photo != undefined) {
        $("#photo_validate").html(errors.valid_photo);
    }
    html += "<div class=\"row\">";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>사원번호</label>";
    html += "<input type=\"text\" name='emplId' value=\"" + data[0].emplId + "\" class=\"form-control\" id=\"empl-id\" placeholder=\"사원번호\"/>";
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>성명</label>";
    html += "<input type=\"text\" name=\"name\" value=\"" + data[0].name + "\" class=\"form-control\" min=\"2\" max=\"8\" id=\"name\" placeholder=\"사원이름\" required>"
    if(errors != undefined && errors.valid_name != undefined) {
        html += "<span>" + errors.valid_name + "</span>";
    }
    html += "</div>";
    html += "</div>";
    html += "<div class=\"row\">";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>주민등록 번호</label>";
    html += "<input type=\"text\" name=\"jumin\" value=\"" + data[0].jumin + "\" class=\"form-control\" min=\"12\" max=\"12\" id=\"jumin\" placeholder=\"900000-1111111\" required>";
    if(errors != undefined && errors.valid_jumin != undefined) {
        html += "<span>" + errors.valid_jumin + "</span>";
    }
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>입사일자</label>";
    html += "<input class=\"date-picker form-control\"  name=\"emplRegdate\" value=\"" + data[0].emplRegdate + "\" placeholder=\"yyyy-mm-dd\" type=\"date\" required=\"required\"\n" +
            "onfocus=\"this.type='date'\" onmouseover=\"this.type='date'\" onclick=\"this.type='date'\" onblur=\"this.type='text'\"\n" +
            "onmouseout=\"timeFunctionLong(this)\">";
    html += "</div>";
    html += "</div>";

    html += "<div class=\"row\">";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>부서명</label>";
    html += "<select name=\"dept\" class=\"form-control\">";
    html += "<option value=\"인사\" " + select1 + ">인사</option>";
    html += "<option value=\"제품\" " + select2 + ">제품</option>";
    html += "<option value=\"영업\" " + select3 + ">영업</option>";
    html += "<option value=\"물류\" " + select4 + ">물류</option>";
    html += "<option value=\"회계\" " + select5 + ">회계</option>";
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
    if(errors != undefined && errors.valid_phone != undefined) {
        html += "<span>" + errors.valid_phone + "</span>";
    }
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-6 com-sm-6\">";
    html += "<label>Email</label>";
    html += "<input type=\"text\" name=\"email\" value=\"" + data[0].email + "\" class=\"form-control\" id=\"email\" placeholder=\"Email\" required>"
    if(errors != undefined && errors.valid_email != undefined) {
        html += "<span>" + errors.valid_email + "</span>";
    }
    html += "</div>";
    html += "</div>";

    html += "<div class=\"form-group has-feedback col-md-12 com-sm-12\">";
    html += "<label class=\"col-md-12\">주소</label>";
    html += "<div class=\"col-md-5 col-sm-5\">";
    html += "<input type=\"text\" name=\"post_num\" value=\"" + data[0].post_num + "\" min=\"5\" max=\"5\"  class=\"form-control\" id=\"uptnum\" placeholder=\"우편번호\" required>";
    html += "</div>";
    html += "<button id=\"postnumBtn\" onclick='showjusoPopup(\"수정\")' class=\"btn btn-default\">검색</button>";
    if(errors != undefined && errors.valid_post_num != undefined) {
        html += "<span>" + errors.valid_post_num + "</span>";
    }
    html += "</div>";
    html += "<div class=\"form-group has-feedback col-md-12 com-sm-12\">";
    html += "<div class=\"col-md-12\">";
    html += "<input type=\"text\" name=\"address\" value=\"" + data[0].address + "\" class=\"form-control\" id=\"updateAddr\" placeholder=\"주소\" required>";
    if(errors != undefined && errors.valid_address != undefined) {
        html += "<span>" + errors.valid_address + "</span>";
    }

    $("#resetPwBtn").html("<button type=\"button\" onclick='showresetpwModal(" + data[0].emplId + ")' id=\"resetBtn\" class=\"btn btn-default\">비빌번호 초기화</button>")

    $("#upc-box").html(html);
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
    html += "</div>";
    html += "</div>";
    html += "</div>";


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