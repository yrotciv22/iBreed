/**
 * detail_photo.jsp
 */
 
 $(function() {
 
 // 삭제모달
	let detailBox = $('.detail_modal');
   
	$('.albumBox').each(function(i) {
		$(this).on('click', function() {
			detailBox[i].style.display = 'flex';
		});
	});
	
	$('.detailBtn').each(function(i) {
		$(this).on('click', function() {
			detailBox[i].style.display = 'flex';
		});
	});
	

});