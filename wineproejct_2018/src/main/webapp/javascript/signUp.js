$(function(){
    $('#myForm').submit(function(){
        var phoneNumber = $('input[name="phone"]').val();
        var email = $('input[name="email"]').val();
        
        var dt = new Date();
        var year = dt.getFullYear();
        
        var birth = $('input[name="birth"]').val();
        var my_year = birth.substring(0,4);
        
        var adult_filter = year - parseInt(my_year); 
        
        var phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
        var emailRegex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

        if(!$('input[name="userName"]').val()){
            alert("이름을 입력해주세요.");
            $('input[name="userName"]').focus();
            return false;
        }
        else if(!$('input[name="loginId"]').val()){
            alert("아이디를 입력해주세요");
            $('input[name="loginId"]').focus();
            return false;
        }
        else if(!$('input[name="password"]').val()){
            alert("비밀번호를 입력해주세요.");
            $('input[name="password"]').focus();
            return false;
        }
        else if(!$('input[name="passwordConfirm"]').val()){
            alert("비밀번호 확인을 입력해주세요.");
            $('input[name="passwordConfirm"]').focus();
            return false;
        }
        else if($('input[name="password"]').val() != $('input[name="passwordConfirm"]').val()){
            alert("비밀번호 확인이 다릅니다.")
            $('input[name="passwordConfirm"]').focus();
            return false;   
        }
        else if(!$('input[name="birth"]').val()){
            alert("생년월일을 선택해주세요.")
            $('input[name="birth"]').focus();
            return false;
        }
        else if(!$('input[name="address"]').val()){
            alert("주소를 입력해주세요.")
            $('input[name="address"]').focus();
            return false;
        }
        else if(!email || !emailRegex.test(email)){
            alert("이메일을 다시 입력해주세요.");
            $('input[name="email"]').focus();
            return false;
        } 
        else if(!phoneNumber || !phoneRegex.test(phoneNumber)){
            alert("전화번호를 다시 입력해주세요.");
            $('input[name="phone"]').focus();
            return false;
        }
        else if(adult_filter < 18){
        	alert("미성년자는 가입하실 수 없습니다.");
        	location.reload();
        	return false;
        }
        else {
        	return true;
        }
    })

    $('#back').click(function(){
        window.history.back();
    })
});