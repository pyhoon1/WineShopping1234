
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<script type="text/javascript">
	function MakeMatchFood() {
		location.href = "adminMakeMatchFoodForm.do";
	}
	function MakeWine() {
		location.href = "adminMakeWineForm.do";
	}

	function deleteWine(productId, productName, img) {
		if (confirm(productName + "을 삭제하시겠습니까?")) {
			var information = {
				'productId' : productId,
				'img' : img
			}
			$.ajax({
				url : 'deleteWine.do',
				type : 'post',
				data : information,
				error : function(error) {
					console.log(error);
				},
				success : function() {
					alert('제품을 삭제하였습니다.')
					location.href = "adminProductList.do"
				}
			})
		} else {
			return false;
		}
	}

	function deleteMatchFood(matchFoodId, matchFoodName, img) {
		if (confirm(matchFoodName + "을 삭제하시겠습니까?")) {
			var information = {
				'matchFoodId' : matchFoodId,
				'img' : img
			}
			$.ajax({
				url : 'deleteMatchFood.do',
				type : 'post',
				data : information,
				error : function(error) {
					console.log(error);
				},
				success : function() {
					alert('제품을 삭제하였습니다.')
					location.href = "adminProductList.do"
				}
			})
		} else {
			return false;
		}
	}
</script>
<body>
	<div class="wrapper">
		<h1>Welcome to admin page!</h1>
		<div class="buttons">
            <button><a href="adminMakeWineForm.do">와인 추가</a></button>
            <button><a href="adminWineView.do">와인 수정</a></button>
        </div>
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
							<td></td>
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
								<td title="${product.wineEx}"><div style="width: 500px; text-overflow:ellipsis;">${product.wineEx}</div></td>
								<td title="${product.brandEx }"><div style="width: 500px; text-overflow:ellipsis;">${product.brandEx}</div></td>
								<td>${product.price }</td>
								<td>${product.nation }</td>
								<td>${product.year }</td>
								<td>${product.matchFoodName }</td>
								<td>${product.temperature }</td>
								<td>${product.alcohol }</td>
								<td>${product.weight }</td>
								<td>${product.count }</td>
								<td><td><button><a href="">삭제</a></button></td></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
				<div class="paging">

					<c:if test="${productPage.hasProduct()}">
						<div>
							<a href="adminProduct.do?pageNum=1" class="pageNum">처음</a>

							<c:if test="${productPage.startPage > 5 }">
								<a href="adminProduct.do?pageNum=${productPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${productPage.startPage}"
								end="${productPage.endPage }">
								<a href="adminProduct.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${productPage.endPage < productPage.totalPages }">
								<a href="adminProduct.do?pageNum=${productPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>

							<a href="adminProduct.do?pageNum=${productPage.totalPages }"
								class="pageNum">마지막</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>