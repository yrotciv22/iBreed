/**
 * detail_photo.jsp
 */
 
 $(function() {
 
    // 삭제모달
	let detailBox = $('.detail_modal');
   
	$('.albumBox').each(function(i) {
		$(this).on('click', function() {
			detailBox[i].style.display = 'flex';
		});
	});
	
	$('.detailBtn').each(function(i) {
		$(this).on('click', function() {
			detailBox[i].style.display = 'flex';
		});
	});
	
	// 앨범 커버 바꾸기
	$('.setCoverBtn').on('click', function() {
	 		event.preventDefault();
	 		
	 		let photo_id = $(this).find('#photo_id').val(); // 현재 폼의 요소만 선택
    		let photo_name = $(this).find('#photo_name').val(); // 현재 폼의 요소만 선택
    
			$.ajax({
	 			type:"post",
	 			url:"/mydiary/updateCoverImg", 
	 			data : {
	 				"photo_id": photo_id,
	 				"photo_name": photo_name
	 			},
	 			success:function(response) {
	 				if (response === 'success') {
	                    alert("앨범 커버가 변경되었습니다.");
	                    location.reload(); // 페이지 새로고침
	                } else {
	                    alert("앨범 커버 변경에 실패했습니다.");
	                }
	 			},
	 			error:function() {
	 				console.log("실패");
	 			}
	 		});
	 		
 	}); // click 끝 
});