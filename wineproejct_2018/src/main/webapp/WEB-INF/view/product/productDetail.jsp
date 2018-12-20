<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/productDetail.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		var total = parseInt($('#totalPrice').text());

			
		$('.items .plus').click(function(){
	        var amount = parseInt($(this).prevAll('input').val());
	        amount += 1;
	        total +=  parseInt($('#matchFoodPrice').text())
	        $('#totalPrice').text(total);
	        $(this).prevAll('input').val(amount)
	     

	
	    })
	    $('.items .minus').click(function(){
	        var amount = parseInt($(this).prevAll('input').val());
	        if(amount == 0){
	            amount = 0
	        }else{
	            amount -= 1 
	            total -=  parseInt($('#matchFoodPrice').text())
		        $('#totalPrice').text(total);
	        }
	        $(this).prevAll('input').val(amount)
	          console.log(total);
	
	    })

	    // 와인 수량 늘리기/줄이기
	    $('.product-amount .plus').click(function(){
	        var amount = parseInt($(this).prevAll('input').val());
	        amount += 1
            total += parseInt(${product.price})
            $('#totalPrice').text(total);
	        $(this).prevAll('input').val(amount)
	          console.log(total);
	        console.log(amount)
	    })
	    $('.product-amount .minus').click(function(){
	        var amount = parseInt($(this).prevAll('input').val());
	        if(amount == 1){
	            amount = 1
	        }else{
	            amount -= 1
	            total -= ${product.price}
	            $('#totalPrice').text(total);
	        }
	        $(this).prevAll('input').val(amount)
	         console.log(total);
	        console.log(amount)
	    })

		$('#basket').click(function() {
			 var text = confirm("장바구니에 추가하시겠습니까?");
			 if($('#userId').val() != null){
			 	if (text) {
			 		var productCount = $('#productCount').val();
					
			 		var matchFoodCount = "";
					for(var i in matchFoodIdList){
						matchFoodCount += $('#matchFoodId'+matchFoodIdList[i]).val()+",";
						console.log(matchFoodCount)
					}
			 		location.href = "insertProductMatchFood.do?userId=${user.userId}&productId=${product.productId}&productName=${product.productName}&productPrice=${product.price}&productCount="+productCount+"&productImg=${product.img}&matchFoodIdList="+matchFoodIdList+"&matchFoodCount="+matchFoodCount+"&total="+total;
			 	}
			}else{
				alert("상품을 구매하려면 로그인을 해주세요.")
				return false;
				
			}
		 }) 

		$('#payment').click(function() {

		})

		$('#review-submit').click(function() {
			var content = $('#review-input').val();
			location.href = "reviewWrite.do?productId=${product.productId}&userId=${user.userId}&loginId=${user.loginId}&productName=${product.productName}&content="+ content;
		})
	
	})
</script>
<script
	src="${pageContext.request.contextPath }/javascript/productDetail.js"></script>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${user.userId }" id="userId">
	<div class="main">

		<jsp:include page="../../header/header.jsp" />

		<div class="content">
			<div class="wrapper">
				<div class="product">
					<img src="${product.img }">
				</div>
				<div class="container">
					<div class="info">
						<table>
							<thead>
								<strong>${product.productName }</strong>
							</thead>
							<tbody>
								<tr>
									<td>생산자</td>
									<td>${product.producer }</td>
								</tr>
								<tr>
									<td>품종</td>
									<td>${product.variety }</td>
								</tr>
								<tr>
									<td>와인 설명</td>
									<td>${product.wineEx }</td>
								</tr>
								<tr>
									<td>브랜드 설명</td>
									<td>${product.brandEx }</td>
								</tr>
								<tr>
									<td>원산지</td>
									<td>${product.nation }</td>
								</tr>
								<tr>
									<td>년도</td>
									<td>${product.year }</td>
								</tr>
								<tr>
									<td>도수</td>
									<td>${product.alcohol }</td>
								</tr>
								<tr>
									<td>용량</td>
									<td>${product.weight }</td>
								</tr>
								<tr>
									<td>온도</td>
									<td>${product.temperature }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="payment">
						<div class="product-amount">
							<span>수량 : </span><input type="text" value=1 class="amount"
								id="productCount">
							<button class="plus">
								<i class="far fa-plus-square"></i>
							</button>
							<button class="minus">
								<i class="far fa-minus-square"></i>
							</button>
						</div>
						<div class="match-food-container">
							<div class="match-food-list">
								<script>
									var matchFoodIdList = new Array();
								</script>
								<c:forEach var="matchFood" items="${matchFoodList }">
									<script>
										matchFoodIdList.push (${matchFood.matchFoodId});
										console.log(matchFoodIdList)
									</script>
									<div class="items">
										<img src="${match.img }">
										<div class="item-info">
											<span>${matchFood.matchFoodName}</span> <span
												id="matchFoodPrice">${matchFood.price }</span>
										</div>
										<div class="match-food-amount">
											<span id="item-amount"> <span>수량 : </span> <input
												type="text" value=0 id="matchFoodId${matchFood.matchFoodId}"
												class="amount">
												<button class="plus">
													<i class="far fa-plus-square"></i>
												</button>
												<button class="minus">
													<i class="far fa-minus-square"></i>
												</button>
											</span>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="price">
							총 상품 금액 : <span id="totalPrice">${product.price }</span>
						</div>
						<div class="payment-submit">
							<button id="basket">장바구니에 추가</button>
							<button id="buy">구매하기</button>
						</div>
					</div>
				</div>
				<div class="review">
					<div class="write-review">
						<textarea rows="4" cols="60" placeholder="50자 이하의 리뷰를 남겨주세요!"
							id="review-input"></textarea>
						<button type="submit" id="review-submit">작성</button>
					</div>
					<c:forEach var="review" items="${reviewPage.reviewList }">
						<c:set var="wdate" value="${review.wdate }" />
						<c:if test="${review.state == 'Y' }">
							<div class="review-list">
								<div class="review-header">
									<span><strong>${review.loginId }</strong></span> <a href="#"><i
										class="fas fa-edit"></i></a>
								</div>
								<textarea cols="55" rows="3" id="review-content" readonly>${review.content }</textarea>
								<span class="write-date"> ${fn:substring(wdate,0,10) } </span>
							</div>
						</c:if>
					</c:forEach>
					<div class="paging">
						<i class="fas fa-caret-left"></i> <span> <a href="#">1</a>
							<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
						</span> <i class="fas fa-caret-right"></i>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>