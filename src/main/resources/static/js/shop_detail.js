/**
 * shop_detail
 */
 
 $(function() {
 	$('#likes').on('click',function() {
 		
 		// src 값을 가져와서 찜버튼이 눌렸는지 안눌렸는지 확인함 
		if($('#likes').attr("src") == "/image/yes_like.png") {
	 		$('#likes').attr("src", "/image/no_like.png");
		} else {
	 		$('#likes').attr("src", "/image/yes_like.png");
		} 		
 		
 	})
 }); // 마지막