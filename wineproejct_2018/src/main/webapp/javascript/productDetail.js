$(function() {
	// 수량 늘리기/줄이기

	// 리뷰 글자 수 제한
	var maxLength = 30;

	$('#review-input').on('keyup', function() {
		var textLength = $('#review-input').val().length;
		if ($(this).val().length > 50) {
			$(this).val($(this).val().substring(0, 50))
		}
	})

	var submitCount = 0;
	$('#review-submit').click(function() {
		if (submitCount > 0) {
			console.log(submitCount)
			return false;
		} else {
			console.log(submitCount)
			submitCount += 1;
			return true;
		}
	})
})