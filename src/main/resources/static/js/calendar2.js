document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events: [
          { id: '1', title: 'Event 1', start: '2024-08-01' },
          { id: '2', title: 'Event 2', start: '2024-08-02' }
        ]
      });

      calendar.render();

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
    });