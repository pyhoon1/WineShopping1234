<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/userUpdateForm.css">
<script src="${pageContext.request.contextPath }/javascript/signUp.js"></script>
<script>
	function goBack () {
		window.history.back();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<jsp:include page="../../header/header.jsp" />
		<div class="content">
				<form action="updateUser.do" method="post">
					<input type="hidden" value="${user.userId }" name="userId">
				<div class="wrapper">
					<table>
						<tr>
							<td>userName</td>
							<td><input type="text" value="${user.userName }"
								name="userName" readonly></td>
						</tr>

						<tr>
							<td>loginId</td>
							<td><input type="text" value="${user.loginId }"
								name="loginId" readonly></td>
						</tr>
						<tr>
							<td>password*</td>
							<td><input type="text" value="${user.password }"
								name="password"></td>
						</tr>
						<tr>
							<td>email</td>
							<td><input type="text" value="${user.email }" name="email"
								readonly></td>
						</tr>
						<tr>
							<td>address*</td>
							<td><input type="text" value="${user.address }"
								name="address"></td>
						</tr>
						<tr>
							<td>phone</td>
							<td><input type="text" value="${user.phone }" name="phone"
								readonly></td>
						</tr>
						<tr>
							<td>birth</td>
							<td><input type="text" value="${user.birth }" name="birth"
								readonly></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="회원정보수정" id="submit"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="뒤로가기" id="back" onclick="goBack()"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>