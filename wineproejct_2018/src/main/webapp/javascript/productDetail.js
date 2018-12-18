$(function() {	
		 // 수량 늘리기/줄이기
	$('.items .plus').click(function(){
        var amount = parseInt($(this).prevAll('input').val());
        amount += 1
        $(this).prevAll('input').val(amount)
        console.log(amount)
    })
    $('.items .minus').click(function(){
        var amount = parseInt($(this).prevAll('input').val());
        if(amount == 0){
            amount = 0
        }else{
            amount -= 1 
        }
        $(this).prevAll('input').val(amount)
        console.log(amount)
    })

    // 와인 수량 늘리기/줄이기
    $('.product-amount .plus').click(function(){
        var amount = parseInt($(this).prevAll('input').val());
        amount += 1
        $(this).prevAll('input').val(amount)
        console.log(amount)
    })
    $('.product-amount .minus').click(function(){
        var amount = parseInt($(this).prevAll('input').val());
        if(amount == 1){
            amount = 1
        }else{
            amount -= 1
        }
        $(this).prevAll('input').val(amount)
        console.log(amount)
    })

    
    // 리뷰 글자 수 제한
    var maxLength = 30;
    
    $('#review-input').on('keyup',function(){
        var textLength = $('#review-input').val().length;
        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50))
        }
    })

    var submitCount = 0;
    $('#review-submit').click(function(){
        if(submitCount > 0){
            console.log(submitCount)
            return false;
        } else {
            console.log(submitCount)
            submitCount += 1;
            return true;
        }
    })
})