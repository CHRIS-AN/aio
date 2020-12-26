document.addEventListener('DOMContentLoaded', function () {

    $(function() {
        let csrfToken = $("meta[name='_csrf']").attr("content");
        let csrfHeader = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        });
    });

    getCalendarDataInDB();


    // $.each(arr, function (index, item) {
    //     console.log(item)
    //     calendar.addEvent(item);
    // })




});

function setCal(event) {
    $("#calendar").fullCalendar({
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay,listMonth'
        },
        selectable: true,
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function (info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
                // if so, remove the element from the "Draggable Events" list
                info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
        },
        events: event
    });
}

function getCalendarDataInDB() {
    var arr = {};

    $.ajax({
        contentType: 'application/json',
        dataType: 'json',
        url: '/mypage/mycalendar',
        method: 'post',
        success: function (resp) {
            //alert(resp.f.id + ' ggg');
            console.log(resp)
            setCal(resp);

        },
        error: function (error) {
           console.log("error" + error)
        }
    });

    return arr;
}

