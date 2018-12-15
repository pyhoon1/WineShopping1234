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
		<c:forEach var="basket" items="${basketPage.basketList }">
			<tr>
				<td>basketID</td>
				<td>userId</td>
				<td>productId</td>
				<td>productName</td>
				<td>productPrice</td>
				<td>productCount</td>
				<td>productImg</td>
				<td>matchFoodId</td>
				<td>matchFoodCount</td>
				<td>total</td>
				<td>matchFoodId</td>
				<td>matchFoodName</td>
				<td>price</td>
				<td>nation</td>
				<td>weight</td>
				<td>img</td>
				<td>wineImg</td>
				<td>ex</td>
			</tr>
			<tr>
				<td>제품</td>
				<td>${basket.basketId}</td>
				<td>${basket.userId}</td>
				<td>${basket.productId}</td>
				<td>${basket.productName}</td>
				<td>${basket.productPrice}</td>
				<td>${basket.productCount}</td>
				<td>${basket.productImg}</td>
				<td>${basket.matchFoodId}</td>
				<td>${basket.matchFoodCount}</td>
				<td>${basket.total}</td>
			</tr>

			<c:set value="matchFoodList${basket.basketId}" var="matchFoodList"/>
			<c:out value="${a }" />
			<c:forEach var="matchFood" items="${requestScope[matchFoodList]}">

				<tr>
					<td>matchFoodId</td>
					<td>matchFoodName</td>
					<td>price</td>
					<td>price</td>
					<td>nation</td>
					<td>weight</td>
					<td>img</td>
					<td>wineImg</td>
					<td>count</td>
					<td>ex</td>
				</tr>
				<tr>
					<td>${matchFood.matchFoodId }</td>
					<td>${matchFood.matchFoodName }</td>
					<td>${matchFood.price }</td>
					<td>${matchFood.nation }</td>
					<td>${matchFood.weight }</td>
					<td>${matchFood.img }</td>
					<td>${matchFood.wineImg }</td>
					<td>${matchFood.count }</td>
					<td>${matchFood.ex }</td>

				</tr>
			</c:forEach>
		</c:forEach>


	</table>

</body>
</html>
