<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<form action="deleteUser.do" method="post">
			<input type="hidden" value="${user.userId }" name="userId">
			<table>
				<tr>
					<td>비밀번호 확인</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="password" placeholder="비밀번호 확인">
						<input type="submit" value="확인">
						
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>