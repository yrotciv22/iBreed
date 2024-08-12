/**
 * shop_main.js
 */
 
$(function() {
	
	// 상품 썸네일에 마우스 올릴 때 장바구니&찜바구니 버튼 활성화 + 확대하기
	/*$('.likeCartBox')
	.on('mouseover', function() {
		$('.likeCartBox').css('visibility', 'visible');
	})
	.on('mouseout', function() {
		$('.likeCartBox').css('visibility', 'hidden');
	});*/
	
	// 인기 TOP 10 썸네일 호버
	let popularBox = $('.P_likeCartBox');
	
	$('.popularMenuBox').each(function(i) {
		$(this).hover(
			function() {
				popularBox[i].style.visibility = 'visible';
			},
			function() {
				popularBox[i].style.visibility = 'hidden';
			}
		);
	});
	
	// 신상품, 베스트, 재고템 썸네일 호버
	let listCartBox = $('.likeCartBox1');
	
	$('.menuBox').each(function(i) {
		$(this).hover(
			function() {
				listCartBox[i].style.visibility = 'visible';
			},
			function() {
				listCartBox[i].style.visibility = 'hidden';
			}
		);
	});
	

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