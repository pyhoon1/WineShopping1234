<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<script>
	function deleteMatchFood(matchFoodId,matchFoodName,img) {
		if(confirm(matchFoodName+"을 삭제하시겠습니까?")){
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
					location.href="adminProduct.do?pageNum=1"
				}
			})
		}else{
			return false;
		}
	}
	</script>
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<h1>Welcome to admin page!</h1>
		<div class="buttons">
            <button><a href="adminMakeMatchFoodForm.do">제품 추가</a></button>
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
			<div class="user-list">
				<table>
					<thead>
						<tr>
							<td>번호</td>
							<td>음식 이름</td>
							<td>음식 가격</td>
							<td>원산지</td>
							<td>잘 맞는 와인</td>
							<td>중량</td>
							<td class="matchFoodEx">설명</td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="matchFood" items="${matchFoodPage.matchFoodList }">
							<tr>
								<td>${matchFood.matchFoodId }</td>
								<td>${matchFood.matchFoodName }</td>
								<td>${matchFood.price }</td>
								<td>${matchFood.nation }</td>
								<td>${matchFood.wine }</td>
								<td>${matchFood.weight }</td>
								<td title="${matchFood.ex }"><div style="width: 500px; text-overflow:ellipsis; overflow:hidden;">${matchFood.ex }</div></td>
								<td><button><a onclick="deleteMatchFood('${matchFood.matchFoodId}','${matchFood.matchFoodName}','${matchFood.img}')">삭제</a></button></td>
								<td><button><a href="adminmatchFoodUpdateForm.do?matchFoodId=${matchFood.matchFoodId}">수정</a></button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging">
					<c:if test="${matchFoodPage.hasProduct()}">
						<div>
							<c:if test="${matchFoodPage.startPage > 5 }">
								<a href="adminMatchFood.do?pageNum=${usertPage.startPage - 5  }"
									class="pageNum">이전</a>
							</c:if>

							<c:forEach var="pageNum" begin="${matchFoodPage.startPage}"
								end="${matchFoodPage.endPage }">
								<a href="adminMatchFood.do?pageNum=${pageNum}" class="pageNum">${pageNum}</a>
							</c:forEach>

							<c:if test="${matchFoodPage.endPage < matchFoodPage.totalPages }">
								<a href="adminMatchFood.do?pageNum=${matchFoodPage.startPage + 5 }"
									class="pageNum">다음</a>
							</c:if>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>