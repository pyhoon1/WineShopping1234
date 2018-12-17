<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="${pageContext.request.contextPath }/javascript/admin.js"></script>
<title>Insert title here</title>
</head>
<body oncontextmenu="return false">
	<div class="wrapper">
		<h1>Welcome to admin page!</h1>
		<div class="nav">
			<ul>
				<li id="user">유저 관리</li>
				<li id="product">상품 관리</li>
				<li id="product">잘 맞는 음식 관리</li>
				<li id="review">리뷰 관리</li>
				<li id="payment">구매 내역 관리</li>
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
								<td>${user1.email }</td>
								<td>${user1.address }</td>
								<td>${user1.phone}</td>
								<td>${user1.birth }</td>
								<td>${user1.rating}</td>
								<td>${user1.totalAmount }</td>
								<td>${user1.rating }</td>
								<td>${user1.wdate }</td>
							</tr>
						</c:forEach>


						<%--                         <tr>
                            <td>1</td>
                            <td><a onclick="window.open('userPop.html?userid=${userid}','유저 팝업', 'width=600, height=750, toolvar=no, location=no, resizable=no')">id</a></td>
                            <td>email</td>
                            <td>address</td>
                            <td>phone</td>
                            <td>birth</td>
                            <td>ration</td>
                            <td>totalAmount</td>
                            <td>wdate</td>
                        </tr> --%>

					</tbody>
				</table>
				<div class="paging">
					<c:if test="${usertPage.hasProduct()}">
						<div>
							<a href="admin.do?pageNum=1" class="pageNum">처음</a>

							<c:if test="${usertPage.startPage > 5 }">
								<a href="admin.do?pageNum=${usertPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${usertPage.startPage}"
								end="${usertPage.endPage }">
								<a href="admin.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${usertPage.endPage < usertPage.totalPages }">
								<a href="admin.do?pageNum=${usertPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>

							<a href="admin.do?pageNum=${usertPage.totalPages }"
								class="pageNum">마지막</a>
						</div>
					</c:if>
				</div>
			</div>

			<div class="product-list">
				<table>
					<thead>
						<tr>
							<td>상품 번호</td>
							<td>생산자</td>
							<td>품종</td>
							<td>종류</td>
							<td>상품 명</td>
							<td>설명</td>
							<td>브랜드 설명</td>
							<td>상품 가격</td>
							<td>상품 원산지</td>
							<td>상품 년도</td>
							<td>궁합 좋은 음식 이름</td>
							<td>온도</td>
							<td>도수</td>
							<td>용량</td>
							<td>팔린 갯수</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productPage.productList }">
							<tr>
								<td>${product.productId}</td>
								<td>${product.producer }</td>
								<td>${product.variety }</td>
								<td>${product.wineKinds}</td>
								<td>${product.productName }</td>
								<td>${product.wineEx}</td>
								<td>${product.brandEx }</td>
								<td>${product.price }</td>
								<td>${product.nation }</td>
								<td>${product.year }</td>
								<td>${product.matchFoodName }</td>
								<td>${product.temperature }</td>
								<td>${product.alcohol }</td>
								<td>${product.weight }</td>
								<td>${product.count }</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
				<div class="paging">

					<c:if test="${productPage.hasProduct()}">
						<div>
							<a href="admin.do?pageNum=1" class="pageNum">처음</a>

							<c:if test="${productPage.startPage > 5 }">
								<a href="admin.do?pageNum=${productPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${productPage.startPage}"
								end="${productPage.endPage }">
								<a href="admin.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${productPage.endPage < productPage.totalPages }">
								<a href="admin.do?pageNum=${productPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>

							<a href="admin.do?pageNum=${productPage.totalPages }"
								class="pageNum">마지막</a>
						</div>
					</c:if>

				</div>
			</div>

			<div class="review-list">
				<table>
					<thead>
						<tr>
							<td>리뷰 아이디</td>
							<td>상품 코드</td>
							<td>상품 명</td>
							<td>유저 이름</td>
							<td>유저 아이디</td>
							<td>내용</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${reviewPage.reviewList}">
							<tr>
								<td>${review.reviewId}</td>
								<td>${review.productId }</td>
								<td>${review.productName }</td>
								<td>${review.userName}</td>
								<td>${review.userId }</td>
								<td>${review.content}</td>
								<td>${review.wadte }</td>

							</tr>

						</c:forEach>

					</tbody>
				</table>
				<div class="paging">

					<c:if test="${reviewPage.hasProduct()}">
						<div>
							<a href="admin.do?pageNum=1" class="pageNum">처음</a>

							<c:if test="${reviewPage.startPage > 5 }">
								<a href="admin.do?pageNum=${reviewPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${reviewPage.startPage}"
								end="${reviewPage.endPage }">
								<a href="admin.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${reviewPage.endPage < reviewPage.totalPages }">
								<a href="admin.do?pageNum=${reviewPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>

							<a href="admin.do?pageNum=${reviewPage.totalPages }"
								class="pageNum">마지막</a>
						</div>
					</c:if>

				</div>
			</div>

			<div class="payment-list">
				<table>
					<thead>

						<tr>
							<td>유저 아이디</td>
							<td>상품 아이디</td>
							<td>상품 이름</td>
							<td>상품 가격</td>
							<td>상품 갯수</td>
							<td>작성 일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="payment" items="${paymentPage.paymentList}">
							<tr>
								<td>${payment.paymentId}</td>
								<td>${payment.userId }</td>
								<td>${payment.matchFoodId }</td>
								<td>${payment.productName}</td>
								<td>${payment.productCount }</td>
								<td>${payment.productImg}</td>
								<td>${payment.matchFoodIdList }</td>
								<td>${payment.matchFoodCount }</td>
								<td>${payment.method}</td>
								<td>${payment.pDay }</td>

							</tr>
							<tr>
								<td>paymentId</td>
								<td>userId</td>
								<td>matchFoodId</td>
								<td>productName</td>
								<td>productCount</td>
								<td>productImg</td>
								<td>matchFoodIdList</td>
								<td>matchFoodCount</td>
								<td>method</td>
								<td>pDay</td>
							</tr>
						</c:forEach>



					</tbody>
				</table>
				<div class="paging">

					<c:if test="${paymentPage.hasProduct()}">
						<div>
							<a href="admin.do?pageNum=1" class="pageNum">처음</a>

							<c:if test="${paymentPage.startPage > 5 }">
								<a href="admin.do?pageNum=${paymentPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${paymentPage.startPage}"
								end="${paymentPage.endPage }">
								<a href="admin.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${paymentPage.endPage < paymentPage.totalPages }">
								<a href="admin.do?pageNum=${paymentPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>

							<a href="admin.do?pageNum=${paymentPage.totalPages }"
								class="pageNum">마지막</a>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</div>

</body>
</html>