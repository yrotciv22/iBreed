/**
 * myPage_wishList
 */
 
$(document).ready(function() {
    // 전체 선택/해제
    $(".allCheck").on("change", function() {
        $(".chk").prop("checked", $(this).prop("checked"));
    });

    // 선택된 상품 삭제 버튼 클릭 시
    $("#remove_selected_btn").on("click", function() {
        let selectedItems = [];

        // 체크된 항목들의 product_id를 배열에 저장
        $(".chk:checked").each(function() {
            const productId = $(this).closest(".one_item_wrap").data("product-id");
            selectedItems.push(productId);
        });

        // 체크된 항목이 없는 경우 경고 메시지
        if (selectedItems.length === 0) {
            alert("삭제할 상품을 선택하세요.");
            return;
        }

        // AJAX 요청을 통해 선택된 항목들 서버에 전송 및 삭제 처리
        $.ajax({
            url: '/mypage/removeSelectedItems',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ selectedItems: selectedItems }),
            success: function(response) {
                if (response.success) {
                    alert("선택된 상품이 삭제되었습니다.");
                    location.reload(); // 페이지 새로고침
                } else {
                    alert("삭제 중 오류가 발생했습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("서버 오류가 발생했습니다.");
            }
        });
    });

    // 개별 삭제 버튼 클릭 시
    $(".prd_delete_btn").on("click", function() {
        const productId = $(this).closest(".one_item_wrap").data("product-id");

        // AJAX 요청을 통해 해당 항목 삭제
        $.ajax({
            url: '/mypage/removeItem',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ productId: productId }),
            success: function(response) {
                if (response.success) {
                    alert("상품이 삭제되었습니다.");
                    location.reload(); // 페이지 새로고침
                } else {
                    alert("삭제 중 오류가 발생했습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("서버 오류가 발생했습니다.");
            }
        });
    });
});
