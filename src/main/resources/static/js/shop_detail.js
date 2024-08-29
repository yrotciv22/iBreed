/**
 * shop_detail
 */
 
 $(function() {
 	
 	// 찜하기 버튼
 	$('#likes').on('click',function() {
 		
 		// src 값을 가져와서 찜버튼이 눌렸는지 안눌렸는지 확인함 
		if($('#likes').attr("src") == "/image/yes_like.png") {
	 		$('#likes').attr("src", "/image/no_like.png");
		} else {
	 		$('#likes').attr("src", "/image/yes_like.png");
		} 		
 	}) // 찜하기 버튼 끝
 	
 	
 	// 상세이미지 펼치기, 접기 버튼
 	$('#openBtn').on('click', function() {
 		$('#detailImgBox').css({ 'overflow': 'visible', 'height': '100%' });
		$('#openBtn').css('display', 'none');
		$('#foldBtn').css('display', 'block');
 	}) // 펼치기 버튼 눌렀을 경우
 	
 	$('#foldBtn').on('click', function() {
 		$('#detailImgBox').css({ 'overflow': 'hidden', 'height': '940px' });
		$('#openBtn').css('display', 'block');
		$('#foldBtn').css('display', 'none');
		$('html, body').animate({scrollTop:1240},500);
 	}) // 접기 버튼 눌렀을 경우
 	
 	// 배송 예정 날짜 계산기
 	var now = new Date();
	var month = (now.getMonth() + 1);
	var day = (now.getDate() + 2);
	var daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = (now.getDay() + 2);
	var dayOfName = daysOfWeek[dayOfWeek];
	$("#ship_date").html(month + "/" + day + "(" + dayOfName + ")");
	
	// 플러스, 마이너스 버튼(상품 갯수 조절)
	let price = $('#prc').val();
	
	
	$('#plusBtn').on('click', function() { // 플러스 버튼 클릭
		let a = $('#qty').html();

		let now = parseInt(a) + 1;
		$('#qty').html(now);	
		
		$('#minusBtn').css('opacity', '100%');
		
		$('#price3').text(Number(price*now).toLocaleString());
	});
	$('#minusBtn').on('click', function() { // 플러스 버튼 클릭
		let a = $('#qty').text();
		
		if(parseInt(a) > 1) {
			let now = parseInt(a) - 1;
			$('#qty').html(now);
				
			if(a == 2) {
			$('#minusBtn').css('opacity', '20%');
			}
			
			$('#price3').text(Number(price*now).toLocaleString());
		}
	});
	
	
	// 네비바 클릭시 해당 영역으로 스크롤 이동
	$('#detailMove').on('click', function() {
		$('html, body').animate({scrollTop:914},800);
	});
	
	$('#reviewMove').on('click', function() {
		$('html, body').animate({scrollTop:1937},800);
	});
	$('#reviewMove2').on('click', function() {
		$('html, body').animate({scrollTop:1937},800);
	});
	
	$('#returnMove').on('click', function() {
		$('html, body').animate({scrollTop:3338},800);
	});
	
	
	$(window).scroll(function () { 
		var scrollValue = $(document).scrollTop(); 
	    console.log(scrollValue); 
	});
	
	
	// 리뷰 별점 점수별로 별모양 표시
	let starArray = $('.reviewRating');
	
	$('.reviewRating').each(function (index, item) {
		var star = starArray[index].dataset.value;
		
		switch (star) {
		case '1': $(this).html('⭐1');
			break;
		case '2': $(this).html('⭐⭐2');
			break;
		case '3': $(this).html('⭐⭐⭐3');
			break;
		case '4': $(this).html('⭐⭐⭐⭐4');
			break;
		case '5': $(this).html('⭐⭐⭐⭐⭐5');
			break;
	}		

	});
	
 }); // 마지막