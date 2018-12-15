<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Cardo" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/findId.css">
<title>Insert title here</title>
</head>
<body>
	<form action="userLoginIdFind.do" method="post" autocomplete=off>
        <div class="wrapper">
        	<a href="main.do"><img src="${pageContext.request.contextPath }/resources/img/Logo.png"></a>
            <table>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="userName" value="${param.userName}"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email" value="${param.email }"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="아이디찾기" id="submit"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>