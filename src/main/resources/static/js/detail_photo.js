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
	 		
    		let photo_id = $(this).data('photoid'); 
    		let photo_path = $(this).data('coverimg');
    		let album_id = $(this).data('albumid');
    		
			$.ajax({
	 			type:"post",
	 			url:"/mydiary/updateCoverImg",
	 			data : {
	 				"photo_id": photo_id,
	 				"photo_path": photo_path,
	 				"album_id": album_id
	 			},
	 			success:function(response) {
	 			
	 				if (response !== 'success') {
	                    alert("앨범 커버 변경에 실패했습니다.");
	                } 
	                
	 			},
	 			error:function() {
	 				console.log("실패");
	 			}
	 		});
	 		
 	}); // click 끝 
 	
 	// 삭제 모달
	$('.deleteBtn').on('click', function(event) {
	 		event.preventDefault();
	 		
    		let photo_id = $(this).data('photonum');
    		let album_id = $(this).data('albumid');
    		
			$.ajax({
	 			type:"post",
	 			url:"/mydiary/deletePhoto",
	 			data : {
	 				"photo_id": photo_id,
	 				"album_id": album_id
	 			},
	 			success:function(response) {
	 			
	 				if (response === 'success') {
			            location.reload();
		                alert("사진이 성공적으로 삭제되었습니다.");
		            } else {
		                alert("사진 삭제에 실패했습니다.");
		            }
	 			},
	 			error:function() {
	 				console.log("실패함");
	 			}
	 			
	 		});
	 		
 	}); // click 끝 
});