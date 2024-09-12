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
        const content = $('#content-area').html().trim(); // contenteditable의 내용을 가져옴

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

        // 내용이 없는 경우
        if (!content) {
            alert('내용을 입력하세요.');
            event.preventDefault();
            return;
        }

        // 선택된 게시판 id를 히든 필드에 저장
        $('#hiddenBoardId').val(boardId);

        // contenteditable의 내용을 hidden textarea에 저장
        $('#hidden-content').val(content); // 내용 저장
    });

    // 게시판 선택에 따라 말머리 동적으로 업데이트
    $('#board').on('change', function() {
        var selectedBoardId = $(this).val();
        updateHeadings(selectedBoardId);
        $('#hiddenBoardId').val(selectedBoardId); // 선택된 게시판 ID를 히든 필드에 저장
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
            headingSelect.append('<option value="추천">추천</option>');
            
        } else if (boardId == "3") {
            headingSelect.append('<option value="제품후기">제품후기</option>');
            headingSelect.append('<option value="병원후기">병원후기</option>');
            headingSelect.append('<option value="서비스후기">서비스후기</option>');
        } else if (boardId == "4") {
            headingSelect.append('<option value="판매">판매</option>');
            headingSelect.append('<option value="구매">구매</option>');
            headingSelect.append('<option value="교환">교환</option>');
            headingSelect.append('<option value="나눔">나눔</option>');
        } else if (boardId == "5") {
            headingSelect.append('<option value="구인">구인</option>');
            headingSelect.append('<option value="구직">구직</option>');
            headingSelect.append('<option value="알바">알바</option>');
        }

        // 말머리 선택 안내 메시지 추가 (게시판 선택 후에만)
        headingSelect.prepend('<option value="" disabled selected>말머리를 선택하세요</option>');
    }

    // 이미지, 동영상, 링크 업로드 버튼 클릭 시 숨겨진 input 요소 트리거
    $('#image-upload-btn').on('click', function() {
        $('#image-upload').click();
    });
    $('#video-upload-btn').on('click', function() {
        $('#video-upload').click();
    });
    $('#link-upload-btn').on('click', function() {
        $('#link-popup').show();
    });

	 // 링크 추가 버튼 클릭 시 팝업 열기
   $('#link-upload-btn').on('click', function() {
        $('#link-popup').addClass('show');  // 팝업을 보여주는 클래스를 추가
    });
    // 팝업 닫기 (X 버튼 및 외부 클릭 시)
    $('.close-btn').on('click', function() {
        $('#link-popup').hide();
    });
    $(document).on('click', function(event) {
        if (!$(event.target).closest('.popup-content').length && !$(event.target).is('#link-upload-btn')) {
            $('#link-popup').hide(); // 팝업 바깥쪽을 클릭하면 팝업 닫기
        }
    });

    // 링크 추가 버튼 클릭 시 contenteditable 영역에 링크 추가
    $('#confirm-link').on('click', function() {
        const linkValue = $('#link-input').val().trim();
        if (linkValue) {
            const linkElement = document.createElement('a');
            linkElement.href = linkValue;
            linkElement.textContent = linkValue;
            linkElement.target = '_blank';
            $('#content-area').append(linkElement);
            $('#link-popup').hide();  // 팝업 닫기
            $('#link-input').val(''); // 입력 필드 초기화
        }
    });

    // 이미지 파일 선택 시 contenteditable에 삽입
    $('#image-upload').on('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const imageElement = document.createElement('img');
                imageElement.src = e.target.result;
                imageElement.style.maxWidth = '100%';
                imageElement.style.marginTop = '10px';
                $('#content-area').append(imageElement);
            };
            reader.readAsDataURL(file);
        }
    });

    // 동영상 파일 선택 시 contenteditable에 삽입
    $('#video-upload').on('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const videoElement = document.createElement('video');
                videoElement.src = e.target.result;
                videoElement.controls = true;
                videoElement.style.maxWidth = '100%';
                videoElement.style.marginTop = '10px';
                $('#content-area').append(videoElement);
            };
            reader.readAsDataURL(file);
        }
    });
    // 등록 버튼 클릭 시, contenteditable의 내용을 hidden textarea로 복사 후 폼 제출
    $('.submit-btn').on('click', function(event) {
        const content = $('#content-area').html().trim(); // contenteditable의 내용을 가져옴
        if (!content) {
            alert('내용을 입력하세요.');
            event.preventDefault();
            return;
        }
        $('#hidden-content').val(content); // hidden textarea에 내용을 복사
    });
});
