$(document).ready(function() {
    const userId = $('meta[name="user-id"]').attr('content');
    const postId = $('meta[name="post-id"]').attr('content');
 	console.log('커뮤니티 디테일User ID:', userId); 
    // 게시글 수정 버튼 기능 추가
    $('.editPostBtn').click(function() {
        const postId = $(this).data('post-id');
        const editUrl = `/community/post/edit/${postId}`;
        window.location.href = editUrl;  // 수정 페이지로 이동
    });

    // 수정 폼 제출 처리
    $('#community-post-form').on('submit', function(event) {
        event.preventDefault();
        const postId = $(this).find('input[name="postId"]').val();
        const formData = $(this).serialize();

        $.ajax({
            type: 'POST',
            url: `/community/post/update/${postId}`,
            data: formData,
            success: function(response) {
                window.location.href = `/community/board/${response.boardId}`; 
            },
            error: function(xhr) {
                alert("수정 중 오류가 발생했습니다: " + xhr.responseText);
            }
        });
    });

    // 게시글 삭제 버튼 기능 추가
    $('.deletePostBtn').click(function() {
        const postId = $(this).data('post-id');
        const boardId = $('meta[name="board-id"]').attr('content');
        console.log("Board ID: ", boardId);

        if (confirm("정말로 게시글을 삭제하시겠습니까?")) {
            $.ajax({
                type: 'POST',
                url: '/community/post/delete/' + postId,
                data: { boardId: boardId },
                success: function() {
                    alert("삭제되었습니다.");
                    window.location.href = '/community/board/' + boardId;
                },
                error: function(xhr) {
                    alert("오류가 발생했습니다: " + xhr.responseText);
                }
            });
        }
    });
      $('.like-btn').each(function() {
  $.ajax({
        url: '/community/like/status',
        type: 'GET',
        data: { userId: userId, postId: postId },
        success: function(response) {
            const likeBtn = $('.like-btn');
            if (response.isLiked) {
                likeBtn.html('❤️ 좋아요 ' + response.likeCount);
                likeBtn.data('liked', true);  // 좋아요 상태 저장
            } else {
                likeBtn.html('🤍 좋아요 ' + response.likeCount);
                likeBtn.data('liked', false);  // 좋아요 상태 저장
            }
        },
        error: function() {
            alert('좋아요 상태를 불러오지 못했습니다.');
        }
         });
    });

 // 좋아요 버튼 클릭 이벤트
    $('.like-btn').click(function() {
        const likeBtn = $(this);
        const postId = likeBtn.data('post-id');
        const isLiked = likeBtn.data('liked');  // 현재 좋아요 상태 확인

        // 서버에 좋아요/취소 요청
        $.ajax({
            url: `/community/like/post/${postId}`,
            type: 'POST',
            data: { userId: userId },
            success: function(response) {
                // 좋아요 상태에 따른 UI 업데이트
                if (response.status === 'liked') {
                    likeBtn.html('❤️ 좋아요 ' + response.likeCount);
                    likeBtn.data('liked', true);  // 상태 변경
                } else {
                    likeBtn.html('🤍 좋아요 ' + response.likeCount);
                    likeBtn.data('liked', false);  // 상태 변경
                }
            },
            error: function() {
                alert('좋아요 처리 중 오류가 발생했습니다.');
            }
        });
    });



});
