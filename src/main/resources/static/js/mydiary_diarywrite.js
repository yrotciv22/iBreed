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


    const diaryTitle = document.querySelector("input[name='diaryTitle']");
    const diaryContent = document.getElementById("content-area");
    const diaryPublicRadios = document.querySelectorAll("input[name='diaryPublic']");


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

        let isValid = true;
        let errorMessage = "";

        // 제목 유효성 검사
        if (diaryTitle.value.trim() === "") {
            isValid = false;
            errorMessage += "제목을 입력하세요.\n";
        }

        // 내용 유효성 검사
        if (diaryContent.innerHTML.trim() === "") {
            isValid = false;
            errorMessage += "내용을 입력하세요.\n";
        }

        // 공개 여부 유효성 검사
        let isPublicSelected = false;
        for (const radio of diaryPublicRadios) {
            if (radio.checked) {
                isPublicSelected = true;
                break;
            }
        }

        if (!isPublicSelected) {
            isValid = false;
            errorMessage += "공개 여부를 선택하세요.\n";
        }

        // 유효하지 않은 경우 폼 제출 중지 및 오류 메시지 표시
        if (!isValid) {
            alert(errorMessage);
            return;
        }

        hiddenContent.value = contentArea.innerHTML; // contentArea의 내용을 hiddenContent로 복사
        console.log(hiddenContent.value); // 폼 제출 전에 데이터 확인
        document.getElementById('diary-form').submit(); // 폼 제출
    }

    // 등록하기 버튼 클릭 시 처리
    submitButton.addEventListener("click", function(event) {
        event.preventDefault();
        submitForm(true); // 최종 등록
    });
});
