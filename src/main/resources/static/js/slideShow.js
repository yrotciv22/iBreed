/**
 * slideShow
 */

$(function() {
	
	let moveIndex = 0;
	
	function moveSlide(index) {
		moveIndex = index;
		
		let moveLeft = -(index * 1020);
		$('#slidePanel').animate({'left':moveLeft}, 'slow');
		
		$('.ctrlBtn').attr('src', "../image/hollow_circle.png");
		changeCtrlBtn(moveIndex);
	}
	
	function changeCtrlBtn(moveIndex) { 
		let btn = $('.ctrlBtn');
		
		btn[moveIndex].src = '../image/circle.png';
	}

	$('.ctrlBtn').each(function (moveIndex) {
		$(this).on('click', function() {
			moveSlide(moveIndex);
		});
	});

	$('#arrow-L').on('click', function() {
		if(moveIndex != 0) {
			moveIndex--;
		} else {
			moveIndex = 3;
		}
		moveSlide(moveIndex);
	});
	
	$('#arrow-R').on('click', function() {
		if(moveIndex != 3) {
			moveIndex++;
		} else {
			moveIndex = 0;
		}
		moveSlide(moveIndex);
	});
	
	
	
	$('#slideShow').hover(
	function() {
		$('#arrow-R').css({'opacity':'50%', 'transition':'0.3s ease-out'});
		$('#arrow-L').css({'opacity':'50%', 'transition':'0.3s ease-out'});
		
			$('#arrow-R').hover(
				function() {
					$('#arrow-R').css({'opacity':'100%', 'transition':'0.3s ease-out'});
				},
				function() {
					$('#arrow-R').css('opacity', '50%');
				})
				
			$('#arrow-L').hover(
				function() {
					$('#arrow-L').css({'opacity':'100%', 'transition':'0.3s ease-out'});
				},
				function() {
					$('#arrow-L').css('opacity', '50%');
				})
	},
	function() {
		$('#arrow-R').css('opacity', '0%');
		$('#arrow-L').css('opacity', '0%');
	})

	
	let latingIndex = 0;

	function moveRating(index) {
		latingIndex = index;
		let moveLeft;
		
		if(latingIndex == 3) {
			moveLeft = -2160;
		} else {
			moveLeft = -(index*810);
		}
		$('#popularSlide').animate({'left':moveLeft},'fast');
	}
	
	$('#arrow2-R').on('click', function() {
		if(latingIndex == 0) $('#arrow2-L').css('visibility', 'visible');
		if(latingIndex == 2) $('#arrow2-R').css('visibility', 'hidden');

		latingIndex++;
		moveRating(latingIndex);
	})
	
	$('#arrow2-L').on('click', function() {
		if(latingIndex == 1) $('#arrow2-L').css('visibility', 'hidden');
		if(latingIndex == 3) $('#arrow2-R').css('visibility', 'visible');
		
		
		latingIndex--;
		moveRating(latingIndex);
	})


	
});