/**
 * 
 */
 
 $(document).ready(function(){
 
 // 메인 배너 슬라이드
 
	let firstIndex = 0;
	let imgWidth = 866;
	
	function moveSlide(index) {
		firstIndex = index;
		
		let moveLeft = -(index * imgWidth);
		$('#main_banner').animate({'left':moveLeft}, 'slow');
		
		$('.circleBtn').attr('src', "../image/hollow_circle.png");
		changeCircleBtn(index);
	}
	
	
	function changeCircleBtn(selectedIndex) { 
		let circleBtn = $('.circleBtn');
		
		 circleBtn.removeClass('active');
		 
		 $(circleBtn[selectedIndex]).addClass('active');
	}

	$('.circleBtn').each(function (selectedIndex) {
		$(this).on('click', function() {
			moveSlide(selectedIndex);
		});
	});
    changeCircleBtn(firstIndex);


 // 슬라이드 끝
 
// 최신 다이어리 캐러셀 
  const $specialItemWrap = $(".main_recent_diary_wrap_ul");
    const $specialItems = $(".diary_item");
    const itemWidth = 143; // 각 아이템의 폭 + 여백 (133px + 10px)
    const totalItems = $specialItems.length;
    let currentIndex = 0;

    // 첫 번째 아이템들을 복제하여 끝에 추가 (무한 반복 효과를 위해)
    $specialItems.each(function() {
        const $clone = $(this).clone(true);
        $specialItemWrap.append($clone);
    });

    // 초기 위치 설정: 첫 번째 아이템이 보이도록 설정
    $specialItemWrap.css("transform", `translateX(0px)`);

    function moveCarousel() {
        currentIndex++;

        // 슬라이드 애니메이션 적용
        $specialItemWrap.css("transition", "transform 1s ease");
        $specialItemWrap.css("transform", `translateX(-${currentIndex * itemWidth}px)`);

        // 모든 원래 아이템이 다 보인 후 복제된 첫 번째 아이템으로 이동
        if (currentIndex === totalItems) {
            setTimeout(() => {
                $specialItemWrap.css("transition", "none"); // 트랜지션 효과 제거
                $specialItemWrap.css("transform", `translateX(0px)`); // 첫 번째 위치로 이동
                currentIndex = 0; // 인덱스 리셋
            }, 1000); // 1초 동안의 트랜지션 후 실행
        }
    }

    // 2초마다 캐러셀 이동
    setInterval(moveCarousel, 2000);

  
    // 캐러셀 끝
 
  $(".main_diary_btn").on("click", function openMyDiary() {
   console.log("openMyDiary");

            let requestUrl = "/mydiary/"+userId+"/home";             
            let popupTitle = "iBreed Diary"; 
            let popupWidth = 1200; 
            let popupHeight = 700; 

            window.open(requestUrl, popupTitle, 
                        "width=" + popupWidth + 
                        ",height=" + popupHeight + 
                        ",top=0px" + ",left=0px");
        });
        
// 맨위로
  $(window).on('scroll', function () {
        toggleScrollButton();
    });


  function toggleScrollButton() {
    
    let $toTopBtn = $("#to_top_Btn");
     if ($(window).scrollTop() > 800) {
            $toTopBtn.css("display", "flex");
        } else {
            $toTopBtn.css("display", "none");
        }
    }

 $("#to_top_Btn").on("click", function () {
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });
		  
 
 });