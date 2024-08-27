document.addEventListener('DOMContentLoaded', function() {
	  let calendar_no = document.querySelectorAll(".calendar_no");
	  let calendar_title = document.querySelectorAll(".calendar_title");
	  let calendar_start = document.querySelectorAll(".calendar_start");
	  let calendar_end = document.querySelectorAll(".calendar_end");	  	  
	  
	  // JSON 데이터 생성해서 배열에 추가
	  let jsonArray = new Array();
		for(let i=0; i<calendar_no.length; i++){
		  let jsonObj = new Object();
		  jsonObj.id = calendar_no[i].value;
		  jsonObj.title = calendar_title[i].value;
		  jsonObj.start = calendar_start[i].value;
		  jsonArray.push(jsonObj);
		}			  
	  
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events:  jsonArray,
        /*events: [
          { id: '1', title: 'Event 1', start: '2024-08-01' },
          { id: '2', title: 'Event 2', start: '2024-08-02' }
        ]*/
        eventClick:function(param) {     
         	alert(param.event.id + "\n" + param.event.title);   
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