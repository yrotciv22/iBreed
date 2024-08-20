/**
 * 
 */
 
 
 
 $(document).ready(function(){
 	console.log("friend js");
 	
	// 친구 
	
	 document.querySelector('.trigger').addEventListener('click', function(event) {
	 console.log("trigger");
        var popover = document.getElementById('popover');
        var trigger = event.currentTarget;
        
        // 팝오버의 위치를 트리거 요소에 맞추어 설정
        var rect = trigger.getBoundingClientRect();
        popover.style.top = rect.bottom + 'px';
        popover.style.left = rect.left + 'px';

        // 팝오버를 보이거나 숨기는 토글
        popover.style.display = popover.style.display === 'block' ? 'none' : 'block';
    });

    // 팝오버 외부를 클릭했을 때 팝오버를 숨김
    document.addEventListener('click', function(event) {
        var popover = document.getElementById('popover');
        var trigger = document.querySelector('.trigger');
        if (!popover.contains(event.target) && !trigger.contains(event.target)) {
            popover.style.display = 'none';
        }
    });
 });