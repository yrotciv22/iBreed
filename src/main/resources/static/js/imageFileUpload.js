/**
 * ibreed
 */
 
 $(document).ready(function(){
 
 	// 모달창 끄기
	$('#modal_noBtn').on('click', function() {
		$('#modal').css({"display":"none"});
	});
	
 	document.getElementById("fileInput").addEventListener("change", function(event) {
	console.log("[mydiary_home.js] 프로필 사진 선택");
		 
		const file = event.target.files[0];
		console.log("[mydiary_home.js] file ", file);
		    
		 if (file) {
           const reader = new FileReader();
           reader.onload = function(e) {
          
          	const previewImg = document.getElementById('preview');
			previewImg.src = reader.result;
			previewImg.style.display = 'block'; 
			
			document.getElementById('modal').style.display = 'flex'; // 모달창 보이기
			
			/*document.getElementById('save_profile_image_btn').style.display = 'inline-block'; // 버튼 보이기
            document.getElementById('edit_proifle_img_cancel_Btn').style.display = 'flex'; // 버튼 보이기
            document.getElementById('edit_profile_img_btn').style.display = 'none'; // 이미지 숨기기*/

        }; //  reader.onload 끝
         	  reader.readAsDataURL(file); // 선택한 파일의 데이터를 미리보기로 설정	      
       
        };  //if 끝
        
	}); //fileInput addEventListener 끝.
	
	// 취소 버튼 클릭 시 원래 상태로 되돌리기
	document.getElementById("edit_proifle_img_cancel_Btn").addEventListener("click", function() {
	    console.log("cancelEdit");
	
	    const previewImg = document.getElementById('preview');
	    previewImg.src = originalImagePath; // JSP에서 설정한 원래 이미지 경로로 되돌리기
	    previewImg.style.display = 'block'; // 미리보기 이미지가 보이도록 설정
	
	    document.getElementById('save_profile_image_btn').style.display = 'none'; // "저장" 버튼 숨기기
	    document.getElementById('edit_proifle_img_cancel_Btn').style.display = 'none'; // "취소" 버튼 숨기기
	    document.getElementById('edit_profile_img_btn').style.display = 'inline-block'; // "편집" 버튼 보이기
	});
	
	
	 // save_profile_image_btn 버튼 클릭 시 폼 제출
	 document.getElementById('save_profile_image_btn').addEventListener('click', function() {
     	console.log("save_profile_image_btn 클릭");
     
     	document.getElementById('uploadProfileImgForm').submit();
    }); //save_profile_image_btn addEventListener 끝.
 	
 	
 
 });