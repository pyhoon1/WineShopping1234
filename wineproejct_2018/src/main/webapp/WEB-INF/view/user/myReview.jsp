<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<td>주문번호</td>
							<td>구매상품</td>
							<td>리뷰</td>
							<td>결제금액</td>
							<td>등록일자</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>15</td>
							<td><strong>[론 Rhone]</strong> <strong>베르나르 마그레즈
									Bernard Magrez</strong> <span>외 2</span></td>
							<td>실망시키지 않는 마그레즈네요 많이 파시고 번창하세요 감사합니다.</td>
							<td>69,000 원</td>
							<td>2018.10.23</td>
						</tr>
						<tr>
							<td>15</td>
							<td><strong>[론 Rhone]</strong> <strong>베르나르 마그레즈
									Bernard Magrez</strong> <span>외 2</span></td>
							<td>실망시키지 않는 마그레즈네요 많이 파시고 번창하세요 감사합니다.</td>
							<td>69,000 원</td>
							<td>2018.10.23</td>
						</tr>
						<tr>
							<td>15</td>
							<td><strong>[론 Rhone]</strong> <strong>베르나르 마그레즈
									Bernard Magrez</strong> <span>외 2</span></td>
							<td>실망시키지 않는 마그레즈네요 많이 파시고 번창하세요 감사합니다.</td>
							<td>69,000 원</td>
							<td>2018.10.23</td>
						</tr>
						<tr>
							<td>15</td>
							<td><strong>[론 Rhone]</strong> <strong>베르나르 마그레즈
									Bernard Magrez</strong> <span>외 2</span></td>
							<td>실망시키지 않는 마그레즈네요 많이 파시고 번창하세요 감사합니다.</td>
							<td>69,000 원</td>
							<td>2018.10.23</td>
						</tr>
						<tr>
							<td>15</td>
							<td><strong>[론 Rhone]</strong> <strong>베르나르 마그레즈
									Bernard Magrez</strong> <span>외 2</span></td>
							<td>실망시키지 않는 마그레즈네요 많이 파시고 번창하세요 감사합니다.</td>
							<td>69,000 원</td>
							<td>2018.10.23</td>
						</tr>
					</tbody>

				</table>




				<!--페이지 마마 공통적으로 겹치는 페이징 부분  -->
				<div class="paging">
					<i class="fas fa-caret-left"></i> <span> <a href="#">1</a> <a
						href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
					</span> <i class="fas fa-caret-right"></i>
				</div>
			</div>
		</div>
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>