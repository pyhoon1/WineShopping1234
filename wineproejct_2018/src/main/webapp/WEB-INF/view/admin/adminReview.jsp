<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	/* function warningReview(state, reviewId, userId) {
		var information = {
			'state' : state,
			'reviewId' : reviewId,
			'userId' : userId
		}
		$.ajax({
			url : 'warningReview.do',
			type : 'POST',
			dataType : 'text',
			data : information,
			error : function(error) {
				console.log(error);
			},
			success : function() {
				location.href = "adminReviewList.do";
			}

		})

	} */
	function deleteReview(reviewId) {
		if (confirm("이 리뷰를 삭제하겠습니까?")) {
			var information = {
				'reviewId' : reviewId,
				'pageNum' : 1
			}
			$.ajax({
				url : 'deleteReview.do',
				type : 'POST',
				data : information,
				error : function(error) {
					console.log(error);
				},
				success : function() {
					location.href = "adminReview.do?pageNum=1"
				}

			})
		} else {
			return false;
		}

	}
</script>
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
			<div class="review-list">
				<table>
					<thead>
						<tr>
							<td>리뷰 아이디</td>
							<td>상품 코드</td>
							<td>상품 명</td>
							<td>유저 아이디</td>
							<td>내용</td>
							<td>작성일</td>
							<td>활성화 여부</td>
							<td>리뷰 삭제</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${reviewPage.reviewList}">
							<tr>
								<td>${review.reviewId}</td>
								<td>${review.productId}</td>
								<td>${review.productName}</td>
								<td>${review.loginId }</td>
								<td>${review.content}</td>
								<td><fmt:parseDate value="${review.wdate }" var="noticePostDate" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
								<fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/></td>
								<td>${review.state }</td>
								<td><input type="button" onclick="deleteReview('${review.reviewId}')" value="리뷰 삭제"></td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
				<div class="paging">

					<c:if test="${reviewPage.hasProduct()}">
						<div>
							<c:if test="${reviewPage.startPage > 5 }">
								<a href="adminReview.do?pageNum=${reviewPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${reviewPage.startPage}"
								end="${reviewPage.endPage }">
								<a href="adminReview.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${reviewPage.endPage < reviewPage.totalPages }">
								<a href="adminReview.do?pageNum=${reviewPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>