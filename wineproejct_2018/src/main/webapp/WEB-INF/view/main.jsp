<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css" type="text/css">
<script src="${pageContext.request.contextPath }/javascript/main.js"></script>
<link href="https://fonts.googleapis.com/css?family=Cardo"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<jsp:include page="../header/header.jsp" />

		<div class="content">
			<table class="content-category">
				<tr class="nation">
					<td id="italy"><a href>이탈리아</a></td>
					<td id="germany"><a href>독일</a></td>
					<td id="france"><a href>프랑스</a></td>
					<td id="chile"><a href>스페인</a></td>
				</tr>
				<tr class="wineType">
					<td id="white"><a href>화이트 와인</a></td>
					<td id="red"><a href>레드 와인</a></td>
					<td id="rose"><a href>로제 와인</a></td>
					<td id="sparkle"><a href>스파클링 와인</a></td>
				</tr>
				<tr class="price">
					<td id="price1"><a href>1만 ~ 3만</a></td>
					<td id="price2"><a href>3만 ~ 5만</a></td>
					<td id="price3"><a href>5만 ~ 10만</a></td>
					<td id="price4"><a href>10만 ~ 20만</a></td>
				</tr>
			</table>

			<!-- 인기 있는 와인 목록 -->
			<div class="mainList">
				<h4>
					<i class="fas fa-wine-glass-alt"></i> 인기 있는 와인
				</h4>
				<ul class="wineList">
				<c:forEach items="${products }" var="products" >
					<li>
						<a href='wineDetail.html'><div class="wineImg">
								<img src="${products.img }">
							</div>
							<div class="left">
								<span class="wineName">${products.productName }</span> <span class="winePrice">${products.price }</span>
							</div>
							<div class="right">
								<span class="wineType"><img src="${products.wineKinds}"
									></span> <span class="wineNation"><img
									src="${products.nationImg}"></span>
							</div> 
						</a>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>

		<jsp:include page="../footer/footer.jsp" />
	</div>
</body>
</html>