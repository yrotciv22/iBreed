$(document).ready(function(){ 
    console.log("shopping_cart.js");

    // 모든 체크박스 초기값 해제 (최초 진입 시)
   // $(".cart_item_checkbox").prop("checked", false);
        const nonSoldOutItems = $(".cart_item_checkbox:not(:disabled)");       
  nonSoldOutItems.prop("checked", true);  // 모든 품절되지 않은 상품을 체크
  
    // 초기값 설정: 총 상품 금액과 배송비 모두 0
    $("#total_cart_price").text("0 ");
    $("#shipping_fee").text("0 ");
    $("#final_payment_amount").text("0 ");
    
    // 상품 가격 계산 함수
    function calculateTotalPrice() {
        let totalCartPrice = 0;

        // 선택된 상품들의 총 가격을 계산
        $(".cart_item_checkbox:checked").each(function() {
            const $item = $(this).closest('.one_item_wrap');
            const priceText = $item.find(".all_prd_price span").text().replace(/[^0-9.-]+/g, "");
            const quantityText = $item.find(".total_count").text().trim();

            const price = parseFloat(priceText) || 0;
            const quantity = parseInt(quantityText) || 0;

            totalCartPrice += price * quantity;
        });

        // 총 상품 금액 업데이트
        $("#total_cart_price").text(totalCartPrice.toLocaleString());

        // 배송비 계산: 총 금액이 30,000원 이하일 경우 3,000원, 그 이상은 무료
        let shippingFee = totalCartPrice > 0 && totalCartPrice < 30000 ? 3000 : 0;
        $("#shipping_fee").text(shippingFee.toLocaleString());

        // 최종 결제 금액 (총 상품 금액 + 배송비)
        const finalPaymentAmount = totalCartPrice + shippingFee;
        $("#final_payment_amount").text(finalPaymentAmount.toLocaleString());
    }

    // 페이지 로드 시 기본 계산 (선택된 상품이 없으면 총 가격 0으로 설정)
    calculateTotalPrice();

    // 체크박스 상태 변경 시마다 총 금액을 다시 계산
    $(".cart_item_checkbox").on("change", function() {
        calculateTotalPrice();
    });

    // 전체 선택 체크박스 처리
    $("#select_all").on("change", function() {
        const isChecked = $(this).is(":checked");
        $(".cart_item_checkbox:not(:disabled)").prop("checked", isChecked);  // 품절 상품은 선택되지 않도록 처리
        calculateTotalPrice();
    });
    // 수량 감소 버튼 클릭 시
    $(".minus_btn a, .plus_btn a").on("click", function(event) {
        event.preventDefault();  // 기본 동작 막기

        const url = $(this).attr("href");  // 수량 변경을 위한 서버 URL
        const $quantityDiv = $(this).closest('.prd_count_btn_box').find(".total_count");

        // AJAX 요청으로 수량 변경 처리
        $.ajax({
            type: "get",
            url: url,
            success: function(response) {
                // 서버에서 새로운 수량을 반환했다고 가정 (response.newQuantity)
                console.log("서버 응답: ", response);  // 서버에서 반환한 값을 콘솔에 출력하여 확인
                if (response.newQuantity !== undefined) {
                    $quantityDiv.text(response.newQuantity);  // 새로운 수량 업데이트
                } else {
                    alert("수량 변경 중 오류가 발생했습니다.");
                }

                calculateTotalPrice();  // 수량 변경 후 금액 다시 계산
            },
            error: function() {
                alert("수량 변경 중 오류가 발생했습니다.");
            }
        });
    });

    // 체크박스 상태에 따라 주문 버튼 활성화/비활성화
    const $checkboxes = $(".cart_item_checkbox:not(:disabled)");
    const $orderSelectedBtn = $("#order_selected_btn");

    function updateOrderButtonState() {
        const isChecked = $checkboxes.is(":checked");

        if (isChecked) {
            $orderSelectedBtn.prop("disabled", false);
            $orderSelectedBtn.css("opacity", "1");
        } else {
            $orderSelectedBtn.prop("disabled", true);
            $orderSelectedBtn.css("opacity", "0.5");
        }
    }

    updateOrderButtonState();

    $checkboxes.on("change", function() {
        updateOrderButtonState();
    });

    // 전체 선택 체크박스 처리
    $("#select_all").on("change", function() {
        const isChecked = $(this).is(":checked");
        $checkboxes.prop("checked", isChecked);
        updateOrderButtonState();
    });

    // 개별 체크박스 상태에 따라 전체 선택 체크박스 제어
    $('.cart_item_checkbox:not(:disabled)').on('click', function() {
        if ($('.cart_item_checkbox:not(:disabled):checked').length === $('.cart_item_checkbox:not(:disabled)').length) {
            $('#select_all').prop('checked', true);
        } else {
            $('#select_all').prop('checked', false);
        }
    });

    // 전체 상품 주문 처리
    const $orderAllBtn = $("#order_all_btn");
    $orderAllBtn.on("click", function(event) {
        event.preventDefault();

        const nonSoldOutItems = $(".cart_item_checkbox:not(:disabled)");       

       //  const selectedProductIds = [];
       //  nonSoldOutItems.each(function() {
       //      selectedProductIds.push($(this).val());
       // });
          
        
 		const selectedProductIds = [];
        const cartQuantities = [];
        const productNames = [];
        const productImages = [];
        const productPrices = [];
        const productDiscounts = [];

        // 선택된 아이템들의 정보를 배열에 저장
        nonSoldOutItems.each(function() {
            selectedProductIds.push($(this).val());
            cartQuantities.push($(this).data("quantity"));  // data-quantity 속성에 수량 저장
            productNames.push($(this).data("name"));         // data-name 속성에 상품명 저장
            productImages.push($(this).data("img"));         // data-img 속성에 이미지 저장
            productPrices.push($(this).data("price"));       // data-price 속성에 가격 저장
            productDiscounts.push($(this).data("discount")); // data-discount 속성에 할인율 저장
        });

           // 최종 결제 금액 및 배송비를 숫자형으로 변환
       // const finalPaymentAmount = $("#final_payment_amount").data("amount");
       // const shippingFee = $("#shipping_fee").data("fee");

        // 로그로 값 확인
      //  console.log("Final Payment Amount (before parse): ", finalPaymentAmount);
      //  console.log("Shipping Fee (before parse): ", shippingFee);

        // 값이 제대로 나오는지 확인 후 변환 시도
     //   const finalPaymentAmountParsed = parseFloat(finalPaymentAmount);
      //  const shippingFeeParsed = parseFloat(shippingFee);
//
     //   console.log("Final Payment Amount (parsed): ", finalPaymentAmountParsed);
     //   console.log("Shipping Fee (parsed): ", shippingFeeParsed);

        const user_id = $("#user_id").val();  // hidden input에서 user_id 가져오기
  		console.log("js의 user_id ", user_id);
  		
        $.ajax({
            type: "POST",
            url: "/shop/ "+ user_id + "/order/all_items",
            // data: { chkArr: selectedProductIds },
              data: {
             product_id: selectedProductIds,
                cart_quantity: cartQuantities,
                product_name: productNames,
                product_img: productImages,
                product_price: productPrices,
                product_discount: productDiscounts
                //,
                //finalPaymentAmount: finalPaymentAmount,
                //shippingFee: shippingFee
                },
            traditional: true,
            success: function(response) {
            
               // window.location.href = response;
                 console.log("response",response);
                    console.log('aaa', "/shop/"+ user_id + "/order");
                window.location.href = "/shop/"+ user_id + "/order";
              
            },
            error: function() {
                alert("주문 중 오류가 발생했습니다.");
            }
        });
    });
    
    
     // 선택 상품 삭제 버튼 클릭 시 체크된 상품들 삭제
    $("#remove_selected_btn").on("click", function(event) {
        event.preventDefault();

        const checkedItems = $(".cart_item_checkbox:checked");
        if (checkedItems.length === 0) {
            alert("삭제할 상품을 선택하세요.");
            return;
        }

        const selectedProductIds = [];
        checkedItems.each(function(i) {
            selectedProductIds.push($(this).val());
        });

        $.ajax({
            type: "POST",
            url: "/cart/delete_selected_item",
            data: { chkArr: selectedProductIds },
            traditional: true,
            success: function(response) {
            console.log("선택 상품 삭제 ",response);
            
                alert("선택된 상품이 삭제되었습니다.");
                 location.reload();  // 페이지 새로고침
            },
            error: function() {
                alert("상품 삭제 중 오류가 발생했습니다.");
            }
        });
    });

    
});
