<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/userBasket.css">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<jsp:include page="../../header/header.jsp" />
		<div class="content">
			<h1 id="myP-title">My Page</h1>


			<div class="myP-header">
				<span id="myP-name">권기오 님</span> <span class="myP-info"><a
					href="">[회원정보변경]</a></span> <span class="myP-info"><a href="">[삭제]</a></span>
				<span id="myP-grade">C</span> <span class="myP-guide"> 고객님의
					등급:<br> 다음 등급업까지 남은 구매금액은 211,320 원입니다.
				</span>
			</div>

			<div class="btnWrap">
				<ul class="js-nav">
					<li class="myP-btn order"><a
						href="myPage.do?userId=${user.userId}&pageNum=1">주문조회</a></li>
					<li class="myP-btn middleBtn" id="basket"><a
						href="getBasketList.do?userId=${user.userId}">장바구니</a></li>
					<li class="myP-btn" id="review"><a
						href="myReview.do?userId=${user.userId }&pageNum=1">리뷰</a></li>
				</ul>
			</div>


			<c:if test="${basketList.isEmpty() }">
				<span>바구니에 상품이 없습니다.</span>
			</c:if>
			<c:if test="${!basketList.isEmpty() }">
				<div class="basketT">
					<table>
						<thead>
							<tr>
								<td>
									<!-- 여백을 주기 위해-->
								</td>
								<td>상품정보</td>
								<td>상품수량</td>
								<td>상품금액</td>
								<td>
									<!-- 삭제 버튼을 담을 여백을 주기 위해-->
								</td>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${basketList }" var="basket">
								<tr>
									<td></td>
									<td><img src="img/wineImage/pink-wine-1964457_640.jpg"
										alt="">
										<div>
											<strong>${basket.productName } </strong> <span>어울리는
												음식:</span>
											<c:set value="matchFoodList${basket.basketId}"
												var="matchFoodList" />
											<c:forEach var="matchFood"
												items="${requestScope[matchFoodList]}">
												<span>${matchFood.matchFoodName }</span>
												<span>${matchFood.ex }</span>
											</c:forEach>
										</div></td>
									<td>${basket.productCount }</td>
									<td>${basket.total }</td>
									<td>
										<p>
											<a
												href="deleteOne.do?userId=${user.userId }&basketId=${basket.basketId}">삭제</a>
										</p>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="payGuide">
					<div>
						<span>상품금액</span> <span>${total }</span>
					</div>
					<span class="operator">+</span>
					<div>
						<span>배송비</span> <span>3,000</span>
					</div>
					<span class="operator">=</span>
					<div>
						<span>결제예정금액</span> <span>${total + 3000 }</span>
					</div>
					<div>
						<a href="billingPage.do?userId=${user.userId}">주문하기</a>
					</div>
				</div>
			</c:if>
		</div>
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>
