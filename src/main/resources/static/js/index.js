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