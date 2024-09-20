$(document).ready(function(){
    console.log("order.js");

    // 체크박스 상태 업데이트 함수
    function updateCheckAll() {
        const allChecked = $('#check1, #check2, #check3').toArray().every(checkbox => checkbox.checked);
        $('#checkAll').prop('checked', allChecked);
    }

    // 개별 체크박스가 변경될 때 전체 체크박스 상태 업데이트
    $('#check1, #check2, #check3').on('change', updateCheckAll);

    // 전체 체크박스를 클릭했을 때 모든 개별 체크박스의 상태 변경
    $('#checkAll').on('click', function() {
        const isChecked = this.checked;
        $('#check1, #check2, #check3').prop('checked', isChecked);
    });

    // 결제 버튼 클릭 이벤트
    $('#final_order_btn').on('click', function(event) {
        // 모든 체크박스가 체크되었는지 확인
        const allChecked = $('#check1, #check2, #check3').toArray().every(checkbox => checkbox.checked);

        if (allChecked) {
            // 모두 체크되었으면 결제 페이지로 이동
           // window.location.href = '/shop/order_confirm';
              $('#orderForm').submit();
        } else {
            // 체크박스 중 하나라도 체크되지 않았을 때 알림 표시
            alert('모든 필수 항목에 동의해야 결제하실 수 있습니다.');
            event.preventDefault(); // 페이지 이동 막기
        }
    });
});
