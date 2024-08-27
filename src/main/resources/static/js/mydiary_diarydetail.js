document.addEventListener("DOMContentLoaded", function() {
    const deleteButtons = document.querySelectorAll(".deleteBtn");
    const editButtons = document.querySelectorAll(".editBtn");
    const userId = document.querySelector('meta[name="user-id"]').getAttribute('content');  // Meta 태그에서 userId를 가져옴

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

    editButtons.forEach(button => {
        button.addEventListener("click", function(event) {
            event.preventDefault();
            const diaryPostId = this.getAttribute("data-diary-id");
            window.location.href = `/mydiary/${userId}/diaryedit/${diaryPostId}`;  // 수정 페이지로 이동
        });
    });
});
