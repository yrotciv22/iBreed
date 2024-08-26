//일기 상세보기페ㅣ지


document.addEventListener("DOMContentLoaded", function() {
    const deleteButtons = document.querySelectorAll(".deleteBtn");
    const editButtons = document.querySelectorAll(".editBtn");

    deleteButtons.forEach(button => {
        button.addEventListener("click", function(event) {
            event.preventDefault();  // 링크 기본 동작을 막음
            const diaryPostId = this.getAttribute("data-diary-id");
            if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
                $.ajax({
                    type: "POST",
                    url: "<c:url value='/mydiary/${sessionScope.user_id}/deleteDiary'/>",
                    data: {
                        diaryPostId: diaryPostId
                    },
                    success: function(response) {
                        if (response === "success") {
                            alert("게시글이 삭제되었습니다.");
                            window.location.href = "<c:url value='/mydiary/${sessionScope.user_id}/diary'/>";
                        } else {
                            alert("게시글 삭제 중 오류가 발생했습니다.");
                        }
                    },
                    error: function() {
                        alert("게시글 삭제 중 오류가 발생했습니다.");
                    }
                });
            }
        });
    });

    editButtons.forEach(button => {
        button.addEventListener("click", function(event) {
            event.preventDefault();  // 링크 기본 동작을 막음
            const diaryPostId = this.getAttribute("data-diary-id");
            window.location.href = `<c:url value='/mydiary/${sessionScope.user_id}/diarywrite?diaryPostId=` + diaryPostId + `'/>`;
        });
    });
});
