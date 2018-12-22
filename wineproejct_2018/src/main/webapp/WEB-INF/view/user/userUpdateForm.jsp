<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateUser.do" method="post">
		<input type="hidden" value="${user.userId }" name="userId">
		<table>
			<tr>
				<td>userName</td>
				<td><input type="text" value="${user.userId }" name="userName"></td>
			</tr>

			<tr>
				<td>loginId</td>
				<td><input type="text" value="${user.loginId }"
					name="loginId"></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="text" value="${user.password }"
					name="password"></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="text" value="${user.email }" name="email"></td>
			</tr>
			<tr>
				<td>address</td>
				<td><input type="text" value="${user.address }"
					name="address"></td>
			</tr>
			<tr>
				<td>phone</td>
				<td><input type="text" value="${user.phone }" name="phone"></td>
			</tr>
			<tr>
				<td>birth</td>
				<td><input type="text" value="${user.birth }" name="birth"></td>
			</tr>
			<tr>
				<td><input type="submit" value="회원정보수정"></td>
			</tr>

		</table>
	</form>
</body>
</html>