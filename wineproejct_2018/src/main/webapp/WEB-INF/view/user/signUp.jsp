<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/css/signUp.css">
    <link href="https://fonts.googleapis.com/css?family=Cardo" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/javascript/signUp.js"></script>
<title>회원가입 페이지</title>
</head>
<body>
 <div class="wrapper">
        <div class="main">
            <h1>회원가입</h1>
            <form id="myForm" action="signUp.do" method="post" autocomplete=off>
                <table>
                    <tr>
                        <td class="title">이름</td>
                        <td class="input"><input type="text" name="userName" placeholder="이름"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="title">아이디</td>
                        <td class="input"><input type="text" name="loginId" placeholder="아이디"><span class="alert">6~12자리로 입력해주세요</span></td>

                    </tr>
                    <tr>
                        <td class="title">비밀번호</td>
                        <td class="input"><input type="password" name="password" placeholder="비밀번호"><span class="alert">소문자, 대문자, 특수기호 포함 7자 이상 써주세요</span></td>

                    </tr>
                    <tr>
                        <td class="title">비밀번호 확인</td>
                        <td class="input"><input type="password" name="passwordConfirm" placeholder="비밀번호 확인"></td>
                    </tr>
                    <tr>
                        <td class="title">이메일</td>
                        <td class="input"><input type="email" name="email" placeholder="이메일"></td>

                    </tr>
                    <tr>
                        <td class="title">생년원일</td>
                        <td class="input"><input type="date" name="birth"></td>

                    </tr>
                    <tr>
                        <td class="title">휴대폰 번호</td>
                        <td class="input"><input type="text" name="phone" placeholder="010-1234-5678" title="010-####-####로 입력해주세요"></td>

                    </tr>
                    <tr>
                        <td class="title">주소</td>
                        <td class="input">
                            <input type="text" name="address" placeholder="주소를 입력해주세요">
                        </td>
                    </tr>
                </table>
                <div class="submit-box">
                    <input type="submit" value="회원가입" id="submit">
                    <button type="button" id="back">홈으로</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>