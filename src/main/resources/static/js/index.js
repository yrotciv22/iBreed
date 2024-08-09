/**
 * 
 */
 
 $(document).ready(function(){
 
 
 
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