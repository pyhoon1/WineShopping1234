<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/myPage.css">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<jsp:include page="../../header/header.jsp" />
		<div class="content">
			<div class="wrapper">
				<h1 id="myP-title">My Page</h1>


				<div class="myP-header">
					<span id="myP-name">${user.userName } 님</span> <span
						class="myP-info"> <a href="">[회원정보변경]</a>
					</span> <span class="myP-info"> <a href="">[삭제]</a>
					</span> <span id="myP-grade">${user.rating }</span> <span
						class="myP-guide"> 고객님의 등급:<br> 다음 등급업까지 남은 구매금액은
						${200000 - user.totalAmount } 원입니다.
					</span>
				</div>

				<div class="btnWrap">
					<ul class="js-nav">
						<li class="myP-btn order"><a
							href="myPage.do?pageNum=1&userId=${user.userId}">주문조회</a></li>
						<li class="myP-btn middleBtn" id="basket"><a
							href="getBasketList.do?userId=${user.userId}">장바구니</a></li>
						<li class="myP-btn" id="review"><a
							href="myReview.do?userId=${user.userId }&pageNum=1">리뷰</a></li>
					</ul>
				</div>


				<div class="orTable">
					<table>
						<thead>
							<tr>
								<td>주문번호</td>
								<td>상품정보</td>
								<td>주문일자</td>
								<td>결제금액</td>
								<td>적립금</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${paymentPage.paymentList }" var="payment">
								<tr>
									<td>${payment.paymentId }</td>
									<td><img src="img/wineImage/pink-wine-1964457_640.jpg"
										alt="">
										<div>
											<strong>${payment.productName } </strong> <span>어울리는
												음식:</span>
											<c:set value="matchFoodList${payment.paymentId}"
												var="matchFoodList" />
											<c:forEach var="matchFood"
												items="${requestScope[matchFoodList]}">
												<span>${matchFood.matchFoodName }</span>
												<span>${matchFood.ex }</span>
											</c:forEach>
										</div></td>
									<td>${payment.pDay }</td>
									<td>${payment.total }</td>
									<td></td>
							</c:forEach>
						</tbody>
					</table>
				</div>
			

				<!--페이지 마마 공통적으로 겹치는 페이징 부분  -->
				<div class="paging">
					<i class="fas fa-caret-left"></i> <span> 
							<c:if test="${paymentPage.hasProduct()}">
					<div>
						<a href="myPage.do?pageNum=1&userId=${user.userId}" class="pageNum">처음</a>

						<c:if test="${paymentPage.startPage > 5 }">
							<a href="myPage.do?pageNum=${paymentPage.startPage - 5  }&userId=${user.userId}"
								class="pageNum">이전</a>
						</c:if>

						<c:forEach var="pageNum" begin="${paymentPage.startPage}"
							end="${paymentPage.endPage }">
							<a href="myPage.do?pageNum=${pageNum}&userId=${user.userId}" class="pageNum">${pageNum}</a>
						</c:forEach>

						<c:if test="${paymentPage.endPage < paymentPage.totalPages }">
							<a href="myPage.do?pageNum=${paymentPage.startPage + 5 }&userId=${user.userId}"
								class="pageNum">다음</a>
						</c:if>

						<a href="myPage.do?pageNum=${paymentPage.totalPages }&userId=${user.userId}" class="pageNum">마지막</a>
					</div>
				</c:if>
					</span> <i class="fas fa-caret-right"></i>
				</div>
			</div>
		</div>
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>