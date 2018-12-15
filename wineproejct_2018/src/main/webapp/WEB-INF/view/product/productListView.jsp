<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>

		<tr>
			<td>productId</td>
			<td>producer</td>
			<td>variety</td>
			<td>wineKinds</td>
			<td>productName</td>
			<td>wineEx</td>
			<td>brandEx</td>
			<td>price</td>
			<td>nation</td>
			<td>year</td>
			<td>stock</td>
			<td>matchFoodId</td>
			<td>img</td>
		</tr>

		<c:forEach var="productList" items="${productPage.productList }">
			<tr>
				<td><a
					href="productView.do?productId=${productList.productId}&pageNum=${param.pageNum}">${productList.productId }</a></td>
				<td>${productList.producer }</td>
				<td>${productList.variety }</td>
				<td>${productList.wineKinds }</td>
				<td>${productList.productName }</td>
				<td>${productList.wineEx }</td>
				<td>${productList.brandEx }</td>
				<td>${productList.price }</td>
				<td>${productList.nation }</td>
				<td>${productList.year }</td>
				<td>${productList.stock }</td>
				<td>${productList.matchFoodId }</td>
				<td>${productList.img }</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${productPage.hasProduct()}">
		<div>
			<a href="productList.do?pageNum=1" class="pageNum">처음</a>

			<c:if test="${productPage.startPage > 5 }">
				<a href="productList.do?pageNum=${productPage.startPage - 5  }"
					class="pageNum">이전</a>
			</c:if>

			<c:forEach var="pageNum" begin="${productPage.startPage}"
				end="${productPage.endPage }">
				<a href="productList.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
			</c:forEach>

			<c:if test="${productPage.endPage < productPage.totalPages }">
				<a href="productList.do?pageNum=${productPage.startPage + 5 }"
					class="pageNum">다음</a>
			</c:if>

			<a href="productList.do?pageNum=${productPage.totalPages }"
				class="pageNum">마지막</a>
		</div>
	</c:if>
</body>
</html>