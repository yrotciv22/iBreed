$(document).ready(function() {
 // 댓글 버튼 클릭 이벤트
    $('.comment_button').click(function() {
        $('.diary_comments').toggle(); // 댓글 리스트 열기/닫기
    });
    
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
    //답글취소버튼
        $('.cancel_reply').click(function() {
        $(this).closest('.reply_form').hide(); // 답글 입력 폼 닫기
    });

    // 답글 달기 버튼 클릭 시 서버로 답글 전송
    $('.submit_reply').click(function() {
        const replyForm =  $(this).closest('.reply_form');
        console.log('Reply form:', replyForm);
        const replyContent = replyForm.find('.reply_content').val();
        console.log('Reply content:', replyContent); 
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
     const userId = $('meta[name="user-id"]').attr('content');
        const commentId = $(this).data('comment-id');
     const diaryPostId = $('meta[name="diary-post-id"]').attr('content');
        const newContent = prompt('댓글을 수정하세요:');
          console.log('New comment content:', newContent);
        if (newContent) {
            const userId = $('meta[name="user-id"]').attr('content');
            updateComment(userId, commentId, newContent,diaryPostId);
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
function addComment(userId, diaryPostId, commentContent, isSecret, parentCommentId ) {
    console.log(userId);
    console.log(diaryPostId);
    console.log(commentContent);
    console.log(isSecret);
    console.log(parentCommentId);
    const isSecretValue = isSecret ? 1 : 0;
    const parentId = parentCommentId ? parentCommentId : null;
    
    
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
function updateComment(userId, commentId, newContent,diaryPostId) {
		 console.log('updateComment called with params:');
    console.log('UserId:', userId);
    console.log('CommentId:', commentId);
    console.log('NewContent:', newContent);

    $.ajax({
        url: '/mydiary/comments/update',
        type: 'POST',
        dataType: 'text',
        data: {
            "id": commentId,
            "diaryCommentContent": newContent,
            "user_id": userId,
            "diaryPostId": diaryPostId,
        },
        success: function(data) {
	console.log("data:", data);
            if (data == 'success') {
                alert('댓글이 수정되었습니다.');
               location.href = '/mydiary/' + userId+   '/diarydetail/' + diaryPostId;
            } else {
                alert('댓글 수정 중 오류가 발생했습니다.');
            }
        },
        error: function(xhr, status, error) {
 //       console.log("AJAX Error:", status, error);
  //      console.log("AJAX Error Status:", xhr.status); // HTTP 상태 코드
   // console.log("AJAX Error Response Text:", xhr.responseText); // 서버에서 반환된 응답
    //console.log("AJAX Error:", status, error); // 추가적인 오류 정보
        alert('서버와의 통신 중 오류가 발생했습니다.');
    }
    });
}

// 댓글 삭제
function deleteComment(userId, commentId) {
    $.ajax({
        url: '/mydiary/comments/delete/'+commentId,
        type: 'DELETE',
        success: function(data) {
            if (data=='success') {
                alert('댓글이 삭제되었습니다.');
                location.reload(); // 페이지 새로고침하여 댓글 목록 업데이트
            } else {
                alert('댓글 삭제 중 오류가 발생했습니다.');
            }
        },
        error: function(xhr, status, error) {
            console.log("AJAX Error:", error);
            console.log("AJAX Error Status:", status);
            console.log("AJAX Error Response Text:", xhr.responseText);
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
};
