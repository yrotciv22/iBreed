/**
 * 
 */
 

document.addEventListener("DOMContentLoaded", function() {
 console.log("diarywriteJavaScript is working!");
    const imageUploadBtn = document.getElementById("image-upload-btn");
    const videoUploadBtn = document.getElementById("video-upload-btn");
    const linkUploadBtn = document.getElementById("link-upload-btn");
    const linkPopup = document.getElementById("link-popup");
    const closeBtn = document.querySelector(".close-btn");
    const confirmLinkBtn = document.getElementById("confirm-link");
    const contentArea = document.getElementById("content-area");
    const hiddenContent = document.getElementById("hidden-content");
    const submitButton = document.querySelector(".submit-button");
	
	console.log(submitButton);
    imageUploadBtn.addEventListener("click", function() {
        document.getElementById("image-upload").click();
    });

    videoUploadBtn.addEventListener("click", function() {
        document.getElementById("video-upload").click();
    });

    linkUploadBtn.addEventListener("click", function() {
        linkPopup.style.display = "block";
    });

    closeBtn.addEventListener("click", function() {
        linkPopup.style.display = "none";
    });

    // 팝업 외부 클릭 시 팝업 닫기
    window.addEventListener("click", function(event) {
        if (event.target === linkPopup) {
            linkPopup.style.display = "none";
        }
    });

    confirmLinkBtn.addEventListener("click", function() {
        const linkValue = document.getElementById("link-input").value;
        const linkElement = document.createElement("a");
        linkElement.href = linkValue;
        linkElement.textContent = linkValue;
        linkElement.target = "_blank";
        contentArea.appendChild(linkElement);
        linkPopup.style.display = "none";
    });

    document.getElementById('image-upload').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const imagePreview = document.createElement('img');
                imagePreview.src = e.target.result;
                imagePreview.style.maxWidth = '100%';
                contentArea.appendChild(imagePreview);
            };
            reader.readAsDataURL(file);
        }
    });

    document.getElementById('video-upload').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const videoPreview = document.createElement('video');
                videoPreview.src = e.target.result;
                videoPreview.controls = true;
                videoPreview.style.maxWidth = '100%';
                contentArea.appendChild(videoPreview);
            };
            reader.readAsDataURL(file);
        }
    });

    // 등록하기 버튼 클릭 시 처리
    function submitForm(isFinal) {
        hiddenContent.value = contentArea.innerHTML; // contentArea의 내용을 hiddenContent로 복사
        // document.getElementById('diary_upload_status').value = isFinal ? 'final' : 'draft'; // 이 부분 제거
        console.log(hiddenContent.value); // 폼 제출 전에 데이터 확인
        document.getElementById('diary-form').submit(); // 폼 제출
    }



    // 등록하기 버튼 클릭 시 처리
    submitButton.addEventListener("click", function() {
        submitForm(true); // 최종 등록
    });
});
