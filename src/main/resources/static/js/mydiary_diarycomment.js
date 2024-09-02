$(document).ready(function() {
    // 댓글 달기 버튼 클릭 이벤트
    $('#submitComment').click(function() {
        const userId = $('meta[name="user-id"]').attr('content');
        const diaryPostId = $('meta[name="diary-post-id"]').attr('content');
        const commentContent = $('#commentContent').val();
         const isSecret = $('#isSecret').is(':checked');
	console.log(diaryPostId);
	console.log(commentContent);
        if (commentContent.trim() === '') {
            alert('댓글 내용을 입력해주세요.');
            return;
        }

        // 서버로 댓글 전송
        addComment(userId, diaryPostId, commentContent, isSecret);
    });

    // 답글쓰기 버튼 클릭 시 답글 입력 폼 표시
    $('.replyCommentBtn').click(function() {
        const replyForm = $(this).parent().next('.reply_form');
        replyForm.toggle(); // 토글 기능
    });

    // 답글 달기 버튼 클릭 시 서버로 답글 전송
    $('.submit_reply').click(function() {
        const replyForm = $(this).parent();
        const replyContent = replyForm.find('.reply_content').val();
        const parentCommentId = replyForm.closest('.comment').data('comment-id');
        const diaryPostId = $('meta[name="diary-post-id"]').attr('content');
        const userId = $('meta[name="user-id"]').attr('content');

        if (replyContent) {
            // 서버로 AJAX 요청 보내기
            addComment(userId, diaryPostId, replyContent, false, parentCommentId);
        } else {
            alert('답글 내용을 입력하세요.');
        }
    });

    // 댓글 수정
    $('.editCommentBtn').click(function() {
        const commentId = $(this).data('comment-id');
        const newContent = prompt('댓글을 수정하세요:');
        if (newContent) {
            const userId = $('meta[name="user-id"]').attr('content');
            updateComment(userId, commentId, newContent);
        }
    });

    // 댓글 삭제
    $('.deleteCommentBtn').click(function() {
        const commentId = $(this).data('comment-id');
        const userId = $('meta[name="user-id"]').attr('content');
        if (confirm('정말로 댓글을 삭제하시겠습니까?')) {
            deleteComment(userId, commentId);
        }
    });
});

// 댓글 추가
function addComment(userId, diaryPostId, commentContent, isSecret, parentCommentId = 0) {
    console.log(userId);
    console.log(diaryPostId);
    console.log(commentContent);
    console.log(isSecret);
    console.log(parentCommentId);
    const isSecretValue = isSecret ? 1 : 0;
    $.ajax({
    
        url: '/mydiary/comments/add',
        type: 'POST',
        dataType: 'text',
        data: {
            "diaryCommentContent": commentContent,
            "isSecret": isSecretValue,
            "diaryPostId": diaryPostId,
            "parentCommentId": parentCommentId,
            "diaryCommentUserIdWrite": userId,
            "status": "ACTIVE"
        },
        success: function(data) {
            if (data=='success') {
                alert('댓글이 추가되었습니다.');
               location.href = '/mydiary/' + userId+   '/diarydetail/' + diaryPostId;

            } else {
                alert('댓글 추가 중 오류가 발생했습니다.');
            }
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
};

// 댓글 수정
function updateComment(userId, commentId, newContent) {
    $.ajax({
        url: `/mydiary/${userId}/comments/update`,
        method: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify({
            id: commentId,
            commentContent: newContent,
            userId: userId
        }),
        success: function(data) {
            if (data.success) {
                alert('댓글이 수정되었습니다.');
                location.reload(); // 페이지 새로고침하여 댓글 목록 업데이트
            } else {
                alert('댓글 수정 중 오류가 발생했습니다.');
            }
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}

// 댓글 삭제
function deleteComment(userId, commentId) {
    $.ajax({
        url: `/mydiary/${userId}/comments/delete/${commentId}`,
        method: 'DELETE',
        success: function(data) {
            if (data.success) {
                alert('댓글이 삭제되었습니다.');
                location.reload(); // 페이지 새로고침하여 댓글 목록 업데이트
            } else {
                alert('댓글 삭제 중 오류가 발생했습니다.');
            }
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
};
