/**
 * 
 */
 
 
 // 다이어리 홈 제목 수정 
 
 $(document).ready(function(){
 	console.log("home js");
 	
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