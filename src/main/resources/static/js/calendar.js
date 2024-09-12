document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prevYear,prev,next,nextYear today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true, // 삭제를 도와주는 친구?
		eventResize: function(info) {
			//일정 크기를 변경했을떄 이벤트
			},
		
		editable : true, // 일정 클릭 + 클릭해서 끌고오기 설정
		
		events: [
		],
		eventClick : function(info) { },
		
		nowIndicator: true, // 현재 시간 마크
		navLinks: true, // 달력 날짜 클릭시 일 달력으로 넘어감
		fixedWeekCount: false, // 막아놓을시 해당하는달만 보임
		eventLimit: false,
		dayMaxEvents: true, // 최대 이벤트 개수를 넘을시 more 처리해서 묶어줌
		
		select: function(arg) { // 날짜 클릭시 프롬프트창 띄워서 타이틀만 입력
    	// console.log(arg);
		
	    var title = prompt('일정을 입력하세요');
	    // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	        if (title) {console.log(arg);
	         	calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay,
	            backgroundColor:"skyblue",
	            textColor:"white"
	          })
	        }
	        calendar.unselect()
	      },
	      
		locale: 'ko', // 한국어 설정
		height: '100%'
	});
	calendar.render();
	
});