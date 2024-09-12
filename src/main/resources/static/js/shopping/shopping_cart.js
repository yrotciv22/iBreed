/**
 * 
 */
 
 $(document).ready(function(){
 
 console.log("shopping_cart.js");
 
        $('#select_all').on('click', function() {
            $('.cart_item_checkbox').prop('checked', this.checked);
        });


        $('.cart_item_checkbox').on('click', function() {
            if ($('.cart_item_checkbox:checked').length === $('.cart_item_checkbox').length) {
                $('#select_all').prop('checked', true);  // 모든 체크박스가 체크된 경우 전체 선택 체크박스를 체크
            } else {
                $('#select_all').prop('checked', false);  // 하나라도 체크되지 않은 경우 전체 선택 체크박스 해제
            }
        });
 
 });