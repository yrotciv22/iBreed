/**
 * shop_detail
 */
 
 $(function() {
 	
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
		$('html, body').animate({scrollTop:912},500);
 	}) // 접기 버튼 눌렀을 경우
 	
 	// 배송 예정 날짜 계산기
 	var now = new Date();
	var month = (now.getMonth() + 1);
	var day = (now.getDate() + 1);
	var daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = (now.getDay()+1);
	var dayOfName = daysOfWeek[dayOfWeek];
	$("#ship_date").html(month + "/" + day + "(" + dayOfName + ")");
	
	// 플러스, 마이너스 버튼(상품 갯수 조절)
	let price = $('#prc').val();
	
	
	$('#plusBtn').on('click', function() { // 플러스 버튼 클릭
		let a = $('#qty').html();

		let now = parseInt(a) + 1;
		$('#qty').html(now);	
		
		// 추가
		$("#cart_quantity_input").val(now);
		
		 // 마이너스 버튼 활성화
		$('#minusBtn').css('opacity', '100%');
		
		  // 가격 업데이트
		$('#price3').text(Number(price*now).toLocaleString());
	});
	
	
	$('#minusBtn').on('click', function() { // 플러스 버튼 클릭
		let a = $('#qty').text();
		
		if(parseInt(a) > 1) {
			let now = parseInt(a) - 1;
			$('#qty').html(now);
			// 추가
			$("#cart_quantity_input").val(now);
				
			if(a == 2) {
				$('#minusBtn').css('opacity', '20%');
			}
			
			$('#price3').text(Number(price*now).toLocaleString());
		}
	});
	
	
	// 네비바 클릭시 해당 영역으로 스크롤 이동
	function scrollToElement(selector, duration) {
        var $target = $(selector);
        if ($target.length) {
            $('html, body').animate({
                scrollTop: $target.offset().top
            }, duration);
        }
    }
    
    // 각 버튼에 대한 클릭 이벤트 핸들러 설정
    $('#detailMove').on('click', function() {
        scrollToElement('#midBox', 400);
    });
    
    $('#reviewMove').on('click', function() {
        scrollToElement('#reviewBox', 400);
    });
    
    $('#reviewMove2').on('click', function() {
        scrollToElement('#reviewBox', 400);
    });
    
    $('#returnMove').on('click', function() {
        scrollToElement('#bottomBox', 400);
    });
	
	 $(window).on('scroll', function() {
        var scrollTop = $(window).scrollTop();
        
        if (scrollTop >= 912) {
            $('#detailMove').css({'background':'white', 'color':'#53afb2','font-weight':'600'});
        } else { // 기본 색상
           $('#detailMove').css({'background':'rgb(250, 250, 250)', 'color':'black'});
        }
        
        if (scrollTop >= ($('#reviewBox').offset().top)-10) {
           $('#reviewMove').css({'background':'white', 'color':'#53afb2'});
           $('#detailMove').css({'background':'rgb(250, 250, 250)', 'color':'black'});
        } else { // 기본 색상
           $('#reviewMove').css({'background':'rgb(250, 250, 250)', 'color':'black'});
           
        }
        
        
        if (scrollTop >= ($('#bottomBox').offset().top)-10) {
           $('#returnMove').css({'background':'white', 'color':'#53afb2'});
            $('#reviewMove').css({'background':'rgb(250, 250, 250)', 'color':'black'});
        }  else { // 기본 색상
           $('#returnMove').css({'background':'rgb(250, 250, 250)', 'color':'black'});
        }
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
	
	
	// 로그인 했을 경우, 안했을 경우
	// 찜하기버튼
	$("#likes").on("click", function() {
	
	    event.preventDefault(); //  장바구니 폼 제출 막기
	
		if(userId) {
		
	 		// src 값을 가져와서 찜버튼이 눌렸는지 안눌렸는지 확인함 
			if($('#likes').attr("src") == "/image/yes_like.png") {
		 		$('#likes').attr("src", "/image/no_like.png");
			} else {
		 		$('#likes').attr("src", "/image/yes_like.png");
			} 		
			
		} else {
			alert("로그인 후에 본 서비스를 이용하실 수 있습니다.");
		}
	});
	

	// 예은 수정 -----------------------------
	
        
	// 기존 장바구니 폼 제출 이벤트

	
	$("#put_cart").on("click", function(event) {
    event.preventDefault();
    
    const qty = $('#qty').html();
    $('#cart_quantity_input').val(qty);
    
    // 장바구니에 담기
    $.ajax({
        type: "post",
        url: "/shop/insertCart",
        data: $("#cartForm").serialize(),
        success: function(response) {
            $("#confirm_add_cart").css("display", "flex");
            $(".popup_text").html(response);
        },
        error: function() {
            alert("장바구니 추가 중 오류가 발생했습니다.");
        }
    });
});
	
	// 팝업창 닫기 
	$("#cart_close_btn").on("click", function() {
		$("#confirm_add_cart").css("display", "none");
	

	// 장바구니 버튼
	/*$("#put_cart").on("click", function() {
		if(userId) {
			alert("로그인 했나? "+ userId);
		} else {
			alert("로그인 후에 본 서비스를 이용하실 수 있습니다.");
		}
	});
	
	


	// 구매하기 버튼
	 $("#buying").on("click", function() {
	   event.preventDefault();
	   
		if(userId) {
			 const qty = $('#qty').html();
    $('#cart_quantity_input').val(qty);
    
    // 바로 구매 처리
    $.ajax({
        type: "post",
        url: "/shop/buyNow",
        data: $("#cartForm").serialize(),
        success: function(response) {
            window.location.href = "/shop/order"; // 바로 구매 후 결제 페이지로 이동
        },
        error: function() {
            alert("구매 중 오류가 발생했습니다.");
        }
    });
		} else {
			alert("로그인 후에 본 서비스를 이용하실 수 있습니다.");
		}

	 });
	
	// 예은 수정 끝 ------------------------------------

	
	
	// 페이지네이션
	
	$('#prevPage').on('click', function() {
	    let currentPage = parseInt($('#pagination').data('current-page'));
	    let productId = $('#pagination').data('product-id'); // productId 가져오기
	    if (currentPage > 1) {
			//window.location.href = `/shop_detail/${productId}?page=` + (currentPage - 1) + '&scrollTo=' + encodeURIComponent('#reviewBox');	    
	        window.location.href = `/shop_detail/${productId}?page=` + (currentPage - 1);
	    }
	});
	
	$('#nextPage').on('click', function() {
	    let currentPage = parseInt($('#pagination').data('current-page'));
	    let totalPages = parseInt($('#pagination').data('total-pages'));
	    let productId = $('#pagination').data('product-id'); // productId 가져오기
	    if (currentPage < totalPages) {
	        //window.location.href = `/shop_detail/${productId}?page=` + (currentPage + 1) + '&scrollTo=' + encodeURIComponent('#reviewBox');
	        window.location.href = `/shop_detail/${productId}?page=` + (currentPage + 1);
	    }
	});
	
	
	 
 }); // 마지막