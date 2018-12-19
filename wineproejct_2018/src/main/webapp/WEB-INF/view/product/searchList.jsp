<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/searchList.css">
<script>
		function SearchFame(){
			$('#arrangement').val('fame');	
			
			if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
				location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
				"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();		
			}else{
				location.href="searchList.do?conditionType="+$('#conditionType').val()+
				"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();	
			}
		
		}
		function SearchNewProduct(){
			$('#arrangement').val('newProduct');		
			if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
				location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
				"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();		
			}else{
				location.href="searchList.do?conditionType="+$('#conditionType').val()+
				"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();	
			}
		}
		
		function SearchCheap(){
			$('#arrangement').val('cheap');		
			if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
				location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
				"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();		
			}else{
				location.href="searchList.do?conditionType="+$('#conditionType').val()+
				"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();	
			}
		}
		function SearchExpenssive(){
			$('#arrangement').val('expenssive');		
			if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
				location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
				"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();		
			}else{
				location.href="searchList.do?conditionType="+$('#conditionType').val()+
				"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val()+"&pageNum="+$('#pageNum').val();	
			}
		}
		
</script>
<title>Insert title here</title>
</head>
<body ondragstart="return false">
<input type="hidden" id="condition" name="condition" value="${search.condition}">
<input type="hidden" id="conditionType" name="conditionType" value="${search.conditionType}">
<input type="hidden" id="startPrice" name="startPrice" value="${search.startPrice}">
<input type="hidden" id="endPrice" name="endPrice" value="${search.endPrice}">
<input type="hidden" id="arrangement" name="arrangement" value="${search.arrangement}">
<input type="hidden" id="pageNum" name="pageNum" value="${param.pageNum }">
<c:set value="${search.condition}" var="condition"/>
<c:set value="${search.conditionType}" var="conditionType"/>
<c:set value="${search.startPrice}" var="startPrice"/>
<c:set value="${search.endPrice}" var="endPrice"/>
<c:set value="${search.arrangement}" var="arrangement"/>
<c:set value="${param.pageNum}" var="pageNum"/>


    <div class="main">
        <div class="header">
            <div class="logo">
                <a href="mainPage.html"><img src="Logo.png"></a>
            </div>
            <div class="nav">
                <ul>
                    <li id="category"><a href="#" class="border-right">Category</a>
                        <div class="category-dropdown">
                            <ul>
                                <div>
                                    <li id="nation"><a href="#">나라 별</a></li>
                                    <ul class="nation-ul">
                                        <div>
                                            <li><a href="#">이탈리아</a></li>

                                        </div>
                                        <div><a href="#">
                                                <li><a href="#">독일</a></li>
                                            </a>
                                        </div>
                                        <div>
                                            <li><a href="#">프랑스</a></li>

                                        </div>
                                        <div>
                                            <li><a href="#">칠레</a></li>

                                        </div>
                                    </ul>
                                </div>
                                <div>
                                    <li id="type"><a href="#">종류별</a></li>
                                    <ul class="type-ul">
                                        <div>
                                            <li><a href="#">화이트 와인</a></li>

                                        </div>
                                        <div>
                                            <li><a href="#">레드 와인</a></li>

                                        </div>
                                        <div>
                                            <li><a href="#">로제 와인</a></li>

                                        </div>
                                        <div>
                                            <li><a href="#">스파클링 와인</a></li>

                                        </div>
                                    </ul>
                                </div>
                                <div>
                                    <li id="price"><a href="#">가격 별</a></li>
                                    <ul class="price-ul">
                                        <div><a href="#">
                                                <li><a href="#">1만 ~ 3만</a></li>
                                            </a>
                                        </div>
                                        <div>
                                            <li><a href="#">3만 ~ 5만</a></li>

                                        </div>
                                        <div>
                                            <li><a href="#">5만 ~ 10만</a></li>

                                        </div>
                                        <div>
                                            <li><a href="#">10만 ~ 30만</a></li>

                                        </div>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </li>
                    <li><a href="#" id="login" class="border-right">Login</a>
                        <span class="login-box">
                            <h3>로그인</h3>
                            <form action="login.jsp" method="post">
                                <div class="input-box"><input type="text"></div>
                                <div class="input-box"><input type="password"></div>
                                <input class="submit" type="submit" value="Login">
                            </form>
                        </span>
                    </li>
                    <li><a href="./signUp.html" class="border-right">Sign up</a> </li>
                    <li><a href="#">MyPage</a></li>
                    <li>
                        <div class="search-box">
                            <input class="search-txt" type="text" name="search" placeholder="Search">
                            <a href="#" class="search-btn"><i class="fas fa-search"></i></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="content">
            <div class="wrapper">
                <div class="sort">
                    <ul>
                        <li><a onclick="SearchFame()">인기 순</a></li>
                        <li><a onclick="SearchNewProduct()">신상품 순</a></li>
                        <li><a onclick="SearchCheap()">낮은 가격 순</a></li>
                        <li><a onclick="SearchExpenssive()">높은 가격 순</a></li>
                    </ul>
                </div>
                <div class="search-List">
                    <ul>
                    	<c:forEach items="${productPage.productList}" var="product">
                        <li>                   
                            <div class="search-img">
                                <a href="#"><img src="${product.img}"></a>
                            </div>
                            <div class="search-info">
                                <div class="left">
                                    <span><a href="#">${product.productName}</a></span>
                                    <span><a href="#">${product.price}</a></span>
                                </div>
                                <div class="right">
                                    <span><a href="#">${product.nation }</a></span>
                                    <span><a href="#">${product.wineKinds }</a></span>
                                </div>
                            </div>
                        </li>  
                                                    </c:forEach>          
                </div>
                <c:if test="${productPage.hasProduct()}">
		<div class="paging">
		
		<!-- 처음 (분기 처리)-->
			<c:choose>
			<c:when test="${conditionType == 'price'}">
						<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=1" class="pageNum">처음</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=1" class="pageNum">처음</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>
			<c:when test="${conditionType == 'wineKinds'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=1" class="pageNum">처음</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=1" class="pageNum">처음</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>	
			<c:when test="${conditionType == 'nation'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=1" class="pageNum">처음</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=1" class="pageNum">처음</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>	
			<c:when test="${conditionType == 'search'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=1" class="pageNum">처음</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=1" class="pageNum">처음</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>
			</c:choose>							
			<!-- 이전 현재 지금 분기처리 -->
			<c:choose>
			<c:when test="${conditionType == 'price'}">
						<c:choose>
						<c:when test="${!empty arrangement}">
								<c:if test="${productPage.startPage > 5 }">
									<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=${productPage.startPage - 5  }" class="pageNum">이전</a>
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${productPage.startPage > 5 }">
									<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=${productPage.startPage - 5  }" class="pageNum">이전</a>
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:otherwise>	
				</c:choose>	
			</c:when>
			<c:when test="${conditionType == 'wineKinds'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<c:if test="${productPage.startPage > 5 }">
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:when>
						<c:otherwise>
								<c:if test="${productPage.startPage > 5 }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage - 5  }" class="pageNum">이전</a>
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:otherwise>	
				</c:choose>	
			</c:when>	
			<c:when test="${conditionType == 'nation'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<c:if test="${productPage.startPage > 5 }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage - 5  }" class="pageNum">이전</a>
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:when>
						<c:otherwise>		
							<c:if test="${productPage.startPage > 5 }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage - 5  }" class="pageNum">이전</a>
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:otherwise>	
				</c:choose>	
			</c:when>	
			<c:when test="${conditionType == 'search'}">
				<c:choose>
						<c:when test="${!empty arrangement}">			
								<c:if test="${productPage.startPage > 5 }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage - 5  }" class="pageNum">이전</a>
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:when>
						<c:otherwise>
								<c:if test="${productPage.startPage > 5 }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage - 5  }" class="pageNum">이전</a>
								</c:if>
								<c:forEach var="pageNum" begin="${productPage.startPage}" end="${productPage.endPage }">
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${pageNum}" class="pageNum">${pageNum}</a>
								</c:forEach>
								<c:if test="${productPage.endPage < productPage.totalPages }">		
									<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.startPage + 5 }" class="pageNum">다음</a>
								</c:if>
						</c:otherwise>	
				</c:choose>	
			</c:when>
			</c:choose>		
			<!-- 마지막 분기처리 -->
			<c:choose>
			<c:when test="${conditionType == 'price'}">
						<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&arrangement=${arrangement}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?conditionType=${conditionType}&startPrice=${startPrice}&endPrice=${endPrice}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>
			<c:when test="${conditionType == 'wineKinds'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>	
			<c:when test="${conditionType == 'nation'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>	
			<c:when test="${conditionType == 'search'}">
				<c:choose>
						<c:when test="${!empty arrangement}">
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&arrangement=${arrangement}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:when>
						<c:otherwise>
							<a href="searchList.do?condition=${condition}&conditionType=${conditionType}&pageNum=${productPage.totalPages }" class="pageNum">마지막</a>
						</c:otherwise>	
				</c:choose>	
			</c:when>
			</c:choose>	
		</div>
	</c:if>
            </div>
        </div>

        <div class="footer">Footer</div>
    </div>
</body>
</html>