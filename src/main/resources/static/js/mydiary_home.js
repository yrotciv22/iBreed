/**
 * 
 */
 
 
 // 다이어리 홈 제목 수정 
 
 $(document).ready(function(){
 	console.log("home js");
 	
 		
    const currentUrl = window.location.href;
    const urlParts = currentUrl.split('/');
    const currentUserId = urlParts[urlParts.length - 2];
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
    
    /*const testTab = document.getElementById('testTab');
    testTab.href = '/mydiary/' + currentUserId + '/test';*/
    
	
 	
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
	
	
	
	
 });