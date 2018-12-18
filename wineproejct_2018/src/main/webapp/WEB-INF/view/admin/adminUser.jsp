<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Cardo"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function deleteUser(userId, loginId) {

		if (confirm(loginId + "님을 삭제하시겠습니까?")) {
			var information = {
				'userId' : userId

			}
			$.ajax({
				url : 'admindeleteUser.do',
				type : 'POST',
				data : information,
				error : function(error) {
					console.log(error);
				},
				success : function() {
					alert(loginId + "님을 삭제하였습니다.")
					location.href = "adminUserList.do";
				}

			})
		} else {
			return false;
		}

	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<h1>Welcome to admin page!</h1>
		<div class="nav">
			<ul>
				<li id="user"><a href="adminUser.do?pageNum=1">유저 관리</a></li>
				<li id="product"><a href="adminProduct.do?pageNum=1">상품 관리</a></li>
				<li id="product"><a href="adminMatchFood.do?pageNum=1">잘 맞는 음식 관리</a></li>
				<li id="review"><a href="adminReview.do?pageNum=1">리뷰 관리</a></li>
				<li id="payment"><a href="adminPayment.do?pageNum=1">구매 내역 관리</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="user-list">
				<table>
					<thead>
						<tr>
							<td>유저 번호</td>
							<td>유저 아이디</td>
							<td>이메일</td>
							<td>주소</td>
							<td>전화번호</td>
							<td>생년월일</td>
							<td>회원 등급</td>
							<td>총액</td>
							<td>가입일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user1" items="${usertPage.userList }">
							<tr>
								<td>${user1.userId}</td>
								<td>${user1.loginId }</td>
								<td>${user1.email }</td>
								<td>${user1.address }</td>
								<td>${user1.phone}</td>
								<td>${user1.birth }</td>
								<td>${user1.rating}</td>
								<td>${user1.totalAmount }</td>
								<td>${user1.wdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging">
					<c:if test="${usertPage.hasProduct()}">
						<div>
							<a href="adminUser.do?pageNum=1" class="pageNum">처음</a>

							<c:if test="${usertPage.startPage > 5 }">
								<a href="adminUser.do?pageNum=${usertPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${usertPage.startPage}"
								end="${usertPage.endPage }">
								<a href="adminUser.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${usertPage.endPage < usertPage.totalPages }">
								<a href="adminUser.do?pageNum=${usertPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>

							<a href="adminUser.do?pageNum=${usertPage.totalPages }"
								class="pageNum">마지막</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>