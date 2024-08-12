/**
 * shop_main.js
 */
 
$(function() {
	
	// 상품 썸네일에 마우스 올릴 때 장바구니&찜바구니 버튼 활성화 + 확대하기
	$('.menuBox')
	.on('mouseover', function() {
		$(this).css('transform', 'scale(1.1');
	})
	.on('mouseout', function() {
		$(this).css('transform', 'scale(1');
	})
	

	// Infinity Scroll(무한 스크롤)
	
	var count = 0;
	
	window.onscroll = function(e) {
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			count++;
			
			var addContent = '<div class="block"><p>'+ count +'번째로 추가된 콘텐츠</p></div>';
	        //article에 추가되는 콘텐츠를 append
	        $('section').append(addContent);
		}
	}
});