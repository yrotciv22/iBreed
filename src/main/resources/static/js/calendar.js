document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            start: 'prevYear,prev,next,nextYear today',
            center: 'title',
            end: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        titleFormat: function(date) {
            return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
        },
        selectable: true,
        droppable: true,
        editable: true,
        events: function(fetchInfo, successCallback, failureCallback) {
            fetch('/api/events')
                .then(response => response.json())
                .then(data => {
                    successCallback(data.map(event => ({
                        title: event.CALENDAR_TITLE,
                        start: event.CALENDAR_START,
                        end: event.CALENDAR_END,
                        color: event.color
                    })));
                })
                .catch(error => {
                    failureCallback(error);
                });
        },
        eventClick: function(info) {
            // 클릭된 이벤트 처리
        },
        nowIndicator: true,
        navLinks: true,
        fixedWeekCount: false,
        eventLimit: false,
        dayMaxEvents: true,
        select: function(arg) {
            var title = prompt('일정을 입력하세요');
            if (title) {
                calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                    backgroundColor: "red",
                    textColor: "white"
                });

                fetch('/api/events', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        CALENDAR_TITLE: title,
                        CALENDAR_START: arg.start.toISOString(),
                        CALENDAR_END: arg.end.toISOString(),
                        color: "skyblue"
                    })
                });
            }
            calendar.unselect();
        },
        locale: 'ko',
        height: '100%'
    });
    calendar.render();
});
