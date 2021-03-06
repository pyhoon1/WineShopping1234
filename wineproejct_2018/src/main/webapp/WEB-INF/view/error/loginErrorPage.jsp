<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${errors.noLoginId }">
		<script>
			alert('아이디가 없습니다. 회원가입을 해주세요.');
			location.href = "main.do";
		</script>
	</c:if>
	<c:if test="${errors.wrongPassword }">
		<script>
			alert('비밀번호를 잘못 입력하셨습니다.')
			location.href = "main.do";
		</script>
	</c:if>
	<c:if test="${errors.noConfirm }">
		<script>
			alert('이메일 확인을 해주세요.')
			location.href = "main.do";
		</script>
	</c:if>
	<c:if test="${errors.badError }">
		<script>
			alert('예상치 못한 오류가 발생했습니다.')
			location.href = "main.do";
		</script>
	</c:if>
</body>
</html>