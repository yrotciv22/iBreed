/**
 * slideShow 
 */
$(function () {
	/*랜덤 버튼*/
	/*let randomNum = Math.floor(Math.random() * 5);
	moveSlide(randomNum);*/
	
	let moveIndex = 0;
	//이동한 이미지의 이미지 값을 저장
	
	//슬라이드 패널을 이동시키는 함수
	function moveSlide(index) {
		// 전달받은 index를 moveIndex에 저장 
		moveIndex = index;
		
		//슬라이드 이동
		let moveLeft = -(index * 1280);
		$('#slidePanel').animate({'left':moveLeft}, 'slow');		
	}

	//prev 버튼 클릭시 왼쪽으로 이동
	$('#prevButton').on('click', function() {
		if(moveIndex != 0) { //첫번째가 아니라면
			moveIndex--; // 인덱스 -1
			
			moveSlide(moveIndex);	 
		}
	});
	
	$('#nextButton').on('click', function() {
		if(moveIndex != 4) { //마지막이 아니라면
			moveIndex++; // 인덱스 +1
			
			moveSlide(moveIndex);	 
		}
	});
	
	// 각 컨트롤버튼에 대해서 
	$('.controlButton').each(function(index) {
		$(this).hover(
			function() { // 마우스 올렸을때
				$(this).attr('src', '../image/controlButton2.png')
			},
			function() { // 마우스 땟을때
				$(this).attr('src', '../image/controlButton1.png')
			}
		)
		
		//클릭했을때 이동 : 인덱스 값을 무브슬라이드한테 전달
		$(this).on('click', function() {
			moveSlide(index);
		})
		
	}); // 컨트롤버튼 종료
	
});; // function 끝
