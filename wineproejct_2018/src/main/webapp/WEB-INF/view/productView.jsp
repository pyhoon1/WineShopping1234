<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var matchFood = "";
		var count = "";
		$('input:checkbox[name="matchFood"]').click(function() {
			if (this.checked) {
				matchFood += $(this).val() + ",";
				count += $('#count' + $(this).val()).val() + ",";
			} else {
				var matchFoodL = matchFood.split(',');
				var matchFoodId = matchFood.split(',', matchFoodL.length - 1);
				var matchFoodCount = count.split(',');
				for ( var i in matchFoodId) {
					if (matchFoodId[i] == $(this).val()) {
						matchFoodId.splice(i, 1);
						matchFoodCount.splice(i, 1);
					}
				}
				matchFood = "";
				count = "";
				for ( var i in matchFoodId) {
					console.log(matchFoodId[i])
					matchFood += matchFoodId[i] + ",";
					count += matchFoodCount[i] + ",";
				}
			}
		})
		$('#basket').click(function() {
			var text = confirm("장바구니에 추가하시겠습니까?");
			if (text) {
				var productCount = $('#productCount').val();
				var total = ${product.price} * productCount;
				if(matchFood == ""){
					location.href = "insertProduct.do?userId=${user.userId}&productId=${product.productId}&productName=${product.productName}&productPrice=${product.price}&productCount="+productCount+"&productImg=${product.img}&total="+total;	
				}else{
					location.href = "insertProductMatchFood.do?userId=${user.userId}&productId=${product.productId}&productName=${product.productName}&productPrice=${product.price}&productCount="+productCount+"&productImg=${product.img}&matchFoodIdList="+matchFood+"&matchFoodCount="+count+"&total="+total;
				}
				
				
			}
		})

		$('#payment').click(function() {

		})

	})
</script>
<title>Insert title here</title>
</head>
<body>
	<table>

		<tr>
			<td>${product.productId }</td>
			<td>${product.producer }</td>
			<td>${product.variety }</td>
			<td>${product.wineKinds }</td>
			<td>${product.productName }</td>
			<td>${product.wineEx }</td>
			<td>${product.brandEx }</td>
			<td>${product.price }</td>
			<td><input type="number" value="1" id="productCount"></td>
			<td>${product.nation }</td>
			<td>${product.year }</td>
			<td>${product.stock }</td>
			<td>${product.img }</td>
			<td>${product.weight }</td>
		</tr>
	</table>
	<table>
		<tr>
			<td>matchFoodId</td>
			<td>matchFoodName</td>
			<td>price</td>
			<td>nation</td>
			<td>img</td>
			<td>wineImg</td>
			<td>ex</td>
		</tr>
		<c:set var="count" value="0" />
		<c:forEach var="matchFood" items="${matchFoodList }">
			<tr>
				<td><input type="checkbox" value="${matchFood.matchFoodId}"
					name="matchFood"></td>
				<td>${matchFood.matchFoodName }</td>
				<td>${matchFood.price }</td>
				<td>${matchFood.nation }</td>
				<td>${matchFood.img }</td>
				<td>${matchFood.wineImg }</td>
				<td><input type="number" id="count${count+1}" value="1"
					name="count"></td>
				<td>${matchFood.ex}</td>
				<td>${matchFood.weight}</td>
				<c:set var="count" value="${count+1 }" />
			</tr>
		</c:forEach>

	</table>
	<button id="basket">장바구니</button>
	<button id="payment">구매</button>
</body>
</html>