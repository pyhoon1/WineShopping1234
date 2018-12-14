$(function(){
    $('#myForm').submit(function(e){
        var phoneNumber = $('input[name="phone"]').val();
        var email = $('input[name="email"]').val();
        
        e.preventDefault();
        var phoneRegex =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
        var emailRegex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

        if(!$('input[name="name"]').val()){
            alert("이름을 입력해주세요.");
            return false;
        }
        if(!$('input[name="loginId"]').val()){
            alert("아이디를 입력해주세요");
            return false;
        }
        if(!$('input[name="password"]').val()){
            alert("비밀번호를 입력해주세요.");
            return false;
        }
        if(!$('input[name="passwordConfirm"]').val()){
            alert("비밀번호 확인을 입력해주세요.");
            return false;
        }
        if($('input[name="password]').val() != $('input[name="passwordConfirm"]').val()){
            alert("비밀번호 확인이 다릅니다.")
            return false;   
        }
        if(!$('input[name=birth]').val()){
            alert("생년월일을 선택해주세요.")
            return false;
        }
        if(!$('#post').val() || !$('#addr1').val() || !$('addr2').val()){
            alert("주소를 입력해주세요.")
            return false;
        }
        if(!email || !emailRegex.test(email)){
            alert("이메일을 다시 입력해주세요.");
            return false;
        } 
        else if(!phoneNumber || !phoneRegex.test(phoneNumber)){
            alert("전화번호를 다시 입력해주세요.");
            return false;
        } else {
            return true;
        }
    })

    $('#back').click(function(){
        window.history.back();
    })
});