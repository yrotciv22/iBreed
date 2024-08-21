/**
 * 
 */

 
 $(document).ready(function(){
 	console.log("friend js");
 			
        
	// 친구 버튼 클릭시 
	document.querySelectorAll('.trigger').forEach(function(trigger) {
    
    	trigger.addEventListener('click', function(event) {
          let popover = this.parentNode.querySelector('.click_see_more');

        	if (popover) {
	            // trigger의 위치 정보를 가져옴
	            let rect = this.getBoundingClientRect();
	
	            // popover의 위치를 설정
	            popover.style.top = (rect.bottom + 10) + 'px';
	            popover.style.left = (rect.right - 60) + 'px';
	
	            // popover를 표시 (display 속성 설정 등)
	            popover.style.display = 'block';
            
                document.addEventListener('click', function hidePopover(event) {
	                if (!popover.contains(event.target) && !trigger.contains(event.target)) {
	                    popover.style.display = 'none';
	                    document.removeEventListener('click', hidePopover);
	                }
            	});
            
        	} else {
            	console.error('Popover element not found.');
        	}
    	});
     }); // 친구 버튼 클릭 끝 
     
     
     

   // document.querySelectorAll('.delete_friend').forEach(function(element) {
   //   element.addEventListener('click', function() {
      
    //    const friend_id = this.getAttribute('data-userid');
		//	console.log("friend_id= ",friend_id);
		//	console.log("userId= ",userId);
	
      //  if (confirm('정말 친구를 끊으시겠습니까?')) {
       //   fetch('/mydiary/{user_id}/deleteFriend{friend_id}', {
     //       method: 'POST',
      //    .then(response => response.json())
        //  .then(
      //      if (success) {
       //       alert('친구가 성공적으로 삭제되었습니다.');
         //     location.reload();
        //    } else {
        //      alert('친구 삭제에 실패했습니다.');
        //  })
       //   .catch(error => console.error('Error:', error));
      //  }
    //  });
  //  });

     
            
 });