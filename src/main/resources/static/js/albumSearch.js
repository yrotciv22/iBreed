/**
 * albumSearch.js
 */
 
 $(document).ready(function() {
 	$('#albumSearchForm').on('submit', function() {
 		event.preventDefault();
 		
 		let formData = $(this).serialize();
 		
 		let keyword = $('#albumTitle').val();
 		
 		if(keyword == ""){
 			alert("검색 조건과 검색어를 입력하세요");
 		} else {
 		
	 		$.ajax({
	 			type:"post",
	 			url:"/mydiary/albumSearch",
	 			data : formData, 
	 			success:function(result) { // 컨트롤러에서 반환한 prdList를 result가 받음
	 				$('#albumResultBox').empty();
	 				$('#albumResultBox').html(result);
	 			},
	 			error:function() {
	 				alert("실패");
	 			}
	 		});
 	
 		} // else 끝
 	}); // submit 끝
 
 });
 
 
 
 
 
 
 
 
 
 