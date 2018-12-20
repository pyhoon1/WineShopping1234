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
	<c:if test="${errors.duplicateLoginId }">
		<script>
			alert('중복된 아이디입니다.');
			location.href = "signUpForm.do";
		</script>
	</c:if>
	<c:if test="${errors.duplicateEmail }">
		<script>
			alert('중복된 이메일 입니다.')
			location.href = "signUpForm.do";
		</script>
	</c:if>
	<c:if test="${errors.badError }">
		<script>
			alert('예상치 못한 오류가 발생했습니다.')
			location.href = "signUpForm.do";
		</script>
	</c:if>
</body>
</html>