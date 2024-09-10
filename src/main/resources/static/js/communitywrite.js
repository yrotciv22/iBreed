$(document).ready(function() {
    // 페이지가 로드될 때 고정된 boardId가 있으면 말머리를 자동으로 설정
    var initialBoardId = $('#board').val();
    if (initialBoardId) {
        updateHeadings(initialBoardId); // 말머리 자동 업데이트
        $('#hiddenBoardId').val(initialBoardId); // 고정된 boardId가 있을 경우 히든 필드에 값 설정
    }

    // 등록 버튼 클릭 시
    $('.submit-btn').on('click', function(event) {
        const boardId = $('#board').val();
        const heading = $('#heading').val();
        console.log("폼 제출 시 선택된 boardId: " + boardId);

        // 게시판이 선택되지 않았을 경우
        if (!boardId) {
            alert('게시판을 선택하세요.');
            event.preventDefault();
            return;
        }

        // 말머리가 선택되지 않았을 경우
        if (!heading || heading === '') {
            alert('말머리를 선택하세요.');
            event.preventDefault();
            return;
        }

        // 유효성 검사 실행
        if (!validateForm()) {
            event.preventDefault();
        }

        // 선택된 게시판 id를 히든 필드에 저장
        $('#hiddenBoardId').val(boardId);
    });

    // 유효성 검사 함수
    function validateForm() {
        // 제목 유효성 검사
        const title = $('#title').val();
        if (!title || title.trim().length === 0) {
            alert('제목을 입력하세요.');
            $('#title').focus();
            return false;
        }

        // 내용 유효성 검사
        const content = $('#content').val();
        if (!content || content.trim().length === 0) {
            alert('내용을 입력하세요.');
            $('#content').focus();
            return false;
        }

        // 파일 형식 유효성 검사 (필수는 아니지만, 형식 검사를 추가할 수 있음)
        const image = $('#image').val();
        const video = $('#video').val();
        if (image && !isValidFileType(image, ['jpg', 'jpeg', 'png', 'gif'])) {
            alert('이미지 파일 형식이 잘못되었습니다. (허용 형식: jpg, jpeg, png, gif)');
            return false;
        }
        if (video && !isValidFileType(video, ['mp4', 'avi', 'mov'])) {
            alert('동영상 파일 형식이 잘못되었습니다. (허용 형식: mp4, avi, mov)');
            return false;
        }

        return true;
    }

    // 파일 형식 유효성 검사 함수
    function isValidFileType(fileName, allowedTypes) {
        const extension = fileName.split('.').pop().toLowerCase();
        return allowedTypes.includes(extension);
    }

    // 이미지/비디오 미리보기 기능
    $('#image, #video').on('change', function(event) {
        const fileInput = event.target;
        const file = fileInput.files[0];

        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                if (fileInput.id === 'image') {
                    $('#image-preview').attr('src', e.target.result).show();
                } else if (fileInput.id === 'video') {
                    $('#video-preview').attr('src', e.target.result).show();
                }
            };
            reader.readAsDataURL(file);
        }
    });

    // 게시판 선택에 따라 말머리 동적으로 업데이트
    $('#board').on('change', function() {
        var selectedBoardId = $(this).val();
        updateHeadings(selectedBoardId);
        console.log("선택된 boardId: " + selectedBoardId);

        // 게시판 선택 시 히든 필드 업데이트
        $('#hiddenBoardId').val(selectedBoardId);
    });

    // 말머리 업데이트 함수
    function updateHeadings(boardId) {
        var headingSelect = $('#heading');

        // 말머리 옵션 초기화
        headingSelect.empty();

        // 게시판에 맞는 말머리 추가
        if (boardId == "1") {
            headingSelect.append('<option value="임신">임신</option>');
            headingSelect.append('<option value="출산">출산</option>');
            headingSelect.append('<option value="산후관리">산후관리</option>');
        } else if (boardId == "2") {
            headingSelect.append('<option value="육아팁">육아팁</option>');
            headingSelect.append('<option value="건강">건강</option>');
            headingSelect.append('<option value="놀이">놀이</option>');
        } else if (boardId == "3") {
            headingSelect.append('<option value="제품후기">제품후기</option>');
            headingSelect.append('<option value="병원후기">병원후기</option>');
            headingSelect.append('<option value="서비스후기">서비스후기</option>');
        } else if (boardId == "4") {
            headingSelect.append('<option value="판매">판매</option>');
            headingSelect.append('<option value="구매">구매</option>');
            headingSelect.append('<option value="교환">교환</option>');
        } else if (boardId == "5") {
            headingSelect.append('<option value="구인">구인</option>');
            headingSelect.append('<option value="구직">구직</option>');
            headingSelect.append('<option value="알바">알바</option>');
        }

        // 말머리 선택 안내 메시지 추가 (게시판 선택 후에만)
        headingSelect.prepend('<option value="" disabled selected>말머리를 선택하세요</option>');
    }

    
    
});
