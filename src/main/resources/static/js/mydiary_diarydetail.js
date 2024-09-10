$(document).ready(function() {
    const userId = $('meta[name="user-id"]').attr('content');  // Meta 태그에서 userId를 가져옴

    // 삭제 버튼 기능 추가
    $('.deleteBtn').click(function(event) {
        event.preventDefault();
        const diaryPostId = $(this).data('diary-id');

        if (confirm("일기를 삭제하시겠습니까?")) {
            const deleteUrl = `/mydiary/${userId}/diarydelete/${diaryPostId}`;
            window.location.href = deleteUrl; 
            alert('일기가 삭제되었습니다.');
        }
    });

    // 수정 버튼 기능 추가
    $('.editBtn').click(function(event) {
        event.preventDefault();
        const diaryPostId = $(this).data('diary-id');
        window.location.href = `/mydiary/${userId}/diaryedit/${diaryPostId}`;  // 수정 페이지로 이동
    });

  // 페이지 로드 시 좋아요 상태 확인
    $('.like_button').each(function() {
        const diaryPostId = $(this).data('diary-post-id');
        const button = $(this);

        // 서버에 좋아요 상태를 요청
        $.ajax({
            url: '/mydiary/' + userId + '/like/status',
            type: 'GET',
            data: { diaryPostId: diaryPostId },
            success: function(response) {
                if (response.isLiked) {
                    button.html('❤️ 좋아요 ' + response.likeCount);
                    button.data('liked', true);  // 좋아요 상태 저장
                } else {
                    button.html('🤍 좋아요 ' + response.likeCount);
                    button.data('liked', false);  // 좋아요 상태 저장
                }
            },
            error: function() {
                alert('좋아요 상태를 불러오지 못했습니다.');
            }
        });
    });

    // 좋아요/좋아요 취소 버튼 클릭
    $('.like_button').click(function() {
        const diaryPostId = $(this).data('diary-post-id');
        const button = $(this);
        const isLiked = button.data('liked');  // 현재 좋아요 상태

        // 서버에 좋아요/취소 요청
        $.ajax({
            url: '/mydiary/' + userId + '/like',
            type: 'POST',
            data: { diaryPostId: diaryPostId, isLiked: isLiked },
            success: function(response) {
                if (response.status === 'success') {
                    if (isLiked) {
                        // 좋아요 취소 처리
                        const likeCount = response.likeCount;
                        button.html('🤍 좋아요 ' + likeCount);
                        button.data('liked', false);  // 상태 변경
                    } else {
                        // 좋아요 처리
                        const likeCount = response.likeCount;
                        button.html('❤️ 좋아요 ' + likeCount);
                        button.data('liked', true);  // 상태 변경
                    }
                } else {
                    alert('좋아요 처리 중 오류가 발생했습니다.');
                }
            },
            error: function() {
                alert('서버와의 통신 중 오류가 발생했습니다.');
            }
        });
    });
});


