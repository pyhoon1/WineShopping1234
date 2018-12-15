<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script>
function warningReview(state,reviewId,userId){
	var information = {
			'state' : state,
			'reviewId' : reviewId,
			'userId' : userId
	}
	$.ajax({
		url : 'warningReview.do',
		type : 'POST',
		dataType : 'text',
		data : information,
		error : function(error) {
			console.log(error);
		},
		success : function() {
			location.href="adminReviewList.do";
		}

	})
	
}
function deleteReview(reviewId,userId){
	if(confirm("이 리뷰를 삭제하겠습니까?")){
		var information = {
				'reviewId' : reviewId,
				'userId' : userId
		}
		$.ajax({
			url : 'deleteReview.do',
			type : 'POST',
			dataType : 'text',
			data : information,
			error : function(error) {
				console.log(error);
			},
			success : function() {
				location.href="adminReviewList.do"
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
<table>
	<tr>
	<td>상품 명</td>
	<td>리뷰 내용</td>
	<td>유저 명</td>
	<td>리뷰 등록일자</td>
	<td>차단 여부</td>
</tr>
<c:set value="Y" var="state"/>
<c:forEach items="${reviewList.reviewList}" var="review">
	<tr>
		<td>${review.productName}</td>
		<td>${review.content }</td>
		<td>${review.loginId }</td>
		<td>${review.wdate }</td>
		<c:choose>
			<c:when test="${review.state == 'Y'}">		
					<td>X</td>
			</c:when>
			<c:otherwise>
				<td>O</td>
			</c:otherwise>
		</c:choose>	
		<c:choose> 
			<c:when test="${review.state == 'Y'}">		 
					<td>
						<button onclick="warningReview('N','${review.reviewId}','${review.userId }')">리뷰 차단</button>
					</td>
			</c:when>
			<c:otherwise>
					<td>
						<button onclick="warningReview('Y','${review.reviewId}','${review.userId }')">차단 해제</button>
			</c:otherwise>
		</c:choose>	
					<td><button onclick="deleteReview('${review.reviewId}','${review.userId}')">리뷰 삭제</button></td>
	</tr>
	
</c:forEach>
</table>
</body>
</html>