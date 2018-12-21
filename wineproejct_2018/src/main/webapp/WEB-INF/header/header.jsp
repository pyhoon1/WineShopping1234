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
<script src="${pageContext.request.contextPath }/javascript/header.js"></script>
<script>
function SearchWine(){
	var conditionType = $('#conditionType').val();
	var condition = $('#condition').val();
	location.href="searchList.do?conditionType="+conditionType+"&condition="+condition+"&pageNum=1";	
}

$(function() {
	$('#myPage').click(function() {
		if($("#userId").val() == "") {
			alert("로그인을 해주세요.")
			return false;
		} else {
			return true;
		}
	})
})
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="userId" value="${user.userId }">
	<div class="header">
            <div class="logo">
                <a href="main.do"><img src="${pageContext.request.contextPath }/resources/img/Logo.png"></a>
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
                                            <li><a href="searchList.do?condition=이탈리아&conditionType=nation&pageNum=1">이탈리아</a></li>

                                        </div>
                                        <div>
                                             <li><a href="searchList.do?condition=독일&conditionType=nation&pageNum=1">독일</a></li>

                                        </div>
                                        <div>
                                            <li><a href="searchList.do?condition=프랑스&conditionType=nation&pageNum=1">프랑스</a></li>

                                        </div>
                                        <div>
                                            <li><a href="searchList.do?condition=스페인&conditionType=nation&pageNum=1">스페인</a></li>

                                        </div>
                                    </ul>
                                </div>
                                <div>
                                    <li id="type"><a href="#">종류별</a></li>
                                    <ul class="type-ul">
                                        <div>
                                            <li><a href="searchList.do?condition=화이트&conditionType=wineKinds&pageNum=1">화이트 와인</a></li>

                                        </div>
                                        <div>
                                            <li><a href="searchList.do?condition=레드&conditionType=wineKinds&pageNum=1">레드 와인</a></li>

                                        </div>
                                        <div>
                                            <li><a href="searchList.do?condition=로제&conditionType=wineKinds&pageNum=1">로제 와인</a></li>

                                        </div>
                                        <div>
                                            <li><a href="searchList.do?condition=스파클링&conditionType=wineKind&pageNum=1s">스파클링 와인</a></li>

                                        </div>
                                    </ul>
                                </div>
                                <div>
                                    <li id="price"><a href="#">가격 별</a></li>
                                    <ul class="price-ul">
                                        <div>
                                            <li><a href="searchList.do?&conditionType=price&startPrice=0&endPrice=50000&pageNum=1">~ 5만</a></li>
                                        </div>
                                        <div>
                                            <li><a href="searchList.do?&conditionType=price&startPrice=50000&endPrice=200000&pageNum=1">5만 ~ 20만</a></li>

                                        </div>
                                        <div>
                                            <li><a href="searchList.do?&conditionType=price&startPrice=200000&endPrice=500000&pageNum=1">20만 ~ 50만</a></li>

                                        </div>
                                        <div>
                                            <li><a href="searchList.do?&conditionType=price&startPrice=500000&endPrice=99999999999999999999&pageNum=1">50만 ~ </a></li>
                                        </div>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </li>
                    <li><c:if test="${user.userId == null }">
                    		<a href="#" id="login" class="border-right">Login</a>
                    	</c:if>
                    <c:if test="${user.userId != null }">
                    
                    	<a href="logout.do" id="login" class="border-right">Logout</a></c:if>
                        <span class="login-box">
                            <h3>로그인</h3>
                            <form action="login.do" method="post" autocomplete=off>
                                <div class="input-box"><input type="text" name="loginId"></div>
                                <div class="input-box"><input type="password" name="password"></div>
                                <input class="submit" type="submit" value="Login">
                            </form>
                                <div class="findBox">
                                    <button id="findId">아이디찾기</button>
                                    <button id="findPassword">비밀번호찾기</button>
                                </div>
                        </span>
                    </li>
                    <li><a href="signUpForm.do" class="border-right">Sign up</a> </li>
                    <li><a href="myPage.do?userId=${user.userId }" id="myPage">MyPage</a></li>
                    <li>
                        <div class="search-box">
                        	<input type="hidden" id="conditionType" name="conditionType" value="search">
                            <input class="search-txt" id="condition" type="text" name="search" placeholder="Search">
                            <a onclick="SearchWine()" class="search-btn"><i class="fas fa-search"></i></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
</body>
</html>