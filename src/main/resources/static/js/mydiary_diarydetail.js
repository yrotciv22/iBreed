document.addEventListener("DOMContentLoaded", function() {
    const deleteButtons = document.querySelectorAll(".deleteBtn");
    const editButtons = document.querySelectorAll(".editBtn");
	
	
    deleteButtons.forEach(button => {
        button.addEventListener("click", function() {
         	
            const diaryPostId = this.getAttribute("data-diary-id");
			const deleteUrl = "<c:url value='/mydiary/${sessionScope.user_id}/deleteDiary'/>"; // 삭제 URL
			
		 if (confirm("일기를 삭제하시겠습니까?")) {
                $.ajax({
                    type: "POST",
                    url: deleteUrl,  
                    data: { diaryPostId: diaryPostId },
                    success: function(response) {
                        alert('일기가 삭제되었습니다.');
                        window.location.href = "<c:url value='/mydiary/${sessionScope.user_id}/diary'/>";  // 성공 시 리스트 페이지로 이동
                    },
                    error: function(xhr, status, error) {
                        alert('일기삭제에 실패했습니다: ' + error);
                    }
                });
            }
        });
    });

    editButtons.forEach(button => {
        button.addEventListener("click", function() {
            const diaryPostId = this.getAttribute("data-diary-id");
            window.location.href = "<c:url value='/mydiary/${sessionScope.user_id}/diarywrite?diaryPostId="+ diaryPostId+"'/>";
        });
    });
});