/**
 * 
 */
$(document).ready(function() {

	const prd_id = $('#recent_prdIds').val();

	 function addRecentlyViewedProduct(productId) {
	    let viewedProducts = getCookie("viewedProducts");
	    let viewedList = viewedProducts ? JSON.parse(viewedProducts) : [];
	
	    // 중복된 상품이 있으면 제거
	    viewedList = viewedList.filter(id => id !== productId);
	
	    // 새 상품 추가
	    viewedList.push(productId);
	
	    // 최근 본 상품이 10개를 넘으면 오래된 상품 제거
	    if (viewedList.length > 10) {
	        viewedList.shift();
	    }
	
	    // 쿠키에 저장 (JSON 형태로 저장)
	    document.cookie = "viewedProducts=" + JSON.stringify(viewedList) + ";path=/";
	    
		console.log(document.cookie);
	}

	addRecentlyViewedProduct(prd_id);

	function getCookie(cname) {
	    let name = cname + "=";
	    let decodedCookie = decodeURIComponent(document.cookie);
	    let ca = decodedCookie.split(';');
	    for (let i = 0; i < ca.length; i++) {
	        let c = ca[i];
	        while (c.charAt(0) === ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) === 0) {
	            return c.substring(name.length, c.length);
	        }
	    }
	    return "";
	}
	
	// 쿠키에서 viewedProducts 읽기
	let viewedProducts = getCookie("viewedProducts");
	console.log("쿠키확인용 : "+ viewedProducts);
	
	if (viewedProducts) {
	    // JSON 문자열을 배열로 변환
	    let productIds = JSON.parse(viewedProducts);
	    console.log(productIds); // ["2", "3", "13", "1", "5", "7", "27", "14"]
	    
	    // 만약 숫자로 변환이 필요하다면
	    let numericProductIds = productIds.map(id => parseInt(id, 10));
	    console.log("쿠키왔습니당" + numericProductIds); // [2, 3, 13, 1, 5, 7, 27, 14]
	} else {
	    console.log("viewedProducts 쿠키가 없습니다.");
	}
	

});