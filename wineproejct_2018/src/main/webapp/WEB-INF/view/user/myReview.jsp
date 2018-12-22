<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/myReview.css">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<jsp:include page="../../header/header.jsp" />
		<div class="content">
			<div class="wrapper">
				<!--페이지 마마 공통적으로 겹치는 헤더 부분  -->
				<h1 id="myP-title">My Page</h1>
				<h2 id="sub-title">주문조회</h2>

				<div class="myP-header">
					<span id="myP-name">${user.userName }</span> <span class="myP-info"><a
						href="">[회원정보변경]</a></span> <span class="myP-info"><a href="">[삭제]</a></span>
					<span id="myP-grade">${user.rating }</span> <span class="myP-guide">
						고객님의 등급:<br> 다음 등급업까지 남은 구매금액은 ${200000 - user.totalAmount }
						원입니다.
					</span>
				</div>
				<div class="btnWrap">
					<ul class="js-nav">
						<li class="myP-btn order"><a
							href="myPage.do?userId=${user.userId }&pageNum=1">주문조회</a></li>
						<li class="myP-btn middleBtn" id="basket"><a
							href="getBasketList.do?userId=${user.userId}">장바구니</a></li>
						<li class="myP-btn" id="review"><a
							href="myReview.do?userId=${user.userId }&pageNum=1">리뷰</a></li>
					</ul>
				</div>
				<!-- 리뷰 테이블 이전까지 공통적으로 겹치는 부분 -->



				<table class="reTable">
					<thead>
						<tr>
							<td>상품 명</td>
							<td>리뷰내역</td>
							<td>등록일자</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reviewPage.reviewList }" var="review">
							<tr>
								<td>${review.productName}</td>
								<td>${review.content }</td>
								<fmt:parseDate value="${review.wdate}" var="noticePostDate" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
								<td><fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>




				<!--페이지 마마 공통적으로 겹치는 페이징 부분  -->
				<div class="paging">
					<c:if test="${reviewPage.hasProduct()}">
						<div>
							<c:if test="${reviewPage.startPage > 5 }">
								<a href="myReview.do?pageNum=${reviewPage.startPage - 5  }&userId=${user.userId}"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${reviewPage.startPage}"
								end="${reviewPage.endPage }">
								<a href="myReview.do?pageNum=${pageNum}&userId=${user.userId}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${reviewPage.endPage < reviewPage.totalPages }">
								<a href="myReview.do?pageNum=${reviewPage.startPage + 5 }&userId=${user.userId}"
									class="pageNum">다음</a>
							</c:if>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>