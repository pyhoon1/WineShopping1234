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
			<td>matchFoodId</td>
			<td>matchFoodName</td>
			<td>price</td>
			<td>nation</td>
			<td>weight</td>
			<td>img</td>
			<td>wineImg</td>
			<td>ex</td>
		</tr>

		<c:forEach var="matchFood" items="${matchFoodPage.matchFoodList }">
			<tr>
				<td><a
					href="getMatchFood.do?matchFoodId=${matchFood.matchFoodId }">${matchFood.matchFoodId}</a></td>
				<td>${matchFood.matchFoodName }</td>
				<td>${matchFood.price }</td>
				<td>${matchFood.nation }</td>
				<td>${matchFood.weight }</td>
				<td>${matchFood.img }</td>
				<td>${matchFood.wineImg }</td>
				<td>${matchFood.ex }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>