document.addEventListener("DOMContentLoaded", function() {
    const deleteButtons = document.querySelectorAll(".deleteBtn");
    const editButtons = document.querySelectorAll(".editBtn");
 const likeButtons = document.querySelectorAll('.like_button');
    const userId = document.querySelector('meta[name="user-id"]').getAttribute('content');  // Meta 태그에서 userId를 가져옴

    // 삭제 버튼 기능 추가
    deleteButtons.forEach(button => {
        button.addEventListener("click", function(event) {
            event.preventDefault();
            const diaryPostId = this.getAttribute("data-diary-id");

            if (confirm("일기를 삭제하시겠습니까?")) {
                const deleteUrl = `/mydiary/${userId}/diarydelete/${diaryPostId}`;
                window.location.href = deleteUrl; 
                alert('일기가 삭제되었습니다.');
            }
        });
    });

    // 수정 버튼 기능 추가
    editButtons.forEach(button => {
        button.addEventListener("click", function(event) {
            event.preventDefault();
            const diaryPostId = this.getAttribute("data-diary-id");
            window.location.href = `/mydiary/${userId}/diaryedit/${diaryPostId}`;  // 수정 페이지로 이동
        });
    });

    // 좋아요 버튼 기능 추가
   likeButtons.forEach(button => {
    button.addEventListener('click', function() {
        const diaryPostId = this.dataset.diaryPostId; // 게시글 ID를 가져옴

        fetch(`/mydiary/${userId}/like`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                diaryPostId: diaryPostId,
                userId: userId
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 성공적으로 좋아요가 처리되었으면 UI 업데이트
                this.innerHTML = `좋아요 ${data.newLikeCount}`;
            } else {
                alert('좋아요 처리에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
});
});
