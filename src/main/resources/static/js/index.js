/**
 * 
 */
 
 $(document).ready(function(){
 
 
  $(".main_diary_btn").on("click", function openMyDiary() {
   console.log("openMyDiary");

            let requestUrl = "/mydiary/"+userId;             
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