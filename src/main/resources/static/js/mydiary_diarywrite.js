/**
 * 
 */
 

document.addEventListener("DOMContentLoaded", function() {
    const imageUploadBtn = document.getElementById("image-upload-btn");
    const videoUploadBtn = document.getElementById("video-upload-btn");
    const linkUploadBtn = document.getElementById("link-upload-btn");
    const linkPopup = document.getElementById("link-popup");
    const closeBtn = document.querySelector(".close-btn");
    const confirmLinkBtn = document.getElementById("confirm-link");
    const contentArea = document.getElementById("content-area");
    const saveButton = document.querySelector(".save-button");
    const submitButton = document.querySelector(".submit-button");

    // 사진 버튼 클릭 시 파일 선택 창 열기
    imageUploadBtn.addEventListener("click", function() {
        document.getElementById("image-upload").click();
    });

    
    videoUploadBtn.addEventListener("click", function() {
        document.getElementById("video-upload").click();
    });

    // 링크 버튼 클릭 시 팝업 열기
    linkUploadBtn.addEventListener("click", function() {
        linkPopup.style.display = "block";
    });

    // 팝업닫시
    closeBtn.addEventListener("click", function() {
        linkPopup.style.display = "none";
    });

    // 팝업 외부 클릭 시 팝업 닫기
    window.addEventListener("click", function(event) {
        if (event.target === linkPopup) {
            linkPopup.style.display = "none";
        }
    });

    // 확인 버튼 클릭 시 링크를 내용 칸에 추가
    confirmLinkBtn.addEventListener("click", function() {
        const linkValue = document.getElementById("link-input").value;
        const linkElement = document.createElement("a");
        linkElement.href = linkValue;
        linkElement.textContent = linkValue;
        linkElement.target = "_blank";
        contentArea.appendChild(linkElement);
        linkPopup.style.display = "none";
    });

    // 사진 업로드 시 내용 칸에 이미지 표시
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

    // 동영상 업로드 시 내용 칸에 동영상 표시
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
// 임시 저장 및 등록하기 버튼 클릭 시 처리
    function submitForm(isFinal) {
        document.getElementById('diary_upload_status').value = isFinal;
        document.getElementById('diary-form').submit();
    }

    // 임시 저장 버튼 클릭 시 처리
    saveButton.addEventListener("click", function() {
        submitForm(false); // 임시 저장
    });

    // 등록하기 버튼 클릭 시 처리
    submitButton.addEventListener("click", function() {
        submitForm(true); // 최종 등록
    });
});