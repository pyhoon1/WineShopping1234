<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<h1>Welcome to admin page!</h1>
		<div class="nav">
			<ul>
				<li id="user"><a href="adminUser.do?pageNum=1">유저 관리</a></li>
				<li id="product"><a href="adminProduct.do?pageNum=1">상품 관리</a></li>
				<li id="product"><a href="adminMatchFood.do?pageNum=1">잘 맞는
						음식 관리</a></li>
				<li id="review"><a href="adminReview.do?pageNum=1">리뷰 관리</a></li>
				<li id="payment"><a href="adminPayment.do?pageNum=1">구매 내역
						관리</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="payment-list">
				<table>
					<thead>

						<tr>
							<td>사용자 아이디</td>
							<td>상품명</td>
							<td>구매 개수</td>
							<td>부가 상품 명</td>
							<td>결제 방법</td>
							<td>결제 일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="payment" items="${paymentPage.paymentList}">
							<tr> 
								<td>${payment.userId }</td>
								<td>${payment.productName}</td>
								<td>${payment.productCount }</td>
								<c:set value="matchFoodList${payment.paymentId}"
									var="matchFoodList" />
								<c:forEach var="matchFood"
									items="${requestScope[matchFoodList]}">
									<td>${matchFood.matchFoodName }</td>
								</c:forEach>
								<td>${payment.method}</td>
								<td><fmt:parseDate value="${payment.pDay }"
										var="noticePostDate" pattern="yyyy-MM-dd'T'HH:mm:ss" /> <fmt:formatDate
										value="${noticePostDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>



					</tbody>
				</table>
				<div class="paging">

					<c:if test="${paymentPage.hasProduct()}">
						<div>
							<c:if test="${paymentPage.startPage > 5 }">
								<a href="adminPayment.do?pageNum=${paymentPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${paymentPage.startPage}"
								end="${paymentPage.endPage }">
								<a href="adminPayment.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${paymentPage.endPage < paymentPage.totalPages }">
								<a href="adminPayment.do?pageNum=${paymentPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</body>
</html>