/**
 * albumCheck.js
 */
 
 // 앨범 추가할 때 중복 확인 & 앨범 추가
 
  $(document).ready(function() {
 	$('#album_Add').on('submit', function() {
 		event.preventDefault();
 		
 		let album_name = $('#update_text').val();
 		
 		if(album_name == "") {
 			alert("앨범명을 입력하세요");
 			return false;
 		} else {
		$.ajax({
	 			type:"post",
	 			url:"/album/addAlbum", 
	 			data : {"album_name": album_name},
	 			dataType:'text',
	 			success:function(result) {
	 				if(result == "not_available") {
	 					alert("사용할 수 없는 앨범명입니다");
	 				} else {
	 					location.href = "/mydiary/" + userId + "/photos";
	 				}
	 			},
	 			error:function() {
	 				console.log("실패");
	 			}
	 		});
 		
 		} // else 끝
 	
 	}); // click 끝
 
 });