<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Cardo"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/userPop.css">
<script src="./javascript/userPop.js"></script>
<title>Insert title here</title>
</head>
<body> 
<c:set value="${userId}" var="userId"/>
	<div class="wrapper">
		<div class="buttons">
			<button id="receipt">구매 내역 보기</button>
			<button id="review">쓴 리뷰 보기</button>
		</div>
		<div class="receipt">
			<div class="title">
				<h2>구매 내역</h2>
				<i class="fas fa-times" id="receipt-close"></i>
			</div>
			<table>
				<thead>
					<tr>
						<td>상품 이름</td>
						<td>상품 가격</td>
						<td>상품 갯수</td>
						<td>날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${paymentPage.paymentList}" var="payment">
						<tr>
							<td>${payment.productName}</td>
							<td>${payment.price }</td>
							<td>${payment.productPrice}</td>
							<td>${payment.pDay }</td>
							<td></td>
						</tr>			
					</c:forEach>
				</tbody>
			</table>
			<div class="paging">
				<c:if test="${paymentPage.hasProduct()}">
						<div>
							<c:if test="${paymentPage.startPage > 5 }">
								<a href="userPaymentPopup.do?pageNum=${paymentPage.startPage - 5  }&userId=${userId}"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${paymentPage.startPage}"
								end="${paymentPage.endPage }">
								<a href="userPaymentPopup.do?pageNum=${pageNum}&userId=${userId}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${paymentPage.endPage < paymentPage.totalPages }">
								<a href="userPaymentPopup.do?pageNum=${paymentPage.startPage + 5 }&userId=${userId}"
									class="pageNum">다음</a>
							</c:if>
						</div>
					</c:if>
	
			</div>
		</div>
		<div class='review'>
			<div class="title">
				<h2>쓴 리뷰 내역</h2>
				<i class="fas fa-times" id="review-close"></i>
			</div>
			<table>
				<thead>
					<tr>
						<td>상품 코드</td>
						<td>리뷰 내용</td>
						<td>날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reviewPage.reviewList}" var="review">
						<tr>
							<td>${review.productId}</td>
							<td>${review.content }</td>
							<td>${review.wdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="paging">
				<c:if test="${reviewPage.hasProduct()}">
						<div>
							<c:if test="${reviewPage.startPage > 5 }">
								<a href="userReviewPopup.do?pageNum=${reviewPage.startPage - 5  }&userId=${userId}"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${reviewPage.startPage}"
								end="${reviewPage.endPage }">
								<a href="userReviewPopup.do?pageNum=${pageNum}&userId=${userId}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${reviewPage.endPage < reviewPage.totalPages }">
								<a href="userReviewPopupt.do?pageNum=${reviewPage.startPage + 5 }&userId=${userId}"
									class="pageNum">다음</a>
							</c:if>
						</div>
					</c:if>
			</div>
		</div>
	</div>
</body>
</html>