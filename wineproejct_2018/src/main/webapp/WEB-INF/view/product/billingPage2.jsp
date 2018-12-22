<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/billingPage.css">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
				$("#first").click(
					function() {
						var total = $('#total').val();
						var method = $('input[name=paymentType]:checked').val();
						location.href = "detailPayment.do?userId=${user.userId}&productId=${basket.productId}&productName=${basket.productName}&productPrice=${basket.productPrice}&productCount=${basket.productCount}&productImg=${basket.productImg}&matchFoodIdList=${basket.matchFoodIdList}&matchFoodCount=${basket.matchFoodCount}&total="+${total+3000}+ "&paymentType="+ method+ "&name=${user.userName}";
								})

			})
</script>
</head>
<body>
	<div class="main">
		<jsp:include page="../../header/header.jsp" />
		<div class="content">
			<div class="wrapper">
				<div class="billing-title">
					<h1>주문서</h1>
					<h3>상품이 맞는 지 잘 확인해 주세요.</h3>
				</div>
				<div class="billing-list">
					<table>
						<thead>
							<tr>
								<td><strong>상품 정보</strong></td>
								<td><strong>수량</strong></td>
								<td><strong>가격</strong></td>
							</tr>
						</thead>
						<tbody>
							<tr>

								<td><img src="img/wineImage/pink-wine-1964457_640.jpg"
									alt="">
									<div>
										<strong>${basket.productName } </strong> <span>어울리는 음식:
										</span>


										<c:forEach var="matchFood" items="${matchFoodList}">
											<span>${matchFood.matchFoodName }</span>
											<span>${matchFood.ex }</span>
											<span>${matchFood.count }</span>
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

						</tbody>
					</table>
				</div>

				<div class="client-info">

					<table>
						<thead>
							<tr>
								<td colspan="2">배송 정보</td>
							</tr>
						</thead>
						<tbody>



							<tr>
								<td>수령인*</td>
								<td><input type="text" name="name"
									value="${user.userName }"></td>
							</tr>
							<tr>
								<td>휴대전화*</td>
								<td><input type="text" value="${user.phone }"></td>
							</tr>
							<tr>
								<td>배송지 주소*</td>
								<td><input type="text" id="post" value="${user.address }"><br>
									<input type="text" id='addr1'><br> <input
									type="text" id='addr2'></td>
							</tr>
							<tr>
								<td>배송 메모</td>
								<td><input type="text"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="billing-submit">
					<table>
						<thead>
							<tr>
								<td colspan="2">결제 수단</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>일반 결제</td>
								<td><label><input type="radio" name="paymentType"
										value="신용카드">신용카드</label> <label><input type="radio"
										name="paymentType" value="휴대폰">휴대폰</label></td>
							</tr>
							<tr>
								<td>스마일페이 결제</td>
								<td><label><input type="radio" name="paymentType"
										value="스마트페이">스마트 페이</label></td>
							</tr>
							<tr>
								<td>네이버페이 결제</td>
								<td><label><input type="radio" name="paymentType"
										value="네이버페이">네이버 페이</label></td>
							</tr>
							<tr>
								<td>계좌 이체</td>
								<td><label><input type="radio" name="paymentType"
										value="계좌이체">계좌 이체</label></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="billing-total">
					<table>
						<tr>
							<td>상품 금액</td>
							<td>${total }</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td>3000</td>
						</tr>
						<hr id="line">
						<tr>
							<td>상품 금액</td>
							<td><input type="hidden" name="total" value="${total + 3000 }" id="total">${total + 3000 }"</td>
						</tr>
					</table>
				</div>
				<div class="billing-buttons">
					<button id="first">구매하기</button>
					<button onClick="location.href='#'" id="last">취소</button>
				</div>
			</div>
		</div>

		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>