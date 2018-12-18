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
		<c:forEach var="payment" items="${paymentPage.paymentList}">

			<tr>
				<td>paymentId</td>
				<td>userId</td>
				<td>productId</td>
				<td>matchFoodId</td>
				<td>productName</td>
				<td>productPrice</td>
				<td>productImg</td>
				<td>matchFoodIdList</td>
				<td>matchFoodCount</td>
				<td>method</td>
				<td>pDay</td>
				<td>total</td>
			</tr>
			<tr>
				<td>제품</td>
				<td>${payment.paymentId}</td>
				<td>${payment.userId}</td>
				<td>${payment.productId}</td>
				<td>${payment.matchFoodId}</td>
				<td>${payment.productName}</td>
				<td>${payment.productPrice}</td>
				<td>${payment.productImg}</td>
				<td>${payment.matchFoodIdList}</td>
				<td>${payment.matchFoodCount}</td>
				<td>${payment.method}</td>
				<td>${payment.pDay}</td>
				<td>${payment.total}</td>
			</tr>

			<c:set value="matchFoodList${payment.paymentId}" var="matchFoodList" />
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
