<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Cardo"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/searchList.css">
<script>
	function SearchFame() {
		$('#arrangement').val('fame');

		if ($('#startPrice').val() == "" || $('#endPrice').val() == "") {
			location.href = "searchList.do?condition=" + $('#condition').val()
					+ "&conditionType=" + $('#conditionType').val()
					+ "&arrangement=" + $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		} else {
			location.href = "searchList.do?conditionType="
					+ $('#conditionType').val() + "&startPrice="
					+ $('#startPrice').val() + "&endPrice="
					+ $('#endPrice').val() + "&arrangement="
					+ $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		}

	}
	function SearchNewProduct() {
		$('#arrangement').val('newProduct');
		if ($('#startPrice').val() == "" || $('#endPrice').val() == "") {
			location.href = "searchList.do?condition=" + $('#condition').val()
					+ "&conditionType=" + $('#conditionType').val()
					+ "&arrangement=" + $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		} else {
			location.href = "searchList.do?conditionType="
					+ $('#conditionType').val() + "&startPrice="
					+ $('#startPrice').val() + "&endPrice="
					+ $('#endPrice').val() + "&arrangement="
					+ $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		}
	}

	function SearchCheap() {
		$('#arrangement').val('cheap');
		if ($('#startPrice').val() == "" || $('#endPrice').val() == "") {
			location.href = "searchList.do?condition=" + $('#condition').val()
					+ "&conditionType=" + $('#conditionType').val()
					+ "&arrangement=" + $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		} else {
			location.href = "searchList.do?conditionType="
					+ $('#conditionType').val() + "&startPrice="
					+ $('#startPrice').val() + "&endPrice="
					+ $('#endPrice').val() + "&arrangement="
					+ $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		}
	}
	function SearchExpenssive() {
		$('#arrangement').val('expenssive');
		if ($('#startPrice').val() == "" || $('#endPrice').val() == "") {
			location.href = "searchList.do?condition=" + $('#condition').val()
					+ "&conditionType=" + $('#conditionType').val()
					+ "&arrangement=" + $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		} else {
			location.href = "searchList.do?conditionType="
					+ $('#conditionType').val() + "&startPrice="
					+ $('#startPrice').val() + "&endPrice="
					+ $('#endPrice').val() + "&arrangement="
					+ $('#arrangement').val() + "&pageNum="
					+ $('#pageNum').val();
		}
	}
</script>
<title>검색 결과</title>
</head>
<body ondragstart="return false">
	<input type="hidden" id="condition" name="condition"
		value="${search.condition}">
	<input type="hidden" id="conditionType" name="conditionType"
		value="${search.conditionType}">
	<input type="hidden" id="startPrice" name="startPrice"
		value="${search.startPrice}">
	<input type="hidden" id="endPrice" name="endPrice"
		value="${search.endPrice}">
	<input type="hidden" id="arrangement" name="arrangement"
		value="${search.arrangement}">
	<input type="hidden" id="pageNum" name="pageNum"
		value="${param.pageNum }">
	<c:set value="${search.condition}" var="condition" />
	<c:set value="${search.conditionType}" var="conditionType" />
	<c:set value="${search.startPrice}" var="startPrice" />
	<c:set value="${search.endPrice}" var="endPrice" />
	<c:set value="${search.arrangement}" var="arrangement" />
	<c:set value="${param.pageNum}" var="pageNum" />


	<div class="main">
		<jsp:include page="../../header/header.jsp" />

		<div class="content">
			<div class="wrapper">
				<div class="sort">
					<ul>
						<li><a onclick="SearchFame()">인기 순</a></li>
						<li><a onclick="SearchNewProduct()">신상품 순</a></li>
						<li><a onclick="SearchCheap()">낮은 가격 순</a></li>
						<li><a onclick="SearchExpenssive()">높은 가격 순</a></li>
					</ul>
				</div>
				<div class="search-List">
					<c:if test="${productPage.productList.isEmpty() }">
						<span class="message">제품이 없습니다.</span>
					</c:if>
					<c:if test="${!productPage.productList.isEmpty() }">
						<ul>
							<c:forEach items="${productPage.productList}" var="product">
								<li>
									<div class="search-img">
										<a
											href="productView.do?productId=${product.productId}&pageNum=1"><img
											src="${product.img}"></a>
									</div>
									<div class="search-info">
										<div class="left">
											<span>${product.productName}</span> <span>${product.price}</span>
										</div>
										<div class="right">
											<span class="wineType"><img
												src="${pageContext.request.contextPath}/resources/img/miniWineImg/${product.wineKinds }.png"></span>
											<span class="wineNation"><img
												src="${product.nationImg}"></span>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<c:if test="${!productPage.productList.isEmpty() }">
					<c:if test="${productPage.hasProduct()}">
						<div class="paging">
							<!-- 이전 현재 지금 분기처리 -->
							<c:choose>
								<c:when test="${conditionType == 'price'}">
									<c:choose>
										<c:when test="${!empty arrangement}">
											<c:if test="${productPage.startPage > 5 }">
												<a
													href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=${productPage.startPage - 5  }"
													class="pageNum">이전</a>
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${productPage.startPage > 5 }">
												<a
													href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=${productPage.startPage - 5  }"
													class="pageNum">이전</a>
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${conditionType == 'wineKinds'}">
									<c:choose>
										<c:when test="${!empty arrangement}">
											<c:if test="${productPage.startPage > 5 }">
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${productPage.startPage > 5 }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage - 5  }"
													class="pageNum">이전</a>
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${conditionType == 'nation'}">
									<c:choose>
										<c:when test="${!empty arrangement}">
											<c:if test="${productPage.startPage > 5 }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage - 5  }"
													class="pageNum">이전</a>
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${productPage.startPage > 5 }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage - 5  }"
													class="pageNum">이전</a>
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${conditionType == 'search'}">
									<c:choose>
										<c:when test="${!empty arrangement}">
											<c:if test="${productPage.startPage > 5 }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage - 5  }"
													class="pageNum">이전</a>
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${productPage.startPage > 5 }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage - 5  }"
													class="pageNum">이전</a>
											</c:if>
											<c:forEach var="pageNum" begin="${productPage.startPage}"
												end="${productPage.endPage }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${pageNum}"
													class="pageNum">${pageNum}</a>
											</c:forEach>
											<c:if test="${productPage.endPage < productPage.totalPages }">
												<a
													href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage + 5 }"
													class="pageNum">다음</a>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:when>
							</c:choose>
							<!-- 마지막 분기처리 -->
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>