<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/searchList.css">
<script>
function SearchFame(){
	$('#arrangement').val('fame');	
	
	if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
		location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
		"&arrangement="+ $('#arrangement').val();		
	}else{
		location.href="searchList.do?conditionType="+$('#conditionType').val()+
		"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val();	
	}

}
function SearchNewProduct(){
	$('#arrangement').val('newProduct');		
	if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
		location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
		"&arrangement="+ $('#arrangement').val();		
	}else{
		location.href="searchList.do?conditionType="+$('#conditionType').val()+
		"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val();	
	}
}

function SearchCheap(){
	$('#arrangement').val('cheap');		
	if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
		location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
		"&arrangement="+ $('#arrangement').val();		
	}else{
		location.href="searchList.do?conditionType="+$('#conditionType').val()+
		"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val();	
	}
}
function SearchExpenssive(){
	$('#arrangement').val('expenssive');		
	if($('#startPrice').val() == "" || $('#endPrice').val() == ""){
		location.href="searchList.do?condition="+$('#condition').val()+"&conditionType="+$('#conditionType').val()+
		"&arrangement="+ $('#arrangement').val();		
	}else{
		location.href="searchList.do?conditionType="+$('#conditionType').val()+
		"&startPrice="+$('#startPrice').val()+"&endPrice="+$('#endPrice').val() +"&arrangement="+ $('#arrangement').val();	
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
    <div class="main">
        <jsp:include page="../../header/header.jsp" />
           
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
                    	<c:forEach items="${productList}" var="product">
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
                                    <span><a href="#"><img src="${product.nationImg}"></a></span>
                                    <span><a href="#">${product.wineKinds }</a></span>
                                </div>
                            </div>
                        </li>  
                                                    </c:forEach>          
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

        <jsp:include page="../../footer/footer.jsp" />
    </div>
</body>
</html>