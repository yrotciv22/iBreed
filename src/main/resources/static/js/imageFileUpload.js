/**
 * ibreed
 */
 
 $(document).ready(function(){
 	
 	
 	$('#imageFileFrm').on('submit', function() {
 		event.preventDefault();
 		
 		
 		 let formData = new FormData($('#imageFileFrm')[0]); // 방법1
 		
 		let fileName = $('#uploadFile').val().split("\\").pop(); // 파일명만 추출 : apple.png
 		
 		$.ajax({
 			type:"post",
 			url:"/imageUpload",
 			enctype:"multipart/form-data",
 			processData:false,
 			contentType:false,
 			data : formData, 
 			success:function(result) {
 				if(result == "success") {
 					$('#imageBox').html('<img src="/images/' + fileName +
 														 '" width="400" height="300">');
 				} else {
 					alert("실패");
 				}
 			},
 			error:function() {
 				alert("실패");
 			}
 		});
 	});
 
 });