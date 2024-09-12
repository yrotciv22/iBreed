document.addEventListener('DOMContentLoaded', function() {
	  let calendar_no = document.querySelectorAll(".calendar_no");
	  let calendar_title = document.querySelectorAll(".calendar_title");
	  let calendar_start = document.querySelectorAll(".calendar_start");
	  let calendar_end = document.querySelectorAll(".calendar_end");	  	  
	  let calendar_memo = document.querySelectorAll(".calendar_memo");	  	  
	  
	  // JSON 데이터 생성해서 배열에 추가
	  let jsonArray = new Array();
		for(let i=0; i<calendar_no.length; i++){
		  let jsonObj = new Object();
		  jsonObj.id = calendar_no[i].value;
		  jsonObj.title = calendar_title[i].value;
		  jsonObj.start = calendar_start[i].value;
		  jsonObj.end = calendar_end[i].value;
		  jsonArray.push(jsonObj);
		}			  
	  
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
		selectable : true,
		droppable : true,
		eventResize: function(info) {
			//일정 크기를 변경했을떄 이벤트
			},
		
		editable : true, // 일정 클릭 + 클릭해서 끌고오기 설정
		nowIndicator: true, // 현재 시간 마크
		navLinks: true, // 달력 날짜 클릭시 일 달력으로 넘어감
		fixedWeekCount: false, // 막아놓을시 해당하는달만 보임
		eventLimit: false,
		dayMaxEvents: true,
        events:  jsonArray,
        /*events: [
          { id: '1', title: 'Event 1', start: '2024-08-01' },
          { id: '2', title: 'Event 2', start: '2024-08-02' }
        ]*/
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
        eventClick:function(param) {     
         	alert(param.event.memo + "\n" + param.event.title);   
         	return false;                
         }          
      });

      calendar.render();
/*
      document.getElementById('addEvent').addEventListener('click', function() {
        calendar.addEvent({
          id: '3',
          title: 'New Event',
          start: '2024-08-03'
        });
      });

      document.getElementById('removeEvent').addEventListener('click', function() {
        var event = calendar.getEventById('1');
        if (event) {
          event.remove();
        }
      });
      */
    });