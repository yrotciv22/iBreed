/**
 * 
 */
 
 
 // 다이어리홈 제목 수정 

 
 $(document).ready(function(){
 	console.log("home js");
 	
 	document.getElementById("editButton").addEventListener("click", function() {
	
		document.getElementById("editButton").style.display = "none";
		document.getElementById("diaryTitleDisplay").style.display = "none";
		
		document.getElementById("diaryTitleInput").style.display = "block";
		document.getElementById("saveButton").style.display = "block";
	});	
 
 
 
   //  $('#diaryTitleUpdateForm').on('submit', function(event) {
    //    event.preventDefault();
                
//        let title = $('#diaryTitleInput').val();
  //      console.log("title",title);

//        $.ajax({
  //          type: "POST",
    //        url: "/mydiary/{user_id}/home/updateDiary/title", 
// 			data:'',
       //     dataType: 'text',
       //     success: function(result) {
          //      if (result == "success") {
           //         alert("수정이 완료되었습니다.");
          //          location.href = "/"; 
            //    } else {
          //          alert("수정 실패");
           //     }
         //   },
         //   error: function() {
         //       alert("오류가 발생했습니다");
        //    }
      //  });
   // });
    
 

	
 });