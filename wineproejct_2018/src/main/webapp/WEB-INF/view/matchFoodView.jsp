<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(function() {
	$('#basket').click(function() {
		var text = confirm("장바구니에 추가하시겠습니까?");
		if (text) {
			var count = $('#count').val();
			var total = ${matchFood.price} * count;
			location.href = "insertMatchFood.do?userId=${user.userId}&matchFoodId=${matchFood.matchFoodId}&productName=${matchFood.matchFoodName}&productPrice=${matchFood.price}&productCount="+count+"&productImg=${matchFood.img}&total="+total;	

		}
	});

});
</script>
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
		<tr>
			<td>${matchFood.matchFoodId }</td>
			<td>${matchFood.matchFoodName }</td>
			<td>${matchFood.price }</td>
			<td>${matchFood.nation }</td>
			<td>${matchFood.weight }</td>
			<td>${matchFood.img }</td>
			<td><input type="number" id="count" value="1">
			<td>${matchFood.wineImg }</td>
			<td>${matchFood.ex }</td>
		</tr>
	</table>
	<button id="basket">장바구니 추가</button>
</body>
</html>