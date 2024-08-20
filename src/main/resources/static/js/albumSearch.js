/**
 * albumSearch.js
 */
 
 $(document).ready(function() {
 	//검색 폼이 전송(submit) 되었을 때
 	$('#albumSearchForm').on('submit', function() {
 		event.preventDefault();
 		
 		// 폼에 입력한 여러 개의 값을 쿼리스트링 방식의 데이터로 변환 : serialize() 사용
 		// type=prdName&keyword=노트북
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
 
 
 
 
 
 
 
 
 
 