$(document).ready(function() {
    // 댓글 영역 토글 (댓글 버튼 클릭 시 열고 닫기)
    $('.comment-btn').click(function() {
        $('.comments-section').toggle(); // 댓글 리스트 열기/닫기
    });

    // 댓글 및 답글 달기 버튼 클릭 이벤트 통합
    $('#submitComment, .submit_reply').click(function(event) {
        event.preventDefault(); // 기본 폼 제출을 막기

        const userId = $('meta[name="user-id"]').attr('content'); 
        const postId = $('meta[name="post-id"]').attr('content'); 
        let commentContent = ''; 
        let parentCommentId = 0; // 기본값은 0, 댓글인 경우

        // 댓글 또는 답글인지 구분
        if ($(this).hasClass('submit_reply')) {
            const replyForm = $(this).closest('.reply-form');
            commentContent = replyForm.find('.reply_content').val(); // 답글 내용
            parentCommentId = replyForm.closest('.comment').data('comment-id'); // 부모 댓글 ID 설정
        } else {
            commentContent = $('#commentContent').val(); // 댓글 내용 가져오기
        }

        const isSecret = $('#isSecret').is(':checked') ? 1 : 0; // 비밀 댓글 여부 확인
        
        // 댓글 또는 답글 내용이 비어 있는지 확인
        if (commentContent.trim() === '') {
            alert('내용을 입력해주세요.');
            return;
        }

        // 서버로 댓글 또는 답글 전송
        $.ajax({
            url: '/community/post/comment/add', // 댓글 또는 답글을 처리하는 서버의 URL
            type: 'POST',
            dataType: 'text',
            data: {
                "comment_content": commentContent,
                "comment_secret": isSecret,
                "post_id": postId,
                "comment_id_write": userId,
                "parent_comment_id": parentCommentId // 부모 댓글 ID (0이면 댓글, 아니면 답글)
            },
            success: function(data) {
                alert('성공적으로 등록되었습니다.');
                location.reload(); // 성공 후 페이지 새로고침
            },
            error: function(error) {
                alert('등록 중 오류가 발생했습니다.');
                console.log(error);
            }
        });
    });

    // 답글쓰기 버튼 클릭 시 답글 입력 폼 표시
    $('.reply-btn').click(function() {
        const replyForm = $(this).parent().next('.reply-form');
        replyForm.toggle(); // 답글 입력 폼을 토글(열기/닫기)
    });

    // 답글 취소 버튼
    $('.cancel_reply').click(function() {
        $(this).closest('.reply-form').hide(); // 답글 입력 폼 닫기
    });

    // 댓글 수정
    $('.editCommentBtn').click(function() {
        const commentId = $(this).data('comment-id');
        const commentDiv = $(this).closest('.comment');
        const existingContent = commentDiv.find('.comment_body p').text().trim(); // 기존 댓글 내용 가져오기
        
        // 수정 폼을 보여주고 기존 내용 세팅
        const editForm = commentDiv.find('.edit-form');
        editForm.show(); // 수정 폼 보여주기
        editForm.find('.edit_content').val(existingContent); // 기존 내용 세팅

        // 저장 버튼 클릭 시 수정 처리
        editForm.find('.saveBtn').off('click').on('click', function() {
            const newContent = editForm.find('.edit_content').val();

            if (newContent.trim() === '') {
                alert('댓글 내용을 입력해주세요.');
                return;
            }

            $.ajax({
                url: '/community/post/comment/update', // 댓글 수정을 처리하는 서버의 URL
                type: 'POST',
                dataType: 'text',
                data: {
                    "comment_id": commentId,
                    "comment_content": newContent,
                },
                success: function(response) {
                    alert('댓글이 수정되었습니다.');
                    location.reload(); // 수정 후 새로고침
                },
                error: function(error) {
                    alert('댓글 수정 중 오류가 발생했습니다.');
                    console.log(error);
                }
            });
        });

        // 취소 버튼 클릭 시 수정 폼 숨기기
        editForm.find('.cancelBtn').off('click').on('click', function() {
            editForm.hide(); // 수정 폼 닫기
        });
    });

    // 댓글 삭제
    $('.deleteCommentBtn').click(function() {
        const commentId = $(this).data('comment-id');
        const userId = $('meta[name="user-id"]').attr('content');

        if (confirm('정말로 댓글을 삭제하시겠습니까?')) {
            $.ajax({
                url: '/community/post/comment/delete/' + commentId, // 댓글 삭제를 처리하는 서버의 URL
                type: 'DELETE',
                success: function(response) {
                    alert('댓글이 삭제되었습니다.');
                    location.reload(); // 삭제 후 새로고침
                },
                error: function(xhr, status, error) {
                    alert('댓글 삭제 중 오류가 발생했습니다.');
                    console.log("AJAX Error:", error);
                    console.log("AJAX Error Status:", status);
                    console.log("AJAX Error Response Text:", xhr.responseText);
                }
            });
        }
    });
});
