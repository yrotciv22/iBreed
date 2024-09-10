/**
 * 최근본상품
 */
 window.onload = function() {
	/**
 * 
 */
 
 // 최근 본 상품
	// 쿠키에 product_id 저장하기
	 function onPageLoda() {
	 	function addRecentlyViewedProduct(productId) {
	    let viewedProducts = getCookie("viewedProducts");
	    let viewedList = viewedProducts ? JSON.parse(viewedProducts) : [];
	
	    // 중복된 상품이 있으면 제거
	    viewedList = viewedList.filter(id => id !== productId);
	
	    // 새 상품 추가
	    viewedList.push(productId);
	
	    // 최근 본 상품이 5개를 넘으면 오래된 상품 제거
	    if (viewedList.length > 5) {
	        viewedList.shift();
	    }
	
	    // 쿠키에 저장 (JSON 형태로 저장)
	    document.cookie = "viewedProducts=" + JSON.stringify(viewedList) + ";path=/";
	}
	
	alert(1);
	addRecentlyViewedProduct(27);
	
	function getCookie(cname) {
	    let name = cname + "=";
	    let decodedCookie = decodeURIComponent(document.cookie);
	    let ca = decodedCookie.split(';');
	    for(let i = 0; i <ca.length; i++) {
	        let c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }
	    return "";
	}
	 }
	 addRecentlyViewedProduct(27);
};