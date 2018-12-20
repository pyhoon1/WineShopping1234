<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/checkMail.css">
<title>메일 확인</title>
</head>
<body>

	<div class="checkMailCon">
		<h1>메일을 확인해주세요.</h1>
		<div class="checkMail">
			<div>
				안녕하세요. 고객님<br> 와인스퀘어를 이용해주셔서 감사합니다.<br> 회원가입때 입력해주신 <strong>이메일
					주소로 회원인증 이메일</strong>이 발송되었습니다.<br> <br> <br> <br>

				<div>
					이메일 인증 절차만 마무리해주시면 회원가입이 완료됩니다.<br> 감사합니다.
				</div>

				인증 이메일이 발송되지 않는다면 쇼핑몰 관리자에게 연락주세요.<br> 관리자 연락처: 070-8765-6678<br>
				잠시후 메인으로 넘어갑니다.....
			</div>
		</div>
	</div>
	<script>
		setTimeout(function() {
			location.href = "main.do"
		}, 5000);
	</script>

</body>
</html>