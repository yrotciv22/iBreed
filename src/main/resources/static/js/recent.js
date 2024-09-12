/**
 *   
 */

 $(document).ready(function() {
 		//alert(typeof(viewedProducts));
 		//$('#recentPrd').prop("href", "<c:url value='/mypage/recentPrdList/" + viewedProducts + "'/>");
 	    //$('#recentPrd').prop("href", "/mypage/recentPrdList/'" + viewedProducts +"'");
 		/*		
 		$('#recentProducts').on("click", function() {
 			alert("bb");
 			event.preventDefault();
 			let viewedProducts  = localStorage.getItem("viewedProducts"); 			
 			
	 		let form = $('#myform');
	 		let formData = new FormData(form[0]);
	 		formData.append('viewedProducts', viewedProducts);
	 		form.action = '/mypage/recentPrdList';
			form.mothod = 'POST';
			form.submit();
		});
		*/
		
	$('#recentProducts').on("click", function() { 			
		event.preventDefault();
	    let  viewedProducts = localStorage.getItem("viewedProducts");
		
		$.ajax({
 			type:"post",
 			url:"/mypage/recentPrdList", 
 			data : {"viewedProducts": viewedProducts},
 			dataType:'text',
 			success:function(result) {
 				$('body').html(result);
 			},
 			error:function() {
 				console.log("실패");
 			}
 		});
	});
 });