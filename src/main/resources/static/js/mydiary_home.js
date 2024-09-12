$(document).ready(function(){
	console.log("home js");
	
	// JSP에서 전달된 userId를 사용
	const path = window.location.pathname;
	const regex = /\/[^\/]+\/([^\/]+)\/[^\/]+/;
	const match = path.match(regex);
	const currentUserId = match[1];

	console.log("currentUserId", currentUserId);

	// URL에 currentUserId를 삽입하여 href 속성 업데이트
	const homeTab = document.getElementById('homeTab');
	homeTab.href = '/mydiary/' + currentUserId + '/home';

	const diaryTab = document.getElementById('diaryTab');
	diaryTab.href = '/mydiary/' + currentUserId + '/diary';

	const emotionTab = document.getElementById('emotionTab');
	emotionTab.href = '/mydiary/' + currentUserId + '/emotion';

	const photosTab = document.getElementById('photosTab');
	photosTab.href = '/mydiary/' + currentUserId + '/photos';

	const calendarTab = document.getElementById('calendarTab');
	calendarTab.href = '/mydiary/' + currentUserId + '/calendar';

	const friendsTab = document.getElementById('friendsTab');
	friendsTab.href = '/mydiary/' + currentUserId + '/friends';

	// 나머지 코드 그대로 유지
	document.getElementById("editButton").addEventListener("click", function() {
		document.getElementById("editButton").style.display = "none";
		document.getElementById("diaryTitleDisplay").style.display = "none";
		document.getElementById("diaryTitleInput").style.display = "block";
		document.getElementById("saveButton").style.display = "block";
		document.getElementById("cancelBtn").style.display = "block";
	});

	document.getElementById("cancelBtn").addEventListener("click", function() {
		document.getElementById("editButton").style.display = "block";
		document.getElementById("diaryTitleDisplay").style.display = "block";
		document.getElementById("diaryTitleInput").style.display = "none";
		document.getElementById("saveButton").style.display = "none";
		document.getElementById("cancelBtn").style.display = "none";
	});

	document.getElementById("edit_feeling_btn").addEventListener("click", function() {
		document.getElementById("select_feeling_select").style.display = "flex";
		document.getElementById("save_feeling_btn").style.display = "flex";
		document.getElementById("today_feeling").style.display = "none";
	});

	document.getElementById("edit_profile_text_btn").addEventListener("click", function() {
		document.getElementById("diary_profile_text").style.display = "flex";
		document.getElementById("save_profile_text_btn").style.display = "flex";
		document.getElementById("profile_text").style.display = "none";
		document.getElementById("edit_profile_text_btn").style.display = "none";
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
			
			document.getElementById('save_profile_image_btn').style.display = 'inline-block'; // 버튼 보이기
            document.getElementById('edit_proifle_img_cancel_Btn').style.display = 'flex'; // 버튼 보이기
            
            document.getElementById('edit_profile_img_btn').style.display = 'none'; // 이미지 숨기기

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
