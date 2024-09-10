/**
 * albumSearch.js
 */
 
 $(document).ready(function() {
 	$('#arrangeAlbumForm').on('change', function() {
 		event.preventDefault();
 		
 		let formData = $(this).serialize();
 		
 		$.ajax({
 			type:"post",
 			url:"/mydiary/arrangeAlbum",
 			data : formData, 
 			success:function(result) { // 컨트롤러에서 반환한 prdList를 result가 받음
 				$('#albumResultBox').empty();
 				$('#albumResultBox').html(result);
 			},
 			error:function() {
 				alert("실패");
 			}
 		});
 	
 	}); // submit 끝
 
 });