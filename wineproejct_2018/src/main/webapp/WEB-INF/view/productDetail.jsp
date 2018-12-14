<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productDetail.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
        crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/javascript/productDetail.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="main">
	<jsp:include page="../header/header.jsp" />
	
	<div class="content">
            <div class="wrapper">
                <div class="product">
                    <img src="${product.img }">
                </div>
                <div class="container">
                    <div class="info">
                        <table>
                            <thead><strong>와인 제목</strong></thead>
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
                            <span>수량 : </span><input type="text" value=1 class="amount">
                            <button class="plus"><i class="far fa-plus-square"></i></button>
                            <button class="minus"><i class="far fa-minus-square"></i></button>
                        </div>
                        <div class="match-food-container">
                            <div class="match-food-list">
                            </div>
                        </div>
                        <div class="price">
                            <span>총 상품 금액 : 69,000</span>
                        </div>
                        <div class="payment-submit">
                            <button id="basket">장바구니에 추가</button>
                            <button id="buy">구매하기</button>
                        </div>
                    </div>
                </div>
                <div class="review">
                    <div class="write-review">
                        <form actino="wineDetail.html" method="post">
                            <textarea rows="4" cols="60" placeholder="50자 이하의 리뷰를 남겨주세요!" id="review-input"></textarea>
                            <button type="submit" id="review-input">작성</button>
                        </form>
                    </div>
                    <div class="paging">
                            <i class="fas fa-caret-left"></i>
                            <span>
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                            </span>
                            <i class="fas fa-caret-right"></i>
                        </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer/footer.jsp" />
    </div>
</body>
</html>