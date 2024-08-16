/**
 * album_main.js
 */
 
$(function() {
	
	// select 선택에 따라 앨범 순서 변경
	$('#selectBox').change(function () {
		var value = $(this).val
		
		console.log(value);
	});
	
	
	// 각 앨범 체크박스
	let photoBox = $('.photoCheck');
	
	$('.albumBox').each(function(i) {
		let checked = $(this).is(':checked');
		$(this).hover(
			function() {
				photoBox[i].style.visibility = 'visible';
			},
			function() {
				if(checked) {
					photoBox[i].style.visibility = 'hidden';
				}
			}
		);
	});
	
	
	//앨범 검색 버튼(돋보기 이미지) 효과 주기
	$('input[type=image]').hover(
		function () {
			$(this).css('opacity', '85%');
		},
		function () {
			$(this).css('opacity', '70%');
		
	})
	
	
	// 앨범 전체 선택하기
	$('.allCheck').click(function() {
		$('.chk').prop('checked', this.checked);
		
		let c = $('.chk').val();
		console.log(c);
	});
	
	
	// 앨범 각자 선택하기
	// 배열 albumBox와 .chk 관계에서 순서대로 매칭
	// 배열 albumBox는 인덱스 i로 구분, .chk는 each로 구분해낸 this번째 
	let albumBox = $('.albumBox');
	
	$('.chk').on('click', function() {
		
		$('.chk').each(function(i) {
			let checked = $(this).is(':checked');
			if(checked){
				albumBox[i].style.background = 'lightskyblue';
			} else {
				albumBox[i].style.background = 'none';
			}
		});
	});
	
	
	$('.allCheck').click(function(i) {
		if($('.chk').is(':checked')) {
			$('.albumBox').css('background', 'lightskyblue');
			$('.photoCheck').css('visibility', 'visible');
		} else {
			$('.albumBox').css('background', 'none');
			$('.photoCheck').css('visibility', 'hidden');
		}
	});
	
	// 우클릭 이벤트 만들기
	$('.albumBox').on('contextmenu', function(event) {
	  event.preventDefault();
	  $('#menu').css({
	        display: 'block',
	        left: event.pageX,
	        top: event.pageY
	    });
	});

	// 다른곳 클릭시 메뉴 숨기기	
	$(document).on('click', function() {
        $('#menu').hide();
    });
	
	// 브라우저 기본 이벤트 잠금하기	
	$('albumBox').on('contextmenu', function() {
	  return false;
	});
	
	// 우클릭 각 메뉴 마우스 올렸을 때
	$('#menu a').hover(
		function() {
			$(this).css('background', '#eff1f6');
		},
		function() {
			$(this).css('background', 'white');
		
	});
	
	
	// ↓↓↓ 밑으로 모달창 ↓↓↓↓
	
	// 모달창 키기
	// 우클릭 후 삭제버튼 클릭 시 모달창 띄우기 (flex로 바꿔줌)
	// 삭제모달
	$('#deleteBtn').on('click', function(e) {
		e.preventDefault();
		$('.delete_modal').css({"display":"flex"});
	});
	
	// 삭제 함수
	function deleteCheck() {
		location.href="/photos/deleteAlbum/${albumResult.album_id}";
	}
	
	// 이름변경모달
	$('#changeBtn').on('click', function(e) {
		e.preventDefault();
		$('.change_modal').css({"display":"flex"});
		$("#change_text").focus(); // 여기서 포커스를 주는데 먹히지 않는다?
	});
	
	// 이름변경 모달 text value 자동선택
	
	
	// 모달창 끄기
	$('.xBtn').on('click', function() {
		$('.modal').css({"display":"none"});
	});
	$('.modal_noBtn').on('click', function() {
		$('.modal').css({"display":"none"});
	});
	
});